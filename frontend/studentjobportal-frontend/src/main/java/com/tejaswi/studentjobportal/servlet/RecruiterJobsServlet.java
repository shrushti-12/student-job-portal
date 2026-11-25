package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/recruiter-jobs")
public class RecruiterJobsServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Check recruiter session
        HttpSession session = request.getSession(false);

        if (session == null
                || session.getAttribute("recruiterId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-login.jsp");

            return;
        }

        // 2. Get logged-in recruiter ID
        Long recruiterId =
                (Long) session.getAttribute("recruiterId");

        // 3. Call Spring Boot API
        URL url = new URL(
                "http://localhost:8080/api/jobs/recruiter/"
                + recruiterId);

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("GET");

        int status = connection.getResponseCode();

        if (status == HttpURLConnection.HTTP_OK) {

            // 4. Convert JSON response → Java List
            List<Map<String, Object>> jobs =
                    objectMapper.readValue(
                            connection.getInputStream(),
                            new TypeReference<List<Map<String, Object>>>() {
                            });

            // 5. Send jobs to JSP
            request.setAttribute("jobs", jobs);

            request.getRequestDispatcher(
                    "/recruiter-jobs.jsp")
                    .forward(request, response);

        } else {

            request.setAttribute(
                    "error",
                    "Could not load your jobs. Backend returned HTTP "
                    + status);

            request.getRequestDispatcher(
                    "/recruiter-jobs.jsp")
                    .forward(request, response);
        }

        connection.disconnect();
    }
}