
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

@WebServlet("/jobs")
public class JobsServlet extends HttpServlet {

    private final ObjectMapper objectMapper = new ObjectMapper();
    
    
   
    @Override
   
  
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);

    	if (session == null || session.getAttribute("studentId") == null) {
    	    response.sendRedirect(
    	            request.getContextPath() + "/login.jsp");
    	    return;
    	}
    	

        URL url = new URL("http://localhost:8080/api/jobs");

        HttpURLConnection connection =
                (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("GET");
        connection.setConnectTimeout(5000);
        connection.setReadTimeout(5000);

        try {
            int status = connection.getResponseCode();

            if (status != HttpURLConnection.HTTP_OK) {
                throw new ServletException(
                        "Backend returned status: " + status);
            }

            try (InputStream input = connection.getInputStream()) {

                List<Map<String, Object>> jobs =
                        objectMapper.readValue(
                                input,
                                new TypeReference<List<Map<String, Object>>>() {}
                        );

                request.setAttribute("jobs", jobs);
            }

            request.getRequestDispatcher("/jobs.jsp")
                   .forward(request, response);

        } finally {
            connection.disconnect();
        }
    }
}
