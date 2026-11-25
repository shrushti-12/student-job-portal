
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Resume | Student Job Portal</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #1e293b;
        }

        /* NAVBAR */
        .navbar {
            height: 72px;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 22px;
            font-weight: bold;
            color: #1e3a8a;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            text-decoration: none;
            color: #475569;
            font-size: 15px;
            font-weight: 500;
        }

        .nav-links a:hover {
            color: #2563eb;
        }

        .nav-links .active {
            color: #2563eb;
            font-weight: 600;
        }

        .logout-btn {
            background: #dc3545;
            color: white !important;
            padding: 9px 18px;
            border-radius: 7px;
        }

        .logout-btn:hover {
            background: #b91c1c;
        }

        /* HERO */
        .hero {
            background: linear-gradient(135deg, #1e3a8a, #2563eb);
            color: white;
            padding: 55px 7%;
        }

        .hero h1 {
            font-size: 34px;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 16px;
            opacity: 0.95;
        }

        /* MAIN */
        .container {
            width: 86%;
            max-width: 1000px;
            margin: 45px auto;
        }

        .resume-card {
            background: white;
            border-radius: 14px;
            padding: 35px;
            box-shadow: 0 5px 20px rgba(15, 23, 42, 0.08);
        }

        .resume-card h2 {
            color: #1e3a8a;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #64748b;
            margin-bottom: 30px;
        }

        /* UPLOAD AREA */
        .upload-area {
            border: 2px dashed #bfdbfe;
            background: #f8fbff;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
        }

        .upload-icon {
            font-size: 42px;
            margin-bottom: 15px;
        }

        .upload-area h3 {
            color: #1e293b;
            margin-bottom: 8px;
        }

        .upload-area p {
            color: #64748b;
            margin-bottom: 22px;
        }

        input[type="file"] {
            display: block;
            width: 100%;
            max-width: 450px;
            margin: 0 auto 20px;
            padding: 10px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            background: white;
        }

        .upload-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 28px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .upload-btn:hover {
            background: #1d4ed8;
        }

        /* INFO */
        .info {
            margin-top: 25px;
            padding: 18px;
            background: #eff6ff;
            border-left: 4px solid #2563eb;
            border-radius: 6px;
            color: #334155;
            line-height: 1.6;
        }

        .success {
            margin-bottom: 20px;
            padding: 14px 18px;
            background: #ecfdf5;
            color: #166534;
            border: 1px solid #bbf7d0;
            border-radius: 8px;
        }

        .error {
            margin-bottom: 20px;
            padding: 14px 18px;
            background: #fef2f2;
            color: #991b1b;
            border: 1px solid #fecaca;
            border-radius: 8px;
        }

        /* FOOTER */
        footer {
            margin-top: 70px;
            background: #0f172a;
            color: #94a3b8;
            text-align: center;
            padding: 25px;
            font-size: 14px;
        }

        @media (max-width: 800px) {

            .navbar {
                padding: 0 4%;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 13px;
            }

            .hero {
                padding: 40px 5%;
            }

            .hero h1 {
                font-size: 28px;
            }

            .container {
                width: 92%;
            }

            .resume-card {
                padding: 25px 20px;
            }

            .upload-area {
                padding: 30px 15px;
            }
        }

    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar">

    <a href="${pageContext.request.contextPath}/jobs"
       class="logo">
        StudentJobPortal
    </a>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/jobs">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/jobs">
            Jobs
        </a>

        <a href="${pageContext.request.contextPath}/my-applications">
            My Applications
        </a>

        <a href="${pageContext.request.contextPath}/resume"
           class="active">
            Resume
        </a>

        <a href="${pageContext.request.contextPath}/profile">
            Profile
        </a>

        <form action="${pageContext.request.contextPath}/logout"
              method="post"
              style="display:inline;">

            <button type="submit"
                    class="logout-btn"
                    style="border:none; cursor:pointer;">
                Logout
            </button>

        </form>

    </div>

</nav>


<!-- HERO -->
<section class="hero">

    <h1>My Resume</h1>

    <p>
        Upload your resume to apply for job opportunities.
    </p>

</section>


<!-- MAIN -->
<div class="container">

    <div class="resume-card">

        <h2>Upload Your Resume</h2>

        <p class="subtitle">
            Keep your resume updated so recruiters can review your profile.
        </p>


        <!-- SUCCESS MESSAGE -->
        <%
            String success = (String) session.getAttribute("resumeSuccess");

            if (success != null) {
        %>

            <div class="success">
                <%= success %>
            </div>

        <%
                session.removeAttribute("resumeSuccess");
            }
        %>


        <!-- ERROR MESSAGE -->
        <%
            String error = (String) session.getAttribute("resumeError");

            if (error != null) {
        %>

            <div class="error">
                <%= error %>
            </div>

        <%
                session.removeAttribute("resumeError");
            }
        %>


        <!-- UPLOAD FORM -->
        <div class="upload-area">

            <div class="upload-icon">📄</div>

            <h3>Select Your Resume</h3>

            <p>
                Upload your latest resume in PDF format.
            </p>

            <form action="${pageContext.request.contextPath}/upload-resume"
                  method="post"
                  enctype="multipart/form-data">

                <input type="file"
                       name="resume"
                       accept="application/pdf"
                       required>

                <button type="submit"
                        class="upload-btn">
                    Upload Resume
                </button>

            </form>

        </div>


        <div class="info">

            <strong>Important:</strong>

            You must upload your resume before applying for jobs.
            Recruiters will be able to view your resume when reviewing
            your job application.

        </div>

    </div>

</div>


<!-- FOOTER -->
<footer>

    © 2026 StudentJobPortal. All rights reserved.

</footer>

</body>
</html>
