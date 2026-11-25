package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/add-job")
public class AddJobServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get recruiter session
        HttpSession session = request.getSession(false);

        if (session == null
                || session.getAttribute("recruiterId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-login.jsp");

            return;
        }

        // 2. Get recruiter ID from session
        Long recruiterId =
                (Long) session.getAttribute("recruiterId");

        // 3. Get form values
        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String requiredSkills =
                request.getParameter("requiredSkills");
        String jobType = request.getParameter("jobType");

        // 4. Create JSON
        JobData jobData = new JobData(
                title,
                company,
                location,
                description,
                requiredSkills,
                jobType,
                recruiterId
        );

        String json =
                objectMapper.writeValueAsString(jobData);

        // 5. Call Spring Boot backend
        URL url = new URL(
                "http://localhost:8080/api/jobs");

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        connection.setRequestProperty(
                "Content-Type",
                "application/json; charset=UTF-8");

        // 6. Send JSON
        try (OutputStream output =
                     connection.getOutputStream()) {

            output.write(
                    json.getBytes(StandardCharsets.UTF_8));
        }

        // 7. Check backend response
        int status = connection.getResponseCode();

        if (status == HttpURLConnection.HTTP_CREATED) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-jobs");

        } else {

            request.setAttribute(
                    "error",
                    "Could not create job. Backend returned HTTP "
                    + status);

            request.getRequestDispatcher(
                    "/add-job.jsp")
                    .forward(request, response);
        }

        connection.disconnect();
    }

    // Object used to convert Java object → JSON
    private static class JobData {

        public String title;
        public String company;
        public String location;
        public String description;
        public String requiredSkills;
        public String jobType;
        public Long recruiterId;

        public JobData(String title,
                       String company,
                       String location,
                       String description,
                       String requiredSkills,
                       String jobType,
                       Long recruiterId) {

            this.title = title;
            this.company = company;
            this.location = location;
            this.description = description;
            this.requiredSkills = requiredSkills;
            this.jobType = jobType;
            this.recruiterId = recruiterId;
        }
    }
}