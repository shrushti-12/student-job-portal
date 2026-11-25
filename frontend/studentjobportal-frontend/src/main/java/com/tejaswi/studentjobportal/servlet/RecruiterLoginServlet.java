package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/recruiter-login")
public class RecruiterLoginServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create JSON request
        String json = objectMapper.writeValueAsString(
                new LoginData(email, password));

        URL url = new URL(
                "http://localhost:8080/api/recruiters/login");

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty(
                "Content-Type",
                "application/json; charset=UTF-8");

        // Send JSON to Spring Boot
        try (OutputStream output =
                     connection.getOutputStream()) {

            output.write(
                    json.getBytes(StandardCharsets.UTF_8));
        }

        int status = connection.getResponseCode();

        if (status == HttpURLConnection.HTTP_OK) {

            RecruiterResponse recruiter =
                    objectMapper.readValue(
                            connection.getInputStream(),
                            RecruiterResponse.class);

            // Create frontend session
            HttpSession session = request.getSession(true);

            session.setAttribute(
                    "recruiterId",
                    recruiter.id);

            session.setAttribute(
                    "recruiterName",
                    recruiter.name);

            session.setAttribute(
                    "recruiterEmail",
                    recruiter.email);

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-dashboard.jsp");

        } else if (status == HttpURLConnection.HTTP_UNAUTHORIZED) {

            request.setAttribute(
                    "error",
                    "Invalid email or password");

            request.getRequestDispatcher(
                    "/recruiter-login.jsp")
                    .forward(request, response);

        } else {

            request.setAttribute(
                    "error",
                    "Login failed. Backend returned HTTP "
                    + status);

            request.getRequestDispatcher(
                    "/recruiter-login.jsp")
                    .forward(request, response);
        }

        connection.disconnect();
    }

    // Data sent to backend
    private static class LoginData {

        public String email;
        public String password;

        public LoginData(String email, String password) {
            this.email = email;
            this.password = password;
        }
    }

    // Response received from backend
    private static class RecruiterResponse {

        public Long id;
        public String name;
        public String email;
    }
}