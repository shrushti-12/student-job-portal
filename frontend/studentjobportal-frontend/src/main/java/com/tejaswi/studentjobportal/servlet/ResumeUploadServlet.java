package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/upload-resume")
@MultipartConfig
public class ResumeUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check whether student is logged in
        if (session == null || session.getAttribute("studentId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        Object studentIdObject = session.getAttribute("studentId");

        int studentId = Integer.parseInt(
                studentIdObject.toString());

        // Get uploaded file
        Part filePart = request.getPart("resume");

        if (filePart == null || filePart.getSize() == 0) {

            session.setAttribute(
                    "resumeError",
                    "Please select a resume PDF.");

            response.sendRedirect(
                    request.getContextPath() + "/resume");

            return;
        }

        String contentType = filePart.getContentType();

        // Only PDF allowed
        if (!"application/pdf".equalsIgnoreCase(contentType)) {

            session.setAttribute(
                    "resumeError",
                    "Only PDF resumes are allowed.");

            response.sendRedirect(
                    request.getContextPath() + "/resume");

            return;
        }

        // Send file to Spring Boot backend
        URL url = new URL(
                "http://localhost:8080/api/students/"
                + studentId
                + "/resume");

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(10000);

        String boundary =
                "----StudentJobPortalBoundary";

        connection.setRequestProperty(
                "Content-Type",
                "multipart/form-data; boundary=" + boundary);

        try {

            try (OutputStream output =
                         connection.getOutputStream()) {

                output.write(
                        ("--" + boundary + "\r\n")
                                .getBytes());

                output.write(
                        ("Content-Disposition: form-data; "
                                + "name=\"resume\"; "
                                + "filename=\""
                                + filePart.getSubmittedFileName()
                                + "\"\r\n")
                                .getBytes());

                output.write(
                        "Content-Type: application/pdf\r\n\r\n"
                                .getBytes());

                try (InputStream input =
                             filePart.getInputStream()) {

                    byte[] buffer = new byte[8192];

                    int bytesRead;

                    while ((bytesRead =
                            input.read(buffer)) != -1) {

                        output.write(buffer, 0, bytesRead);
                    }
                }

                output.write("\r\n".getBytes());

                output.write(
                        ("--" + boundary + "--\r\n")
                                .getBytes());
            }

            int status = connection.getResponseCode();

            if (status == HttpURLConnection.HTTP_CREATED) {

                session.setAttribute(
                        "resumeSuccess",
                        "Resume uploaded successfully.");

            } else {

                String backendMessage = "";

                InputStream errorStream = connection.getErrorStream();

                if (errorStream != null) {

                    StringBuilder message = new StringBuilder();

                    byte[] buffer = new byte[1024];

                    int bytesRead;

                    while ((bytesRead = errorStream.read(buffer)) != -1) {
                        message.append(
                                new String(buffer, 0, bytesRead));
                    }

                    backendMessage = message.toString();
                }

                System.out.println("Resume upload failed.");
                System.out.println(
                        "Backend HTTP status: " + status);
                System.out.println(
                        "Backend response: " + backendMessage);

                session.setAttribute(
                        "resumeError",
                        "Resume upload failed. Backend status: "
                                + status);
            }

        } finally {

            connection.disconnect();
        }

        response.sendRedirect(
                request.getContextPath() + "/resume");
    }
}