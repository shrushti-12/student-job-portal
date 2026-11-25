<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Job</title>

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

        /* Header */
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

        /* Main heading */
        h2 {
            text-align: center;
            color: #123a63;
            font-size: 32px;
            margin-top: 40px;
            margin-bottom: 25px;
        }

        /* Form card */
        form {
            width: 90%;
            max-width: 650px;
            margin: 0 auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.10);
            border: 1px solid #e5e7eb;
        }

        /* Labels */
        label {
            display: block;
            font-weight: bold;
            color: #334155;
            margin-bottom: 8px;
        }

        /* Inputs */
        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1e293b;
            background: #ffffff;
            outline: none;
            transition: 0.2s ease;
        }

        input[type="text"]:focus,
        textarea:focus,
        select:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }

        textarea {
            resize: vertical;
            min-height: 130px;
            line-height: 1.5;
        }

        select {
            cursor: pointer;
        }

        /* Update button */
        button {
            width: 100%;
            margin-top: 8px;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: #2563eb;
            color: #ffffff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s ease;
        }

        button:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }

        /* Job unavailable message */
        body > p {
            width: 90%;
            max-width: 650px;
            margin: 0 auto;
            padding: 18px;
            text-align: center;
            background: #fff7ed;
            color: #c2410c;
            border: 1px solid #fed7aa;
            border-radius: 10px;
        }

        /* Back link */
        body > a {
            display: block;
            width: fit-content;
            margin: 25px auto 0;
            padding: 12px 22px;
            background: #e2e8f0;
            color: #334155;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            transition: 0.2s ease;
        }

        body > a:hover {
            background: #cbd5e1;
            transform: translateY(-1px);
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

            form {
                width: 92%;
                padding: 25px 20px;
            }

            input[type="text"],
            textarea,
            select {
                font-size: 14px;
            }

            body > a {
                width: 92%;
                text-align: center;
            }
        }

    </style>

</head>

<body>

    <h2>Edit Job</h2>

    <%

        java.util.Map<String, Object> job =

            (java.util.Map<String, Object>)

            request.getAttribute("job");

    %>

    <% if (job != null) { %>

        <form action="${pageContext.request.contextPath}/edit-job"
              method="post">

            <input type="hidden"
                   name="jobId"
                   value="<%= job.get("id") %>">

            <label>Job Title:</label>

            <input type="text" name="title"
                   value="<%= job.get("title") %>" required>

            <br><br>

            <label>Company:</label>

            <input type="text" name="company"
                   value="<%= job.get("company") %>" required>

            <br><br>

            <label>Location:</label>

            <input type="text" name="location"
                   value="<%= job.get("location") %>" required>

            <br><br>

            <label>Description:</label>

            <br>

            <textarea name="description"
                      rows="5" cols="40"
                      required><%= job.get("description") %></textarea>

            <br><br>

            <label>Required Skills:</label>

            <input type="text" name="requiredSkills"
                   value="<%= job.get("requiredSkills") %>" required>

            <br><br>

            <label>Job Type:</label>

            <select name="jobType" required>

                <option value="Full Time"
                    <%= "Full Time".equals(job.get("jobType")) ? "selected" : "" %>>
                    Full Time
                </option>

                <option value="Part Time"
                    <%= "Part Time".equals(job.get("jobType")) ? "selected" : "" %>>
                    Part Time
                </option>

                <option value="Internship"
                    <%= "Internship".equals(job.get("jobType")) ? "selected" : "" %>>
                    Internship
                </option>

                <option value="Contract"
                    <%= "Contract".equals(job.get("jobType")) ? "selected" : "" %>>
                    Contract
                </option>

            </select>

            <br><br>

            <button type="submit">Update Job</button>

        </form>

    <% } else { %>

        <p>Job details not available.</p>

    <% } %>

    <br>

    <a href="${pageContext.request.contextPath}/recruiter-jobs">
        Back to My Jobs
    </a>

</body>

</html>