<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Add New Job</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eef5ff, #f8fbff);
            color: #172033;
            padding: 45px 20px;
        }

        h2 {
            text-align: center;
            color: #123b73;
            font-size: 32px;
            margin: 0 0 30px;
        }

        form {
            width: 100%;
            max-width: 650px;
            margin: 0 auto;
            background: #ffffff;
            padding: 38px 42px;
            border-radius: 16px;
            box-shadow: 0 12px 35px rgba(18, 59, 115, 0.12);
            border: 1px solid #e3ebf5;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #26364d;
            font-size: 14px;
            font-weight: 700;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #d5deeb;
            border-radius: 8px;
            background: #ffffff;
            color: #172033;
            font-family: Arial, sans-serif;
            font-size: 14px;
            outline: none;
            transition: 0.2s ease;
        }

        input:focus,
        textarea:focus,
        select:focus {
            border-color: #1976d2;
            box-shadow: 0 0 0 3px rgba(25, 118, 210, 0.10);
        }

        textarea {
            resize: vertical;
            min-height: 130px;
        }

        select {
            cursor: pointer;
        }

        button {
            width: 100%;
            padding: 14px;
            margin-top: 5px;
            border: none;
            border-radius: 9px;
            background: #1976d2;
            color: #ffffff;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s ease;
            box-shadow: 0 6px 16px rgba(25, 118, 210, 0.20);
        }

        button:hover {
            background: #125ca8;
            transform: translateY(-2px);
        }

        p[style] {
            width: 100%;
            max-width: 650px;
            margin: 0 auto 20px;
            padding: 13px 16px;
            background: #fff1f1;
            border: 1px solid #ffcaca;
            border-radius: 8px;
            font-size: 14px;
            text-align: center;
        }

        body > a {
            display: block;
            width: fit-content;
            margin: 25px auto 0;
            color: #1976d2;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        body > a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {

            body {
                padding: 30px 15px;
            }

            h2 {
                font-size: 27px;
                margin-bottom: 25px;
            }

            form {
                padding: 28px 22px;
            }

        }

    </style>

</head>

<body>

    <h2>Add New Job</h2>

    <% if (request.getAttribute("error") != null) { %>

        <p style="color:red;">

            <%= request.getAttribute("error") %>

        </p>

    <% } %>

    <form action="${pageContext.request.contextPath}/add-job"
          method="post">

        <label>Job Title:</label>

        <input type="text" name="title" required>

        <br><br>

        <label>Company:</label>

        <input type="text" name="company" required>

        <br><br>

        <label>Location:</label>

        <input type="text" name="location" required>

        <br><br>

        <label>Description:</label>

        <br>

        <textarea name="description"
                  rows="5"
                  cols="40"
                  required></textarea>

        <br><br>

        <label>Required Skills:</label>

        <input type="text" name="requiredSkills" required>

        <br><br>

        <label>Job Type:</label>

        <select name="jobType" required>

            <option value="">-- Select Job Type --</option>

            <option value="Full Time">Full Time</option>

            <option value="Part Time">Part Time</option>

            <option value="Internship">Internship</option>

            <option value="Contract">Contract</option>

        </select>

        <br><br>

        <button type="submit">Post Job</button>

    </form>

    <br>

    <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp">
        Back to Dashboard
    </a>

</body>

</html>