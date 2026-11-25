<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Job Portal | Create Profile</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    min-height: 100vh;
    color: #ffffff;
}

/* =========================
   MAIN BACKGROUND
========================= */

.page {
    min-height: 100vh;

    background:
        linear-gradient(
            90deg,
            rgba(7, 20, 48, 0.92) 0%,
            rgba(7, 20, 48, 0.78) 42%,
            rgba(7, 20, 48, 0.35) 75%,
            rgba(7, 20, 48, 0.20) 100%
        ),
        url("${pageContext.request.contextPath}/images/career-bg.jpg");

    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

/* =========================
   NAVBAR
========================= */

.navbar {
    height: 76px;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 7%;

    background: rgba(255, 255, 255, 0.96);

    color: #172554;

    box-shadow: 0 2px 15px rgba(0,0,0,0.08);
}

/* Logo */

.logo {
    font-size: 23px;
    font-weight: 800;
    letter-spacing: -0.5px;
}

.logo span {
    color: #2563eb;
}

/* Navigation */

.nav-links {
    display: flex;
    align-items: center;
    gap: 10px;
}

.nav-links a {
    text-decoration: none;
    color: #334155;

    padding: 10px 16px;

    font-size: 14px;
    font-weight: 600;

    border-radius: 7px;

    transition: 0.2s;
}

.nav-links a:hover {
    color: #2563eb;
    background: #eff6ff;
}

/* Login */

.login-btn {
    border: 1px solid #2563eb;
    color: #2563eb !important;
}

.login-btn:hover {
    background: #2563eb !important;
    color: white !important;
}

/* Sign Up */

.signup-btn {
    background: #2563eb;
    color: white !important;
}

.signup-btn:hover {
    background: #1d4ed8 !important;
}

/* =========================
   HERO
========================= */

.hero {
    min-height: calc(100vh - 76px);

    display: flex;
    align-items: center;

    padding: 55px 7%;
}

.hero-content {
    width: 52%;
    max-width: 650px;
}

/* Small badge */

.badge {
    display: inline-block;

    background: rgba(255,255,255,0.12);

    border: 1px solid rgba(255,255,255,0.25);

    padding: 8px 15px;

    border-radius: 30px;

    font-size: 13px;

    margin-bottom: 22px;

    backdrop-filter: blur(8px);
}

/* Heading */

.hero-content h1 {
    font-size: 52px;
    line-height: 1.08;

    margin-bottom: 20px;

    letter-spacing: -1px;
}

.hero-content h1 span {
    color: #60a5fa;
}

/* Description */

.hero-content p {
    font-size: 17px;

    line-height: 1.7;

    color: #dbeafe;

    max-width: 570px;

    margin-bottom: 28px;
}

/* Benefits */

.benefits {
    display: flex;
    flex-direction: column;

    gap: 12px;

    font-size: 14px;

    color: #f8fafc;
}

.benefits div {
    display: flex;
    align-items: center;
    gap: 10px;
}

.check {
    width: 23px;
    height: 23px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: #2563eb;

    border-radius: 50%;

    font-size: 12px;
}

/* =========================
   REGISTER CARD
========================= */

.register-wrapper {
    width: 48%;

    display: flex;
    justify-content: flex-end;
}

.card {
    width: 430px;

    background: rgba(255,255,255,0.97);

    color: #1e293b;

    padding: 34px;

    border-radius: 18px;

    box-shadow:
        0 25px 70px rgba(0,0,0,0.30);

    backdrop-filter: blur(10px);
}

/* Card heading */

.card h2 {
    font-size: 27px;

    color: #172554;

    margin-bottom: 8px;
}

.card-subtitle {
    color: #64748b;

    font-size: 14px;

    line-height: 1.5;

    margin-bottom: 25px;
}

/* =========================
   SUCCESS / ERROR
========================= */

.success {
    background: #dcfce7;

    color: #166534;

    padding: 12px;

    border-radius: 8px;

    margin-bottom: 18px;

    font-size: 13px;

    text-align: center;
}

.error {
    background: #fee2e2;

    color: #991b1b;

    padding: 12px;

    border-radius: 8px;

    margin-bottom: 18px;

    font-size: 13px;

    text-align: center;
}

/* =========================
   FORM
========================= */

.form-group {
    margin-bottom: 17px;
}

label {
    display: block;

    margin-bottom: 7px;

    font-size: 13px;

    font-weight: 700;

    color: #334155;
}

input {
    width: 100%;

    padding: 13px 14px;

    border: 1px solid #cbd5e1;

    border-radius: 8px;

    font-size: 14px;

    outline: none;

    transition: 0.2s;
}

input:focus {
    border-color: #2563eb;

    box-shadow:
        0 0 0 3px rgba(37,99,235,0.12);
}

input::placeholder {
    color: #94a3b8;
}

/* =========================
   REGISTER BUTTON
========================= */

.register-btn {
    width: 100%;

    padding: 14px;

    margin-top: 5px;

    border: none;

    border-radius: 8px;

    background: #2563eb;

    color: white;

    font-size: 15px;

    font-weight: 700;

    cursor: pointer;

    transition: 0.2s;
}

.register-btn:hover {
    background: #1d4ed8;

    transform: translateY(-1px);
}

/* =========================
   LOGIN LINK
========================= */

.login-text {
    text-align: center;

    margin-top: 20px;

    font-size: 13px;

    color: #64748b;
}

.login-text a {
    color: #2563eb;

    font-weight: 700;

    text-decoration: none;
}

.login-text a:hover {
    text-decoration: underline;
}

/* =========================
   FOOTER
========================= */

.footer {
    text-align: center;

    margin-top: 18px;

    font-size: 11px;

    color: #94a3b8;
}

/* =========================
   MOBILE
========================= */

@media (max-width: 900px) {

    .hero {
        flex-direction: column;

        gap: 40px;

        padding-top: 45px;
        padding-bottom: 50px;
    }

    .hero-content {
        width: 100%;

        max-width: 650px;
    }

    .register-wrapper {
        width: 100%;

        justify-content: center;
    }

    .hero-content h1 {
        font-size: 42px;
    }
}

@media (max-width: 600px) {

    .navbar {
        height: auto;

        padding: 18px 20px;

        flex-direction: column;

        gap: 15px;
    }

    .nav-links {
        width: 100%;

        justify-content: center;

        flex-wrap: wrap;
    }

    .nav-links a {
        padding: 8px 11px;

        font-size: 12px;
    }

    .hero {
        padding: 35px 20px;
    }

    .hero-content h1 {
        font-size: 34px;
    }

    .hero-content p {
        font-size: 15px;
    }

    .card {
        width: 100%;

        padding: 25px 20px;

        border-radius: 14px;
    }
}

</style>
</head>

<body>

<div class="page">

    <!-- =========================
         NAVBAR
    ========================== -->

    <nav class="navbar">

        <div class="logo">
            Student<span>JobPortal</span>
        </div>

        <div class="nav-links">

            <a href="${pageContext.request.contextPath}/index.jsp">
                Home
            </a>

            <a href="#">
                Jobs
            </a>

            <a href="#">
                About
            </a>

           <a href="${pageContext.request.contextPath}/login.jsp">
    Student Login
</a>

<a href="${pageContext.request.contextPath}/recruiter-login.jsp">
    Recruiter Login
</a>

<a href="${pageContext.request.contextPath}/index.jsp">
    Sign Up
</a>

        </div>

    </nav>


    <!-- =========================
         HERO SECTION
    ========================== -->

    <main class="hero">

        <!-- LEFT SIDE -->

        <section class="hero-content">

            <div class="badge">
                🚀 Start Your Career Journey
            </div>

            <h1>
                Find Your Next
                <span>Opportunity.</span>
            </h1>

            <p>
                Connect with opportunities, discover the right jobs,
                and take the next step toward your career.
            </p>

            <div class="benefits">

                <div>
                    <span class="check">✓</span>
                    Discover relevant job opportunities
                </div>

                <div>
                    <span class="check">✓</span>
                    Apply for jobs easily
                </div>

                <div>
                    <span class="check">✓</span>
                    Track your applications
                </div>

                <div>
                    <span class="check">✓</span>
                    Build your professional profile
                </div>

            </div>

        </section>


        <!-- RIGHT SIDE -->

        <section class="register-wrapper">

            <div class="card">

                <h2>Create Your Profile</h2>

                <p class="card-subtitle">
                    Join Student Job Portal and start exploring
                    career opportunities.
                </p>


                <!-- SUCCESS MESSAGE -->

                <%
                Boolean registrationSuccess =
                        (Boolean) session.getAttribute("registrationSuccess");

                String registrationError =
                        (String) session.getAttribute("registrationError");

                if (Boolean.TRUE.equals(registrationSuccess)) {

                    session.removeAttribute("registrationSuccess");
                %>

                    <div class="success" role="status">
                        ✓ Student registered successfully!
                    </div>

                <%
                }


                if (registrationError != null) {

                    session.removeAttribute("registrationError");
                %>

                    <div class="error" role="alert">
                        ⚠ <%= registrationError %>
                    </div>

                <%
                }
                %>


                <!-- REGISTER FORM -->

                <form action="register-student" method="post">

                    <div class="form-group">

                        <label for="name">
                            Full Name
                        </label>

                        <input
                            type="text"
                            id="name"
                            name="name"
                            placeholder="Enter your full name"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="email">
                            Email Address
                        </label>

                        <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="Enter your email"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="skills">
                            Skills
                        </label>

                        <input
                            type="text"
                            id="skills"
                            name="skills"
                            placeholder="Example: Java, SQL, HTML"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="password">
                            Password
                        </label>

                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Minimum 8 characters"
                            minlength="8"
                            autocomplete="new-password"
                            required>

                    </div>


                    <button
                        type="submit"
                        class="register-btn">
                        Create My Account
                    </button>

                </form>


                <div class="login-text">

                    Already have an account?

                    <a href="${pageContext.request.contextPath}/login.jsp">
                        Login here
                    </a>

                </div>


                <div class="footer">
                    Build your skills. Explore your opportunities.
                </div>

            </div>

        </section>

    </main>

</div>

</body>
</html>