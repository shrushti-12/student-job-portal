<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Available Jobs | Student Job Portal</title>

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
    padding: 48px 60px;
}

.hero-content {
    max-width: 1150px;
    margin: auto;
}

.hero h1 {
    font-size: 36px;
    margin-bottom: 12px;
}

.hero p {
    font-size: 16px;
    color: #dbeafe;
    max-width: 650px;
    line-height: 1.6;
}

/* ================= MAIN ================= */

.container {
    max-width: 1150px;
    margin: auto;
    padding: 40px 25px 70px;
}

/* APPLICATION MESSAGE */

.message {
    background: #dcfce7;
    border: 1px solid #86efac;
    color: #166534;
    padding: 14px 18px;
    border-radius: 10px;
    margin-bottom: 25px;
    font-weight: 600;
}

/* SECTION HEADER */

.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.section-header h2 {
    font-size: 27px;
    color: #172554;
}

.my-applications {
    text-decoration: none;
    background: #eff6ff;
    color: #2563eb;
    padding: 11px 18px;
    border-radius: 8px;
    font-weight: 600;
}

.my-applications:hover {
    background: #dbeafe;
}

/* ================= JOB GRID ================= */

.jobs-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 25px;
}

/* ================= JOB CARD ================= */

.job-card {
    background: white;
    border: 1px solid #e5eaf1;
    border-radius: 16px;
    padding: 26px;
    box-shadow: 0 5px 20px rgba(15, 23, 42, 0.07);
    transition: 0.25s ease;
}

.job-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 12px 30px rgba(15, 23, 42, 0.12);
}

.job-card h2 {
    color: #172554;
    font-size: 22px;
    margin-bottom: 8px;
}

.company {
    color: #2563eb;
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 16px;
}

.details {
    color: #64748b;
    font-size: 14px;
    margin-bottom: 12px;
}

/* JOB TYPE */

.job-type {
    display: inline-block;
    background: #dbeafe;
    color: #1d4ed8;
    padding: 7px 13px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
    margin-bottom: 18px;
}

/* DESCRIPTION */

.description {
    color: #475569;
    line-height: 1.6;
    font-size: 14px;
    margin-bottom: 18px;
}

.description strong,
.skills strong {
    color: #172033;
}

/* SKILLS */

.skills {
    background: #f8fafc;
    border-radius: 10px;
    padding: 13px;
    color: #475569;
    font-size: 14px;
    line-height: 1.5;
}

/* APPLY */

.apply-form {
    margin-top: 22px;
}

.apply-btn {
    width: 100%;
    background: #2563eb;
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 9px;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.2s;
}

.apply-btn:hover {
    background: #1d4ed8;
}

/* ================= EMPTY ================= */

.empty {
    background: white;
    border-radius: 15px;
    padding: 60px 30px;
    text-align: center;
    border: 1px solid #e5eaf1;
}

.empty h3 {
    color: #172554;
    font-size: 22px;
    margin-bottom: 10px;
}

.empty p {
    color: #64748b;
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

    .jobs-grid {
        grid-template-columns: 1fr;
    }

    .hero {
        padding: 40px 25px;
    }

    .hero h1 {
        font-size: 30px;
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

    .section-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
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

        <a href="${pageContext.request.contextPath}/jobs"
           class="active">
            Jobs
        </a>

        <a href="${pageContext.request.contextPath}/my-applications">
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

        <h1>Find Your Next Opportunity</h1>

        <p>
            Explore job opportunities from recruiters and find
            the right position to start or grow your career.
        </p>

    </div>

</section>


<!-- ================= MAIN ================= -->

<div class="container">


    <!-- APPLICATION MESSAGE -->

    <c:if test="${not empty sessionScope.applicationMessage}">

        <div class="message">

            <c:out value="${sessionScope.applicationMessage}"/>

        </div>

        <c:remove var="applicationMessage" scope="session"/>

    </c:if>


    <!-- SECTION HEADER -->

    <div class="section-header">

        <h2>Available Jobs</h2>

        <a href="${pageContext.request.contextPath}/my-applications"
           class="my-applications">

            My Applications →

        </a>

    </div>


    <!-- ================= JOBS ================= -->

    <c:choose>

        <c:when test="${empty jobs}">

            <div class="empty">

                <h3>No jobs available right now.</h3>

                <p>
                    Please check again later for new opportunities.
                </p>

            </div>

        </c:when>


        <c:otherwise>

            <div class="jobs-grid">

                <c:forEach var="job" items="${jobs}">

                    <div class="job-card">

                        <h2>
                            <c:out value="${job['title']}"
                                   default="Untitled Job"/>
                        </h2>


                        <p class="company">

                            <c:out value="${job['company']}"
                                   default="Company not specified"/>

                        </p>


                        <p class="details">

                            📍
                            <c:out value="${job['location']}"
                                   default="Not specified"/>

                        </p>


                        <span class="job-type">

                            <c:out value="${job['jobType']}"
                                   default="Not specified"/>

                        </span>


                        <p class="description">

                            <strong>Description</strong><br>

                            <c:out value="${job['description']}"
                                   default="No description available"/>

                        </p>


                        <div class="skills">

                            <strong>Required Skills:</strong><br>

                            <c:out value="${job['requiredSkills']}"
                                   default="Not specified"/>

                        </div>


                        <!-- IMPORTANT:
                             Keep this exactly like the original working version.
                        -->

                        <form action="${pageContext.request.contextPath}/apply-job"
                              method="post"
                              class="apply-form">

                            <input type="hidden"
                                   name="jobId"
                                   value="${job['id']}">

                            <button type="submit"
                                    class="apply-btn">

                                Apply Now →

                            </button>

                        </form>

                    </div>

                </c:forEach>

            </div>

        </c:otherwise>

    </c:choose>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    © 2026 StudentJobPortal. All rights reserved.

</footer>

</body>
</html>