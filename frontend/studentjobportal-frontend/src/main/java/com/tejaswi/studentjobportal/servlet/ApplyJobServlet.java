package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.Map;

@WebServlet("/apply-job")
public class ApplyJobServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException, NumberFormatException {

        // 1. Check login session
        HttpSession session = request.getSession(false);

        if (session == null
                || session.getAttribute("studentId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        try {

            // 2. Get logged-in student's ID
            Long studentId = Long.valueOf(
                    session.getAttribute("studentId").toString());

            // 3. Get selected job ID
            Long jobId = Long.valueOf(
                    request.getParameter("jobId"));

            if (studentId <= 0 || jobId <= 0) {
                throw new IllegalArgumentException("Invalid ID");
            }

            /*
             * 4. Check whether student has uploaded a resume
             */
            URL resumeUrl = new URL(
                    "http://localhost:8080/api/students/"
                    + studentId
                    + "/resume/exists");

            HttpURLConnection resumeConnection =
                    (HttpURLConnection) resumeUrl.openConnection();

            try {

                resumeConnection.setRequestMethod("GET");
                resumeConnection.setConnectTimeout(5000);
                resumeConnection.setReadTimeout(5000);

                int resumeStatus =
                        resumeConnection.getResponseCode();

                if (resumeStatus == HttpURLConnection.HTTP_OK) {

                    try (InputStream input =
                                 resumeConnection.getInputStream()) {

                    	StringBuilder responseText = new StringBuilder();

                    	byte[] buffer = new byte[1024];

                    	int bytesRead;

                    	while ((bytesRead = input.read(buffer)) != -1) {
                    	    responseText.append(
                    	            new String(
                    	                    buffer,
                    	                    0,
                    	                    bytesRead,
                    	                    StandardCharsets.UTF_8));
                    	}

                    	String result = responseText.toString();

                        boolean resumeExists =
                                Boolean.parseBoolean(result);

                        if (!resumeExists) {

                            session.setAttribute(
                                    "applicationMessage",
                                    "Please upload your resume before applying.");

                            response.sendRedirect(
                                    request.getContextPath()
                                    + "/resume");

                            return;
                        }
                    }

                } else {

                    session.setAttribute(
                            "applicationMessage",
                            "Unable to check your resume. Please try again.");

                    response.sendRedirect(
                            request.getContextPath() + "/jobs");

                    return;
                }

            } finally {

                resumeConnection.disconnect();
            }


            /*
             * 5. Prepare application request
             */
            Map<String, Long> data =
                    new HashMap<>();

            data.put("studentid", studentId);
            data.put("jobid", jobId);

            String json =
                    objectMapper.writeValueAsString(data);


            /*
             * 6. Connect to Spring Boot application API
             */
            URL url = new URL(
                    "http://localhost:8080/api/applications");

            HttpURLConnection connection =
                    (HttpURLConnection) url.openConnection();

            try {

                connection.setRequestMethod("POST");

                connection.setConnectTimeout(5000);
                connection.setReadTimeout(5000);

                connection.setDoOutput(true);

                connection.setRequestProperty(
                        "Content-Type",
                        "application/json; charset=UTF-8");


                /*
                 * 7. Send application JSON
                 */
                try (OutputStream output =
                             connection.getOutputStream()) {

                    output.write(
                            json.getBytes(
                                    StandardCharsets.UTF_8));
                }


                /*
                 * 8. Check backend response
                 */
                int status =
                        connection.getResponseCode();

                if (status == HttpURLConnection.HTTP_CREATED) {

                    session.setAttribute(
                            "applicationMessage",
                            "Application submitted successfully!");

                } else if (status == HttpURLConnection.HTTP_CONFLICT) {

                    session.setAttribute(
                            "applicationMessage",
                            "You have already applied for this job.");

                } else {

                    session.setAttribute(
                            "applicationMessage",
                            "Application failed. Backend status: "
                            + status);
                }

            } finally {

                connection.disconnect();
            }

        } catch (IllegalArgumentException e) {

            session.setAttribute(
                    "applicationMessage",
                    "Invalid student or job ID.");
        }

        /*
         * 9. Return to Jobs page
         */
        response.sendRedirect(
                request.getContextPath() + "/jobs");
    }
}