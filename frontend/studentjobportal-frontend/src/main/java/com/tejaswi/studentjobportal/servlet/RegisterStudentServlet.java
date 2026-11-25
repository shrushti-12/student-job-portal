
package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register-student")
public class RegisterStudentServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String skills = request.getParameter("skills");
        String password = request.getParameter("password");

        Map<String, String> student = new HashMap<>();

        student.put("name", name);
        student.put("email", email);
        student.put("skill", skills);
        student.put("password", password);

        URL url = new URL("http://localhost:8080/api/students");

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(10000);

        connection.setRequestProperty(
                "Content-Type",
                "application/json; charset=UTF-8");

        try {

            try (OutputStream output = connection.getOutputStream()) {
                objectMapper.writeValue(output, student);
            }

            int status = connection.getResponseCode();

            // ==========================
            // SUCCESS
            // ==========================

            if (status == HttpURLConnection.HTTP_CREATED) {

                request.getSession().removeAttribute("registrationError");

                request.getSession().setAttribute(
                        "registrationSuccess",
                        true);

                response.sendRedirect(
                        request.getContextPath()
                        + "/index.jsp");

            }

            // ==========================
            // EMAIL ALREADY EXISTS
            // ==========================

            else if (status == HttpURLConnection.HTTP_CONFLICT) {

                request.getSession().removeAttribute("registrationSuccess");

                request.getSession().setAttribute(
                        "registrationError",
                        "This email is already registered. Please use another email.");

                response.sendRedirect(
                        request.getContextPath()
                        + "/index.jsp");

            }

            // ==========================
            // BAD REQUEST
            // ==========================

            else if (status == HttpURLConnection.HTTP_BAD_REQUEST) {

                request.getSession().removeAttribute("registrationSuccess");

                request.getSession().setAttribute(
                        "registrationError",
                        "Please check your registration details.");

                response.sendRedirect(
                        request.getContextPath()
                        + "/index.jsp");

            }

            // ==========================
            // OTHER ERROR
            // ==========================

            else {

                request.getSession().removeAttribute("registrationSuccess");
                request.getSession().removeAttribute("registrationError");

                response.sendError(
                        HttpServletResponse.SC_BAD_GATEWAY,
                        "Registration failed. Backend HTTP status: "
                        + status);
            }

        } finally {

            connection.disconnect();
        }
    }
    }

