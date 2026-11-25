package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete-job")
public class DeleteJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
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

        // 2. Get recruiter ID
        Long recruiterId =
                (Long) session.getAttribute("recruiterId");

        // 3. Get job ID
        String jobId = request.getParameter("jobId");

        if (jobId == null || jobId.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Job ID is required");

            return;
        }

        // 4. Call Spring Boot DELETE API
        URL url = new URL(
                "http://localhost:8080/api/jobs/"
                + jobId
                + "?recruiterId="
                + recruiterId);

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("DELETE");

        // 5. Get backend response
        int status = connection.getResponseCode();

        System.out.println("Delete Job API URL: " + url);
        System.out.println("Delete Job HTTP Status: " + status);

        // 6. If deletion successful
        if (status == HttpURLConnection.HTTP_OK
                || status == HttpURLConnection.HTTP_NO_CONTENT) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/recruiter-jobs");

        } else {

            response.sendError(
                    status,
                    "Could not delete job. Backend HTTP status: "
                    + status);
        }

        connection.disconnect();
    }
}