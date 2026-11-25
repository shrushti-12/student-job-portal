
package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Map<String, String> loginData = new HashMap<>();
        loginData.put("email", email);
        loginData.put("password", password);

        URL url = new URL("http://localhost:8080/api/students/login");

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(10000);

        connection.setRequestProperty(
                "Content-Type", "application/json; charset=UTF-8");

        try {
            try (OutputStream output = connection.getOutputStream()) {
                objectMapper.writeValue(output, loginData);
            }

            int status = connection.getResponseCode();

            if (status == HttpURLConnection.HTTP_OK) {

                Map<String, Object> student;

                try (InputStream input = connection.getInputStream()) {
                    student = objectMapper.readValue(
                            input,
                            new TypeReference<Map<String, Object>>() {});
                }

                Object id = student.get("id");
                Object name = student.get("name");
                Object studentEmail = student.get("email");

                if (id == null || name == null || studentEmail == null) {
                    response.sendError(
                            HttpServletResponse.SC_BAD_GATEWAY,
                            "Invalid backend response");
                    return;
                }

                // Create a fresh session after successful login
                HttpSession session = request.getSession(false);

                if (session != null) {
                    session.invalidate();
                }

                session = request.getSession(true);

                session.setAttribute("studentId", id);
                session.setAttribute("studentName", name.toString());
                session.setAttribute("studentEmail", studentEmail.toString());

                session.setMaxInactiveInterval(30 * 60);

                response.sendRedirect(
                        request.getContextPath() + "/jobs");

            } else if (status == HttpURLConnection.HTTP_UNAUTHORIZED
                    || status == HttpURLConnection.HTTP_BAD_REQUEST) {

                request.getSession().setAttribute(
                        "loginError",
                        "Invalid email or password. Please try again.");

                response.sendRedirect(
                        request.getContextPath() + "/login.jsp");

            } else {
                response.sendError(
                        HttpServletResponse.SC_BAD_GATEWAY,
                        "Login service is temporarily unavailable.");
            }

        } finally {
            connection.disconnect();
        }
    }
}
