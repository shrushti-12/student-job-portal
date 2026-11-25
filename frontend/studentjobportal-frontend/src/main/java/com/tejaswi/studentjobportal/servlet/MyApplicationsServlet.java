
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

@WebServlet("/my-applications")
public class MyApplicationsServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException, ServletException {

        // 1. Check login
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // 2. Get logged-in student's ID
        Long studentId = Long.valueOf(
                session.getAttribute("studentId").toString());

        // 3. Call backend GET API
        URL url = new URL(
                "http://localhost:8080/api/applications/student/" + studentId);

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("GET");
        connection.setConnectTimeout(5000);
        connection.setReadTimeout(5000);
        connection.setRequestProperty("Accept", "application/json");

        try {
            int status = connection.getResponseCode();

            if (status != HttpURLConnection.HTTP_OK) {
                response.sendError(
                        HttpServletResponse.SC_BAD_GATEWAY,
                        "Could not load applications. Backend status: " + status);
                return;
            }

            // 4. Convert JSON array to Java List
            try (InputStream input = connection.getInputStream()) {

                List<Map<String, Object>> applications =
                        objectMapper.readValue(
                                input,
                                new TypeReference<List<Map<String, Object>>>() {});

                request.setAttribute("applications", applications);
            }

            // 5. Open JSP
            request.getRequestDispatcher("/my-applications.jsp")
                   .forward(request, response);

        } finally {
            connection.disconnect();
        }
    }
}
