<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Applications | Student Job Portal</title>

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
    max-width: 1150px;
    margin: auto;
}

.hero h1 {
    font-size: 34px;
    margin-bottom: 10px;
}

.hero p {
    color: #dbeafe;
    font-size: 16px;
    line-height: 1.6;
}

/* ================= MAIN ================= */

.container {
    max-width: 1150px;
    margin: auto;
    padding: 40px 25px 70px;
}

/* ================= HEADER ================= */

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.page-header h2 {
    color: #172554;
    font-size: 27px;
}

.back-btn {
    text-decoration: none;
    background: #eff6ff;
    color: #2563eb;
    padding: 11px 18px;
    border-radius: 8px;
    font-weight: 600;
}

.back-btn:hover {
    background: #dbeafe;
}

/* ================= APPLICATION CARD ================= */

.application-card {
    background: white;
    border: 1px solid #e5eaf1;
    border-radius: 16px;
    padding: 25px;
    margin-bottom: 20px;
    box-shadow: 0 5px 20px rgba(15, 23, 42, 0.07);
    transition: 0.25s ease;
}

.application-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 28px rgba(15, 23, 42, 0.11);
}

.application-top {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 20px;
}

.job-title {
    color: #172554;
    font-size: 22px;
    margin-bottom: 8px;
}

.application-id {
    color: #64748b;
    font-size: 13px;
}

.applied-date {
    color: #64748b;
    font-size: 14px;
    margin-top: 15px;
}

/* ================= STATUS ================= */

.status {
    display: inline-block;
    padding: 8px 15px;
    border-radius: 20px;
    background: #dbeafe;
    color: #1d4ed8;
    font-size: 13px;
    font-weight: 700;
    white-space: nowrap;
}

/* ================= EMPTY ================= */

.empty {
    background: white;
    border: 1px solid #e5eaf1;
    border-radius: 16px;
    padding: 65px 30px;
    text-align: center;
    box-shadow: 0 5px 20px rgba(15, 23, 42, 0.05);
}

.empty-icon {
    font-size: 45px;
    margin-bottom: 15px;
}

.empty h3 {
    color: #172554;
    font-size: 22px;
    margin-bottom: 10px;
}

.empty p {
    color: #64748b;
    margin-bottom: 25px;
}

.browse-btn {
    display: inline-block;
    text-decoration: none;
    background: #2563eb;
    color: white;
    padding: 12px 22px;
    border-radius: 9px;
    font-weight: 700;
}

.browse-btn:hover {
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

@media (max-width: 850px) {

    .navbar {
        padding: 0 20px;
    }

    .nav-links {
        gap: 15px;
    }

    .hero {
        padding: 40px 25px;
    }
}

@media (max-width: 600px) {

    .navbar {
        height: auto;
        padding: 18px 20px;
        flex-direction: column;
        gap: 18px;
    }

    .nav-links {
        flex-wrap: wrap;
        justify-content: center;
    }

    .page-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }

    .application-top {
        flex-direction: column;
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

        <a href="${pageContext.request.contextPath}/my-applications"
           class="active">
            My Applications
        </a>

        <a href="${pageContext.request.contextPath}/resume">
    Resume
</a>

       <a href="${pageContext.request.contextPath}/profile">
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

        <h1>My Applications</h1>

        <p>
            Track the jobs you have applied for and monitor
            the status of your applications.
        </p>

    </div>

</section>


<!-- ================= MAIN ================= -->

<div class="container">

    <div class="page-header">

        <h2>
            Application History
        </h2>

        <a href="${pageContext.request.contextPath}/jobs"
           class="back-btn">

            ← Browse Jobs

        </a>

    </div>


    <!-- ================= APPLICATIONS ================= -->

    <c:choose>

        <c:when test="${empty applications}">

            <div class="empty">

                <div class="empty-icon">
                    📄
                </div>

                <h3>
                    You haven't applied for any jobs yet.
                </h3>

                <p>
                    Explore available jobs and apply for your
                    next career opportunity.
                </p>

                <a href="${pageContext.request.contextPath}/jobs"
                   class="browse-btn">

                    Browse Available Jobs

                </a>

            </div>

        </c:when>


        <c:otherwise>

            <c:forEach var="app" items="${applications}">

                <div class="application-card">

                    <div class="application-top">

                        <div>

                            <h2 class="job-title">

                                <c:out value="${app.job.title}"
                                       default="Job Title Not Available"/>

                            </h2>

                            <p class="application-id">

                                Application ID:
                                #<c:out value="${app.id}"/>

                            </p>

                        </div>


                        <span class="status">

                            <c:out value="${app.status}"
                                   default="Pending"/>

                        </span>

                    </div>


                    <p class="applied-date">

                        Applied on:
                        <strong>
                            <c:out value="${app.appliedAt}"
                                   default="Date not available"/>
                        </strong>

                    </p>

                </div>

            </c:forEach>

        </c:otherwise>

    </c:choose>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    © 2026 StudentJobPortal. All rights reserved.

</footer>

</body>

</html>