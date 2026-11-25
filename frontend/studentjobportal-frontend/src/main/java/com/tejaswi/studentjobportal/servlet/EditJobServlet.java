
package com.tejaswi.studentjobportal.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/edit-job")
public class EditJobServlet extends HttpServlet {

@Override
protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    // 1. Check recruiter session
    HttpSession session = request.getSession(false);

    if (session == null
            || session.getAttribute("recruiterId") == null) {

        response.sendRedirect(
                request.getContextPath() + "/recruiter-login.jsp");
        return;
    }

    // 2. Get recruiter ID and job ID
    Long recruiterId =
            (Long) session.getAttribute("recruiterId");

    String jobId = request.getParameter("jobId");

    if (jobId == null || jobId.trim().isEmpty()) {
        response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Job ID is required");
        return;
    }

    // 3. Get updated details from the form
    JobUpdateData jobData = new JobUpdateData(
            request.getParameter("title"),
            request.getParameter("company"),
            request.getParameter("location"),
            request.getParameter("description"),
            request.getParameter("requiredSkills"),
            request.getParameter("jobType")
    );

    // 4. Convert Java object into JSON
    String json = objectMapper.writeValueAsString(jobData);

    // 5. Call Spring Boot PUT API
    URL url = new URL(
            "http://localhost:8080/api/jobs/"
            + jobId
            + "?recruiterId="
            + recruiterId);

    HttpURLConnection connection =
            (HttpURLConnection) url.openConnection();

    connection.setRequestMethod("PUT");
    connection.setDoOutput(true);

    connection.setRequestProperty(
            "Content-Type",
            "application/json; charset=UTF-8");

    // 6. Send JSON to backend
    try (OutputStream output = connection.getOutputStream()) {
        output.write(json.getBytes(StandardCharsets.UTF_8));
    }

    // 7. Check backend response
    int status = connection.getResponseCode();

    connection.disconnect();

    if (status == HttpURLConnection.HTTP_OK) {

        response.sendRedirect(
                request.getContextPath() + "/recruiter-jobs");

    } else {

        response.sendError(
                status,
                "Could not update job. Backend HTTP status: " + status);
    }
}

// Helper class for updated job data
private static class JobUpdateData {

    public String title;
    public String company;
    public String location;
    public String description;
    public String requiredSkills;
    public String jobType;

    public JobUpdateData(
            String title,
            String company,
            String location,
            String description,
            String requiredSkills,
            String jobType) {

        this.title = title;
        this.company = company;
        this.location = location;
        this.description = description;
        this.requiredSkills = requiredSkills;
        this.jobType = jobType;
    }
}


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
        

        // 2. Get job ID from the URL
        String jobId = request.getParameter("jobId");

        if (jobId == null || jobId.trim().isEmpty()) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Job ID is required");
            return;
        }

        // 3. Call Spring Boot to get job details
        Long recruiterId =
                (Long) session.getAttribute("recruiterId");

        URL url = new URL(
                "http://localhost:8080/api/jobs/"
                + jobId
                + "?recruiterId="
                + recruiterId);

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("GET");

        int status = connection.getResponseCode();

        if (status == HttpURLConnection.HTTP_OK) {

            // 4. Convert JSON into a Java Map
            Map<String, Object> job =
                    objectMapper.readValue(
                            connection.getInputStream(),
                            Map.class);

            // 5. Send job details to JSP
            request.setAttribute("job", job);

            request.getRequestDispatcher("/edit-job.jsp")
                    .forward(request, response);

        } else {

            response.sendError(
                    status,
                    "Could not load job details");
        }

        connection.disconnect();
    }
}
