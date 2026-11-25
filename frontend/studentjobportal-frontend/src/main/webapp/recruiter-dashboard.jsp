<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Recruiter Dashboard</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #eef5ff 0%, #f8fbff 55%, #eaf2ff 100%);
            color: #172033;
        }

        /* Navbar */
        body::before {
            content: "StudentJobPortal";
            display: flex;
            align-items: center;
            height: 72px;
            padding-left: 7%;
            background: #ffffff;
            color: #123b73;
            font-size: 25px;
            font-weight: 800;
            letter-spacing: -0.5px;
            box-shadow: 0 3px 15px rgba(18, 59, 115, 0.10);
        }

        /* Main heading */
        h2 {
            max-width: 1050px;
            margin: 55px auto 8px;
            padding: 0 30px;
            color: #123b73;
            font-size: 38px;
            font-weight: 800;
            letter-spacing: -0.8px;
        }

        /* Welcome text */
        p {
            max-width: 1050px;
            margin: 8px auto;
            padding: 0 30px;
            color: #64748b;
            font-size: 15px;
        }

        p strong {
            color: #1976d2;
            font-size: 16px;
        }

        /* Divider */
        hr {
            max-width: 990px;
            margin: 35px auto;
            border: none;
            border-top: 1px solid #dbe5f1;
        }

        /* Actions heading */
        h3 {
            max-width: 990px;
            margin: 0 auto 22px;
            color: #123b73;
            font-size: 22px;
            font-weight: 700;
        }

        /* Action cards */
        a {
            display: block;
            position: relative;
            width: 990px;
            max-width: calc(100% - 60px);
            margin: 14px auto;
            padding: 23px 26px;
            background: #ffffff;
            border: 1px solid #e2eaf4;
            border-radius: 14px;
            color: #123b73;
            text-decoration: none;
            font-size: 16px;
            font-weight: 700;
            box-shadow: 0 8px 25px rgba(18, 59, 115, 0.08);
            transition: all 0.25s ease;
        }

        a::after {
            content: "→";
            position: absolute;
            right: 25px;
            font-size: 21px;
            color: #1976d2;
            transition: 0.25s ease;
        }

        a:hover {
            transform: translateY(-4px);
            border-color: #b9d4f2;
            box-shadow: 0 14px 32px rgba(18, 59, 115, 0.14);
        }

        a:hover::after {
            right: 20px;
        }

        /* Logout */
        form {
            width: 990px;
            max-width: calc(100% - 60px);
            margin: 30px auto;
        }

        button {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 10px;
            background: #1976d2;
            color: #ffffff;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 7px 18px rgba(25, 118, 210, 0.22);
            transition: all 0.25s ease;
        }

        button:hover {
            background: #125ca8;
            transform: translateY(-2px);
            box-shadow: 0 10px 24px rgba(25, 118, 210, 0.28);
        }

        /* Mobile */
        @media (max-width: 600px) {

            body::before {
                height: 65px;
                padding-left: 22px;
                font-size: 21px;
            }

            h2 {
                margin-top: 38px;
                padding: 0 20px;
                font-size: 29px;
            }

            p {
                padding: 0 20px;
            }

            h3 {
                padding: 0 20px;
                font-size: 20px;
            }

            a,
            form {
                width: auto;
                max-width: calc(100% - 40px);
            }

            a {
                padding: 20px;
            }

        }

    </style>

</head>

<body>

    <h2>Recruiter Dashboard</h2>

    <p>

        Welcome,

        <strong>${sessionScope.recruiterName}</strong>

    </p>

    <p>

        Email: ${sessionScope.recruiterEmail}

    </p>

    <hr>

    <h3>Recruiter Actions</h3>

    <a href="${pageContext.request.contextPath}/add-job.jsp">

        Add New Job

    </a>

    <br><br>

    <a href="${pageContext.request.contextPath}/recruiter-jobs">

        My Jobs

    </a>

    <br><br>

    <form action="${pageContext.request.contextPath}/recruiter-logout"

          method="post">

        <button type="submit">Logout</button>

    </form>

</body>

</html>