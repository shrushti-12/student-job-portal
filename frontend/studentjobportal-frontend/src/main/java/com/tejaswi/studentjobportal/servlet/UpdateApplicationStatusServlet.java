package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update-application-status")
public class UpdateApplicationStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null
                || session.getAttribute("recruiterId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-login.jsp");
            return;
        }

        String applicationId =
                request.getParameter("applicationId");

        String status =
                request.getParameter("status");

        if (applicationId == null
                || applicationId.trim().isEmpty()
                || status == null
                || status.trim().isEmpty()) {

            session.setAttribute(
                    "applicationMessage",
                    "Application ID and status are required.");

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-applications");

            return;
        }

        Long recruiterId =
                Long.valueOf(
                        session.getAttribute("recruiterId").toString());

        String encodedStatus =
                URLEncoder.encode(
                        status,
                        StandardCharsets.UTF_8.toString());

        URL url = new URL(
                "http://localhost:8080/api/applications/"
                + applicationId
                + "/status?recruiterId="
                + recruiterId
                + "&status="
                + encodedStatus);

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        try {

            connection.setRequestMethod("PUT");
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);
            connection.setDoOutput(true);

            connection.setRequestProperty(
                    "Content-Type",
                    "application/json");

            try (OutputStream output =
                         connection.getOutputStream()) {

                output.write(new byte[0]);
            }

            int responseCode =
                    connection.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {

                session.setAttribute(
                        "applicationMessage",
                        "Application status updated successfully.");

            } else if (responseCode == HttpURLConnection.HTTP_NOT_FOUND) {

                session.setAttribute(
                        "applicationMessage",
                        "Application not found.");

            } else if (responseCode == HttpURLConnection.HTTP_CONFLICT) {

                session.setAttribute(
                        "applicationMessage",
                        "You are not allowed to update this application.");

            } else {

                session.setAttribute(
                        "applicationMessage",
                        "Status update failed. Backend status: "
                        + responseCode);
            }

        } finally {
            connection.disconnect();
        }

        response.sendRedirect(
                request.getContextPath()
                + "/recruiter-applications");
    }
}