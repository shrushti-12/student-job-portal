<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Login | Student Job Portal</title>

<style>

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #f4f7fb;
        color: #1f2937;
        min-height: 100vh;
    }

    /* ---------- TOP NAVBAR ---------- */

    .navbar {
        height: 70px;
        background: #ffffff;
        border-bottom: 1px solid #e5e7eb;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 7%;
    }

    .brand {
        font-size: 22px;
        font-weight: bold;
        color: #1e3a8a;
        text-decoration: none;
    }

    .brand span {
        color: #2563eb;
    }

    .nav-text {
        color: #6b7280;
        font-size: 14px;
    }

    /* ---------- MAIN ---------- */

    .main-container {
        min-height: calc(100vh - 70px);
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 50px 20px;
    }

    .login-container {
        width: 100%;
        max-width: 950px;
        min-height: 560px;
        background: #ffffff;
        border-radius: 18px;
        box-shadow: 0 12px 40px rgba(30, 58, 138, 0.10);
        overflow: hidden;
        display: flex;
    }

    /* ---------- LEFT SIDE ---------- */

    .welcome-section {
        width: 48%;
        background: #1e3a8a;
        color: white;
        padding: 55px 45px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .welcome-section h1 {
        font-size: 34px;
        line-height: 1.2;
        margin-bottom: 18px;
    }

    .welcome-section h1 span {
        color: #93c5fd;
    }

    .welcome-section p {
        color: #dbeafe;
        line-height: 1.7;
        font-size: 15px;
        margin-bottom: 30px;
    }

    .benefits {
        list-style: none;
    }

    .benefits li {
        margin-bottom: 15px;
        color: #eff6ff;
        font-size: 14px;
    }

    .benefits li::before {
        content: "✓";
        margin-right: 10px;
        color: #93c5fd;
        font-weight: bold;
    }

    /* ---------- LOGIN SIDE ---------- */

    .login-section {
        width: 52%;
        padding: 55px 50px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .login-section h2 {
        color: #111827;
        font-size: 28px;
        margin-bottom: 8px;
    }

    .subtitle {
        color: #6b7280;
        font-size: 14px;
        margin-bottom: 28px;
    }

    /* ---------- ERROR ---------- */

    .error-message {
        color: #991b1b;
        background: #fef2f2;
        border: 1px solid #fecaca;
        padding: 12px 14px;
        border-radius: 8px;
        margin-bottom: 20px;
        font-size: 14px;
    }

    /* ---------- FORM ---------- */

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 7px;
        color: #374151;
        font-size: 14px;
        font-weight: 600;
    }

    input {
        width: 100%;
        padding: 13px 14px;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        font-size: 14px;
        outline: none;
        transition: 0.2s;
    }

    input:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
    }

    .password-wrapper {
        position: relative;
    }

    .password-wrapper input {
        padding-right: 70px;
    }

    .show-password {
        position: absolute;
        right: 12px;
        top: 50%;
        transform: translateY(-50%);
        border: none;
        background: transparent;
        color: #2563eb;
        font-size: 12px;
        cursor: pointer;
        padding: 5px;
    }

    .login-button {
        width: 100%;
        margin-top: 8px;
        padding: 14px;
        border: none;
        border-radius: 8px;
        background: #2563eb;
        color: #ffffff;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.2s;
    }

    .login-button:hover {
        background: #1d4ed8;
    }

    /* ---------- REGISTER ---------- */

    .register-section {
        text-align: center;
        margin-top: 25px;
        color: #6b7280;
        font-size: 14px;
    }

    .register-section a {
        color: #2563eb;
        font-weight: bold;
        text-decoration: none;
    }

    .register-section a:hover {
        text-decoration: underline;
    }

    /* ---------- FOOTER ---------- */

    .footer-text {
        text-align: center;
        color: #9ca3af;
        font-size: 12px;
        margin-top: 25px;
    }

    /* ---------- MOBILE ---------- */

    @media (max-width: 768px) {

        .navbar {
            padding: 0 20px;
        }

        .nav-text {
            display: none;
        }

        .login-container {
            flex-direction: column;
            max-width: 500px;
        }

        .welcome-section {
            width: 100%;
            padding: 35px 30px;
        }

        .welcome-section h1 {
            font-size: 28px;
        }

        .benefits {
            display: none;
        }

        .login-section {
            width: 100%;
            padding: 35px 30px;
        }
    }

</style>
</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <a href="${pageContext.request.contextPath}/index.jsp"
       class="brand">
        Student<span>JobPortal</span>
    </a>

    <div class="nav-text">
        Find opportunities. Build your career.
    </div>

</nav>


<!-- MAIN -->

<main class="main-container">

    <div class="login-container">

        <!-- LEFT WELCOME SECTION -->

        <section class="welcome-section">

            <h1>
                Welcome back to
                <span>your career journey.</span>
            </h1>

            <p>
                Discover opportunities, apply for jobs,
                manage your applications and take the next
                step toward your career.
            </p>

            <ul class="benefits">

                <li>Explore job opportunities</li>

                <li>Apply for jobs easily</li>

                <li>Track your application status</li>

                <li>Manage your professional profile</li>

            </ul>

        </section>


        <!-- LOGIN FORM -->

        <section class="login-section">

            <h2>Student Login</h2>

            <p class="subtitle">
                Sign in to access your account.
            </p>


            <!-- LOGIN ERROR -->

            <c:if test="${not empty sessionScope.loginError}">

                <div class="error-message">

                    <c:out value="${sessionScope.loginError}" />

                </div>

                <c:remove var="loginError" scope="session" />

            </c:if>


            <!-- LOGIN FORM -->

            <form action="${pageContext.request.contextPath}/login"
                  method="post">

                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        autocomplete="username"
                        placeholder="Enter your email"
                        required>

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <div class="password-wrapper">

                        <input
                            type="password"
                            id="password"
                            name="password"
                            autocomplete="current-password"
                            placeholder="Enter your password"
                            required>

                        <button
                            type="button"
                            class="show-password"
                            onclick="togglePassword()">
                            Show
                        </button>

                    </div>

                </div>


                <button type="submit"
                        class="login-button">
                    Login
                </button>

            </form>


            <!-- REGISTER -->

            <div class="register-section">

                Don't have an account?

                <a href="${pageContext.request.contextPath}/index.jsp">
                    Create an account
                </a>

            </div>


            <div class="footer-text">
                © 2026 Student Job Portal
            </div>

        </section>

    </div>

</main>


<script>

    function togglePassword() {

        const password = document.getElementById("password");
        const button = document.querySelector(".show-password");

        if (password.type === "password") {

            password.type = "text";
            button.textContent = "Hide";

        } else {

            password.type = "password";
            button.textContent = "Show";

        }
    }

</script>

</body>
</html>