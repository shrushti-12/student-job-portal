package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view-resume")
public class ViewResumeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String studentId = request.getParameter("studentId");

        if (studentId == null || studentId.trim().isEmpty()) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Student ID is required.");
            return;
        }

        URL url = new URL(
                "http://localhost:8080/api/students/"
                + studentId
                + "/resume");

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("GET");
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(10000);

        try {

            int status = connection.getResponseCode();

            if (status == HttpURLConnection.HTTP_OK) {

                response.setContentType("application/pdf");

                String contentDisposition =
                        connection.getHeaderField("Content-Disposition");

                if (contentDisposition != null) {
                    response.setHeader(
                            "Content-Disposition",
                            contentDisposition);
                }

                try (InputStream input =
                             connection.getInputStream();
                     OutputStream output =
                             response.getOutputStream()) {

                    byte[] buffer = new byte[8192];

                    int bytesRead;

                    while ((bytesRead = input.read(buffer)) != -1) {
                        output.write(buffer, 0, bytesRead);
                    }

                    output.flush();
                }

            } else if (status == HttpURLConnection.HTTP_NOT_FOUND) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Resume not found.");

            } else {

                response.sendError(
                        HttpServletResponse.SC_BAD_GATEWAY,
                        "Could not retrieve resume. Backend status: "
                                + status);
            }

        } finally {
            connection.disconnect();
        }
    }
}