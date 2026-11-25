package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.InputStream;
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

@WebServlet("/recruiter-applications")
public class RecruiterApplicationsServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check recruiter login
        if (session == null
                || session.getAttribute("recruiterId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-login.jsp");

            return;
        }

        Long recruiterId = Long.valueOf(
                session.getAttribute("recruiterId").toString());

        // Call Spring Boot backend
        URL url = new URL(
                "http://localhost:8080/api/applications/recruiter/"
                + recruiterId);

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("GET");
        connection.setConnectTimeout(5000);
        connection.setReadTimeout(5000);
        connection.setRequestProperty(
                "Accept", "application/json");

        try {

            int status = connection.getResponseCode();

            if (status == HttpURLConnection.HTTP_OK) {

                try (InputStream input =
                        connection.getInputStream()) {

                    List<Map<String, Object>> applications =
                            objectMapper.readValue(
                                    input,
                                    new TypeReference<List<Map<String, Object>>>() {
                                    });

                    request.setAttribute(
                            "applications",
                            applications);
                }

                request.getRequestDispatcher(
                        "/recruiter-applications.jsp")
                        .forward(request, response);

            } else {

                request.setAttribute(
                        "error",
                        "Could not load applications. Backend returned HTTP "
                                + status);

                request.getRequestDispatcher(
                        "/recruiter-applications.jsp")
                        .forward(request, response);
            }

        } finally {
            connection.disconnect();
        }
    }
}