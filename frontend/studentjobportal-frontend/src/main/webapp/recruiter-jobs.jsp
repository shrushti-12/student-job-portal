<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>My Jobs</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #eef5ff, #f8fbff);
            color: #1f2937;
            min-height: 100vh;
            padding-bottom: 50px;
        }

        /* Navbar-style header */
        body::before {
            content: "StudentJobPortal";
            display: block;
            background: #ffffff;
            color: #123a63;
            font-size: 22px;
            font-weight: bold;
            padding: 20px 7%;
            border-bottom: 1px solid #e5e7eb;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
        }

        h2 {
            text-align: center;
            color: #123a63;
            font-size: 32px;
            margin-top: 40px;
            margin-bottom: 10px;
        }

        body > p {
            text-align: center;
            color: #64748b;
            margin-bottom: 30px;
        }

        body > p strong {
            color: #2563eb;
        }

        hr {
            border: none;
            height: 1px;
            background: #e2e8f0;
            margin: 25px auto;
            max-width: 1100px;
        }

        /* Error message */
        p[style*="red"] {
            max-width: 1000px;
            margin: 20px auto;
            padding: 14px 18px;
            background: #fee2e2;
            color: #b91c1c !important;
            border: 1px solid #fecaca;
            border-radius: 10px;
            font-weight: 500;
        }

        /* Job cards */
        body > div {
            max-width: 1000px;
            margin: 25px auto;
            background: #ffffff;
            padding: 28px 32px;
            border-radius: 16px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 8px 25px rgba(15, 23, 42, 0.08);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        body > div:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.12);
        }

        h3 {
            color: #123a63;
            font-size: 24px;
            margin-bottom: 20px;
        }

        body > div p {
            margin: 10px 0;
            line-height: 1.6;
            color: #475569;
        }

        body > div p strong {
            color: #1e293b;
        }

        /* Buttons */
        form {
            display: inline-block;
            margin-top: 18px;
            margin-right: 10px;
        }

        button {
            border: none;
            padding: 11px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s ease;
        }

        form[action*="edit-job"] button {
            background: #2563eb;
            color: white;
        }

        form[action*="edit-job"] button:hover {
            background: #1d4ed8;
        }

        form[action*="delete-job"] button {
            background: #fee2e2;
            color: #b91c1c;
        }

        form[action*="delete-job"] button:hover {
            background: #fecaca;
        }

        /* Empty jobs message */
        body > p:not([style*="red"]) {
            line-height: 1.6;
        }

        /* Bottom navigation links */
        body > a {
            display: inline-block;
            margin: 8px 0 8px 7%;
            padding: 12px 22px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            transition: 0.2s ease;
        }

        body > a[href*="add-job"] {
            background: #2563eb;
            color: white;
        }

        body > a[href*="add-job"]:hover {
            background: #1d4ed8;
        }

        body > a[href*="recruiter-applications"] {
            background: #0f766e;
            color: white;
        }

        body > a[href*="recruiter-applications"]:hover {
            background: #115e59;
        }

        body > a[href*="recruiter-dashboard"] {
            background: #e2e8f0;
            color: #334155;
        }

        body > a[href*="recruiter-dashboard"]:hover {
            background: #cbd5e1;
        }

        /* Mobile */
        @media (max-width: 700px) {

            body::before {
                padding: 18px 5%;
                font-size: 20px;
            }

            h2 {
                font-size: 27px;
                margin-top: 30px;
            }

            body > div {
                margin: 20px 5%;
                padding: 22px;
            }

            h3 {
                font-size: 21px;
            }

            form {
                display: block;
                margin-right: 0;
            }

            form button {
                width: 100%;
            }

            body > a {
                display: block;
                margin: 10px 5%;
                text-align: center;
            }
        }

    </style>

</head>

<body>

    <h2>My Jobs</h2>

    <p>
        Welcome,
        <strong>${sessionScope.recruiterName}</strong>
    </p>

    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;">
            <%= request.getAttribute("error") %>
        </p>
    <% } %>

    <hr>

    <%

        java.util.List<java.util.Map<String, Object>> jobs =

            (java.util.List<java.util.Map<String, Object>>)

            request.getAttribute("jobs");

        if (jobs != null && !jobs.isEmpty()) {

    %>

        <% for (java.util.Map<String, Object> job : jobs) { %>

            <div>

                <h3>
                    <%= job.get("title") %>
                </h3>

                <p>
                    <strong>Company:</strong>
                    <%= job.get("company") %>
                </p>

                <p>
                    <strong>Location:</strong>
                    <%= job.get("location") %>
                </p>

                <p>
                    <strong>Job Type:</strong>
                    <%= job.get("jobType") %>
                </p>

                <p>
                    <strong>Required Skills:</strong>
                    <%= job.get("requiredSkills") %>
                </p>

                <p>
                    <strong>Description:</strong>
                    <%= job.get("description") %>
                </p>

                <form action="${pageContext.request.contextPath}/delete-job"
                      method="post">

                    <input type="hidden"
                           name="jobId"
                           value="<%= job.get("id") %>">

                    <button type="submit">Delete Job</button>

                </form>

                <form action="${pageContext.request.contextPath}/edit-job"
                      method="get">

                    <input type="hidden"
                           name="jobId"
                           value="<%= job.get("id") %>">

                    <button type="submit">Edit Job</button>

                </form>

                <hr>

            </div>

        <% } %>

    <%

        } else {

    %>

        <p>You have not posted any jobs yet.</p>

    <%

        }

    %>

    <br>

    <a href="${pageContext.request.contextPath}/add-job.jsp">
        Add New Job
    </a>

    <br><br>

    <br>

    <a href="${pageContext.request.contextPath}/recruiter-applications">
        Applications
    </a>

    <br>

    <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp">
        Back to Dashboard
    </a>

</body>

</html>