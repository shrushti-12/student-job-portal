<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Profile | Student Job Portal</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    background: #f5f8fc;
    color: #172033;
}

/* ================= NAVBAR ================= */

.navbar {
    background: white;
    height: 72px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 55px;
    border-bottom: 1px solid #e5eaf1;
    position: sticky;
    top: 0;
    z-index: 100;
}

.logo {
    font-size: 24px;
    font-weight: 800;
    text-decoration: none;
}

.logo .student {
    color: #172554;
}

.logo .job {
    color: #2563eb;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 30px;
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

/* LOGOUT */

.logout-form {
    margin-left: 5px;
}

.logout-btn {
    border: none;
    background: #dc3545;
    color: white;
    padding: 10px 19px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
}

.logout-btn:hover {
    background: #bb2d3b;
}

/* ================= HERO ================= */

.hero {
    background: linear-gradient(135deg, #172554, #2563eb);
    color: white;
    padding: 45px 60px;
}

.hero-content {
    max-width: 1100px;
    margin: auto;
}

.hero h1 {
    font-size: 34px;
    margin-bottom: 10px;
}

.hero p {
    color: #dbeafe;
    font-size: 16px;
}

/* ================= MAIN ================= */

.container {
    max-width: 1100px;
    margin: auto;
    padding: 40px 25px 70px;
}

/* ================= PROFILE CARD ================= */

.profile-card {
    background: white;
    border-radius: 18px;
    border: 1px solid #e5eaf1;
    box-shadow: 0 6px 25px rgba(15, 23, 42, 0.08);
    overflow: hidden;
}

/* TOP */

.profile-top {
    display: flex;
    align-items: center;
    gap: 25px;
    padding: 35px;
    border-bottom: 1px solid #e5eaf1;
}

/* AVATAR */

.avatar {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    background: linear-gradient(135deg, #2563eb, #172554);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 32px;
    font-weight: 800;
}

.profile-name {
    color: #172554;
    font-size: 28px;
    margin-bottom: 7px;
}

.profile-role {
    color: #64748b;
    font-size: 15px;
}

/* ================= DETAILS ================= */

.profile-details {
    padding: 35px;
}

.section-title {
    color: #172554;
    font-size: 20px;
    margin-bottom: 25px;
}

.details-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 22px;
}

.detail-box {
    background: #f8fafc;
    border: 1px solid #e5eaf1;
    border-radius: 12px;
    padding: 18px;
}

.detail-label {
    color: #64748b;
    font-size: 12px;
    font-weight: 700;
    text-transform: uppercase;
    margin-bottom: 7px;
}

.detail-value {
    color: #172033;
    font-size: 15px;
    font-weight: 600;
}

/* ================= SKILLS ================= */

.skills-section {
    margin-top: 30px;
}

.skills {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.skill {
    background: #dbeafe;
    color: #1d4ed8;
    padding: 9px 15px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 700;
}

/* ================= BUTTON ================= */

.back-btn {
    display: inline-block;
    margin-top: 30px;
    text-decoration: none;
    background: #2563eb;
    color: white;
    padding: 12px 22px;
    border-radius: 9px;
    font-weight: 700;
}

.back-btn:hover {
    background: #1d4ed8;
}

/* ================= FOOTER ================= */

footer {
    background: #172554;
    color: #cbd5e1;
    text-align: center;
    padding: 22px;
    font-size: 13px;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 700px) {

    .navbar {
        height: auto;
        padding: 18px 20px;
        flex-direction: column;
        gap: 18px;
    }

    .nav-links {
        flex-wrap: wrap;
        justify-content: center;
        gap: 15px;
    }

    .hero {
        padding: 40px 25px;
    }

    .hero h1 {
        font-size: 29px;
    }

    .profile-top {
        flex-direction: column;
        text-align: center;
    }

    .details-grid {
        grid-template-columns: 1fr;
    }

    .container {
        padding: 30px 18px 50px;
    }

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <a href="${pageContext.request.contextPath}/jobs"
       class="logo">

        <span class="student">Student</span><span class="job">JobPortal</span>

    </a>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/jobs">
            Jobs
        </a>

        <a href="${pageContext.request.contextPath}/my-applications">
            My Applications
        </a>

        <a href="${pageContext.request.contextPath}/resume">
    Resume
</a>

        <a href="${pageContext.request.contextPath}/profile"
           class="active">
            Profile
        </a>

        <form action="${pageContext.request.contextPath}/logout"
              method="post"
              class="logout-form">

            <button type="submit" class="logout-btn">
                Logout
            </button>

        </form>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="hero">

    <div class="hero-content">

        <h1>My Profile</h1>

        <p>
            View and manage your student profile information.
        </p>

    </div>

</section>


<!-- ================= MAIN ================= -->

<div class="container">

    <div class="profile-card">

        <!-- PROFILE HEADER -->

        <div class="profile-top">

            <div class="avatar">
                S
            </div>

            <div>

                <h2 class="profile-name">
                    Student Profile
                </h2>

                <p class="profile-role">
                    Student • Job Seeker
                </p>

            </div>

        </div>


        <!-- PROFILE DETAILS -->

        <div class="profile-details">

            <h3 class="section-title">
                Personal Information
            </h3>

            <div class="details-grid">

                <div class="detail-box">

                    <div class="detail-label">
                        Name
                    </div>

                    <div class="detail-value">
                        ${sessionScope.studentName}
                    </div>

                </div>


                <div class="detail-box">

                    <div class="detail-label">
                        Email
                    </div>

                    <div class="detail-value">
                        ${sessionScope.studentEmail}
                    </div>

                </div>

            </div>


            <!-- SKILLS -->

            <div class="skills-section">

                <h3 class="section-title">
                    Skills
                </h3>

                <div class="skills">

                    <span class="skill">Java</span>
                    <span class="skill">Spring Boot</span>
                    <span class="skill">MySQL</span>
                    <span class="skill">HTML</span>
                    <span class="skill">CSS</span>

                </div>

            </div>


            <a href="${pageContext.request.contextPath}/jobs"
               class="back-btn">

                ← Browse Jobs

            </a>

        </div>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    © 2026 StudentJobPortal. All rights reserved.

</footer>

</body>

</html>