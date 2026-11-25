<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Applications | Student Job Portal</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #1e293b;
        }

        /* NAVBAR */

        .navbar {
            height: 70px;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }

        .logo {
            font-size: 22px;
            font-weight: bold;
            color: #123b68;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            text-decoration: none;
            color: #475569;
            font-size: 15px;
            font-weight: 600;
        }

        .nav-links a:hover {
            color: #2563eb;
        }

        .nav-links .active {
            color: #2563eb;
        }

        .logout-btn {
            background: #2563eb;
            color: white !important;
            padding: 10px 18px;
            border-radius: 7px;
        }

        /* HERO */

        .hero {
            background: linear-gradient(135deg, #123b68, #2563eb);
            color: white;
            padding: 45px 7%;
        }

        .hero h1 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 16px;
            opacity: 0.9;
        }

        /* MAIN */

        .container {
            width: 86%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .welcome {
            margin-bottom: 25px;
        }

        .welcome h2 {
            font-size: 24px;
            color: #123b68;
            margin-bottom: 7px;
        }

        .welcome p {
            color: #64748b;
        }

        /* ERROR */

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 25px;
        }

        /* APPLICATION CARD */

        .application-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 5px 18px rgba(15, 23, 42, 0.08);
            border: 1px solid #e5e7eb;
        }

        .application-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 20px;
        }

        .applicant-name {
            font-size: 21px;
            font-weight: bold;
            color: #123b68;
            margin-bottom: 6px;
        }

        .applicant-email {
            color: #64748b;
            font-size: 14px;
        }

        .status {
            padding: 7px 14px;
            border-radius: 20px;
            background: #dbeafe;
            color: #1d4ed8;
            font-size: 13px;
            font-weight: bold;
        }

        .details {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 22px;
        }

        .detail-box {
            background: #f8fafc;
            padding: 15px;
            border-radius: 8px;
        }

        .detail-label {
            display: block;
            font-size: 12px;
            color: #64748b;
            margin-bottom: 5px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .detail-value {
            color: #1e293b;
            font-size: 14px;
            font-weight: 600;
        }

        /* ACTIONS */

        .actions {
            display: flex;
            gap: 12px;
            align-items: center;
            border-top: 1px solid #e5e7eb;
            padding-top: 20px;
        }

        .resume-btn {
            background: #123b68;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 600;
        }

        .resume-btn:hover {
            background: #0f3155;
        }

        .status-form {
            display: flex;
            gap: 8px;
            margin-left: auto;
        }

        .status-form select {
            padding: 9px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            background: white;
            font-size: 14px;
        }

        .update-btn {
            border: none;
            background: #2563eb;
            color: white;
            padding: 9px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        .update-btn:hover {
            background: #1d4ed8;
        }

        /* EMPTY */

        .empty {
            background: white;
            text-align: center;
            padding: 60px 20px;
            border-radius: 12px;
            box-shadow: 0 5px 18px rgba(15, 23, 42, 0.06);
        }

        .empty h3 {
            color: #123b68;
            margin-bottom: 10px;
        }

        .empty p {
            color: #64748b;
        }

        /* FOOTER */

        footer {
            margin-top: 60px;
            background: #123b68;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 13px;
        }

        /* RESPONSIVE */

        @media (max-width: 800px) {

            .navbar {
                padding: 0 4%;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 13px;
            }

            .container {
                width: 92%;
            }

            .details {
                grid-template-columns: 1fr;
            }

            .application-header {
                flex-direction: column;
            }

            .actions {
                flex-direction: column;
                align-items: stretch;
            }

            .status-form {
                margin-left: 0;
            }

        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp"
       class="logo">
        StudentJobPortal
    </a>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/add-job.jsp">
            Post Job
        </a>

        <a href="${pageContext.request.contextPath}/recruiter-jobs">
            My Jobs
        </a>

        <a href="${pageContext.request.contextPath}/recruiter-applications"
           class="active">
            Applications
        </a>

        <a href="${pageContext.request.contextPath}/recruiter-profile.jsp">
            Profile
        </a>

        <form action="${pageContext.request.contextPath}/recruiter-logout"
              method="post"
              style="display:inline;">

            <button type="submit" class="logout-btn">
                Logout
            </button>

        </form>

    </div>

</nav>


<!-- HERO -->

<section class="hero">

    <h1>Applications</h1>

    <p>
        Review candidates who have applied for your job openings.
    </p>

</section>


<!-- MAIN -->

<div class="container">

    <div class="welcome">

        <h2>
            Candidate Applications
        </h2>

        <p>
            Welcome,
            <strong>${sessionScope.recruiterName}</strong>
        </p>

    </div>


    <!-- ERROR -->

    <% if (request.getAttribute("error") != null) { %>

        <div class="error">
            <%= request.getAttribute("error") %>
        </div>

    <% } %>


    <%

        java.util.List<java.util.Map<String, Object>> applications =
            (java.util.List<java.util.Map<String, Object>>)
            request.getAttribute("applications");

        if (applications != null && !applications.isEmpty()) {

        	for (java.util.Map<String, Object> app : applications) {

        	    java.util.Map<String, Object> student =
        	        (java.util.Map<String, Object>)
        	        app.get("student");

        	    java.util.Map<String, Object> job =
        	        (java.util.Map<String, Object>)
        	        app.get("job");

    %>


    <!-- APPLICATION CARD -->

    <div class="application-card">

        <div class="application-header">

            <div>

                <div class="applicant-name">

                    <%= student != null
                        ? student.get("name")
                        : "Applicant" %>

                </div>

                <div class="applicant-email">

                    <%= student != null
                        ? student.get("email")
                        : "Email not available" %>

                </div>

            </div>

            <span class="status">

                <%= app.get("status") %>

            </span>

        </div>


        <!-- DETAILS -->

        <div class="details">

            <div class="detail-box">

                <span class="detail-label">
                    Applied For
                </span>

                <span class="detail-value">

                    <%= job != null
                        ? job.get("title")
                        : "Job not available" %>

                </span>

            </div>


            <div class="detail-box">

                <span class="detail-label">
                    Company
                </span>

                <span class="detail-value">

                    <%= job != null
                        ? job.get("company")
                        : "Not available" %>

                </span>

            </div>


            <div class="detail-box">

                <span class="detail-label">
                    Applied Date
                </span>

                <span class="detail-value">

                    <%= app.get("appliedAt") %>

                </span>

            </div>

        </div>


        <!-- ACTIONS -->

        <div class="actions">

           <a href="${pageContext.request.contextPath}/view-resume?studentId=<%= student.get("id") %>"
   class="resume-btn"
   target="_blank">
    View Resume
</a>


           <form action="${pageContext.request.contextPath}/update-application-status"
      method="post"
      class="status-form">

    <input type="hidden"
           name="applicationId"
           value="<%= app.get("id") %>">

    <select name="status">
        <option value="Applied"
            <%= "Applied".equals(app.get("status")) ? "selected" : "" %>>
            Applied
        </option>

        <option value="Shortlisted"
            <%= "Shortlisted".equals(app.get("status")) ? "selected" : "" %>>
            Shortlisted
        </option>

        <option value="Interview"
            <%= "Interview".equals(app.get("status")) ? "selected" : "" %>>
            Interview
        </option>

        <option value="Selected"
            <%= "Selected".equals(app.get("status")) ? "selected" : "" %>>
            Selected
        </option>

        <option value="Rejected"
            <%= "Rejected".equals(app.get("status")) ? "selected" : "" %>>
            Rejected
        </option>
    </select>

    <button type="submit" class="update-btn">
        Update Status
    </button>

</form>

        </div>

    </div>


    <%

            }

        } else {

    %>


    <!-- EMPTY STATE -->

    <div class="empty">

        <h3>
            No applications yet
        </h3>

        <p>
            Applications from students will appear here when they apply
            for your jobs.
        </p>

    </div>


    <%

        }

    %>

</div>


<footer>

    © 2026 StudentJobPortal. All rights reserved.

</footer>


</body>
</html>