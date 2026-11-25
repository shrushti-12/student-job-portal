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

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/recruiter-register")
public class RecruiterRegisterServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String json = objectMapper.writeValueAsString(
                new RecruiterRegistrationData(
                        name,
                        email,
                        password));

        URL url = new URL(
                "http://localhost:8080/api/recruiters/register");

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        connection.setRequestProperty(
                "Content-Type",
                "application/json; charset=UTF-8");

        try (OutputStream output =
                     connection.getOutputStream()) {

            output.write(
                    json.getBytes(StandardCharsets.UTF_8));
        }

        int status = connection.getResponseCode();

        if (status == HttpURLConnection.HTTP_CREATED) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-login.jsp");

        } else if (status == HttpURLConnection.HTTP_CONFLICT) {

            request.setAttribute(
                    "error",
                    "Recruiter email already registered.");

            request.getRequestDispatcher(
                    "/recruiter-register.jsp")
                    .forward(request, response);

        } else {

            request.setAttribute(
                    "error",
                    "Registration failed. Backend returned HTTP "
                    + status);

            request.getRequestDispatcher(
                    "/recruiter-register.jsp")
                    .forward(request, response);
        }

        connection.disconnect();
    }

    private static class RecruiterRegistrationData {

        public String name;
        public String email;
        public String password;

        public RecruiterRegistrationData(
                String name,
                String email,
                String password) {

            this.name = name;
            this.email = email;
            this.password = password;
        }
    }
}