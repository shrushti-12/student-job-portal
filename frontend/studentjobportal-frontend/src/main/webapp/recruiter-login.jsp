<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Recruiter Login</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eef5ff, #f8fbff);
            display: flex;
            justify-content: center;
            align-items: center;
            color: #172033;
        }

        h2 {
            position: absolute;
            top: 70px;
            margin: 0;
            color: #123b73;
            font-size: 32px;
            font-weight: 700;
        }

        form {
            width: 400px;
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 12px 35px rgba(18, 59, 115, 0.15);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #26364d;
            font-size: 14px;
            font-weight: 600;
        }

        input {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #d5deeb;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
        }

        input:focus {
            border-color: #1976d2;
            box-shadow: 0 0 0 3px rgba(25, 118, 210, 0.10);
        }

        button {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #1976d2;
            color: #ffffff;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s ease;
        }

        button:hover {
            background: #125ca8;
        }

        a {
            position: absolute;
            bottom: 65px;
            color: #1976d2;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 500px) {

            h2 {
                top: 50px;
                font-size: 27px;
            }

            form {
                width: calc(100% - 40px);
                padding: 30px 25px;
            }

            a {
                bottom: 35px;
            }
        }

    </style>

</head>

<body>

    <h2>Recruiter Login</h2>

    <form action="${pageContext.request.contextPath}/recruiter-login"
          method="post">

        <label>Email:</label>

        <input type="email" name="email" required>

        <br><br>

        <label>Password:</label>

        <input type="password" name="password" required>

        <br><br>

        <button type="submit">Login</button>

    </form>

    <br>

    <a href="${pageContext.request.contextPath}/recruiter-register.jsp">
        Create Recruiter Account
    </a>

</body>

</html>