<%@ page import="com.klef.jfsd.sdp.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Student st = (Student) session.getAttribute("student");
    if (st == null) {
        response.sendRedirect("/SessionExpiry");
        return ;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
    <link rel="icon" href="/images/university-icon.png">
    <style>
        :root {
            --primary-color: #1e90ff;
            --secondary-color: #ff6f61;
            --background-light: #f0f8ff;
            --text-color: #2d3748;
            --text-muted: #6c757d;
            --border-color: #e2e8f0;
            --white: #ffffff;
            --accent-color: #38b2ac;
            --card-background: #ffffff;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-light);
            line-height: 1.6;
            color: var(--text-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 2rem;
        }

        .welcome-header {
            text-align: center;
            margin-bottom: 2rem;
            color: var(--primary-color);
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        .dashboard {
            display: flex;
            justify-content: center;
            align-items: stretch;
            gap: 2rem;
            width: 100%;
            max-width: 1200px;
        }

        .card {
            flex: 1;
            background-color: var(--card-background);
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 10px 20px var(--shadow-color);
            text-align: center;
            border: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease;
            position: relative;
            overflow: hidden;
            margin-top: 100px;
            margin-left: 100px;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }

        .card .icon {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: var(--secondary-color);
            transition: transform 0.3s ease;
        }

        .card:hover .icon {
            transform: scale(1.2);
        }

        .card h3 {
            font-size: 1.2rem;
            color: var(--text-muted);
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .card .value {
            font-size: 2rem;
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <h1 class="welcome-header">Welcome, <%= st.getName() %>!</h1>
    <jsp:include page="studentnavbar.jsp"></jsp:include>

    <div class="dashboard">
        <!-- CGPA Card -->
        <div class="card">
            <div class="icon">🎓</div>
            <h3>CGPA: <%= st.getMycgpa() %></h3>
        </div>

        <!-- Registered Courses Card -->
        <div class="card">
            <div class="icon">📘</div>
            <h3>Registered Courses: ${courses}</h3>
        </div>

        <!-- Credits Count Card -->
        <div class="card">
            <div class="icon">⭐</div>
            <h3>Total Credits: ${credits}</h3>
        </div>
    </div>
</body>
</html>
