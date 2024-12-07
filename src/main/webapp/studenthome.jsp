<%@ page import="com.klef.jfsd.sdp.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Student st = (Student) session.getAttribute("student");
    if (st == null) {
        response.sendRedirect("/SessionExpiry");
        return;
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
    --primary-color: #2c3e50;
    --secondary-color: #3498db;
    --background-light: #f0f4f8;
    --text-color: #2d3748;
    --text-muted: #4a5568;
    --border-color: #e2e8f0;
    --white: #ffffff;
    --accent-color: #4299e1;
    --card-background: #ffffff;
    --shadow-color: rgba(0, 0, 0, 0.1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
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
    gap: 1.5rem;
    width: 100%;
    max-width: 1200px;
}

.card {
    flex: 1;
    background-color: var(--card-background);
    border-radius: 20px;
    padding: 1.5rem;
    box-shadow: 0 10px 25px var(--shadow-color);
    text-align: center;
    border: 1px solid var(--border-color);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    margin-top:150px;
    margin-left: 160px;
}

.card::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(
        45deg, 
        transparent, 
        var(--accent-color), 
        transparent
    );
    transform: rotate(-45deg);
    opacity: 0.05;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
}

.card .icon {
    font-size: 3.5rem;
    margin-bottom: 1rem;
    color: var(--secondary-color);
    opacity: 0.8;
    transition: transform 0.3s ease;
}

.card:hover .icon {
    transform: scale(1.1);
    opacity: 1;
}

.card h3 {
    font-size: 1.1rem;
    color: var(--text-muted);
    margin-bottom: 0.5rem;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 1px;
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
<h1>Welcome, <%= st.getName() %></h1>
<jsp:include page="studentnavbar.jsp"></jsp:include>
    

    <div class="dashboard">
        <!-- CGPA Card -->
        <div class="card">
            <div class="icon">📊</div>
            <h3>CGPA : <%=st.getMycgpa() %></h3>
            
        </div>

        <!-- Registered Courses Card -->
        <div class="card">
            <div class="icon">📚</div>
            <h3>Registered Courses : ${courses}</h3>
        </div>

        <!-- Credits Count Card -->
        <div class="card">
            <div class="icon">💳</div>
            <h3>Total Credits : ${credits}</h3>
        </div>
    </div>
</body>
</html>
