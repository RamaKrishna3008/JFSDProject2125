<%@page import="com.klef.jfsd.sdp.model.Admin"%>
<%@ include file="AdminNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <link rel="stylesheet" href="style.css">
    <style>
    
    
        
        :root {
            --primary-color: #1F2937;
            --secondary-color: #3B82F6;
            --background-light: #f1f5f9;
            --card-background: #ffffff;
            --text-color: #2d3748;
            --border-color: #e2e8f0;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--background-light);
            display: flex;
            min-height: 100vh;
            color: var(--text-color);
        }

        .dashboard-container {
            display: flex;
            width: calc(100% - 260px);
            margin-left: 260px;
            padding: 2rem;
            flex-wrap: wrap;
            gap: 1.5rem;
            justify-content: center;
        }

        .dashboard-card {
            background-color: var(--card-background);
            border-radius: 16px;
            padding: 1.5rem;
            width: calc(33.333% - 1.5rem);
            min-width: 250px;
            box-shadow: 0 10px 25px var(--shadow-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .dashboard-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                45deg, 
                transparent, 
                var(--secondary-color), 
                transparent
            );
            transform: rotate(-45deg);
            opacity: 0.05;
        }

        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }

        .dashboard-card .icon {
            margin-bottom: 1rem;
            color: var(--secondary-color);
            opacity: 0.8;
            transition: transform 0.3s ease;
        }

        .dashboard-card .icon svg {
            width: 4rem;
            height: 4rem;
        }

        .dashboard-card:hover .icon {
            transform: scale(1.1);
            opacity: 1;
        }

        .dashboard-card h3 {
            font-size: 1.1rem;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .dashboard-card .count {
            font-size: 2.5rem;
            color: var(--secondary-color);
            font-weight: 700;
        }

        @media screen and (max-width: 1024px) {
            .dashboard-container {
                width: 100%;
                margin-left: 0;
                padding: 1rem;
            }

            .dashboard-card {
                width: calc(50% - 1.5rem);
            }
        }

        @media screen and (max-width: 768px) {
            .dashboard-card {
                width: 100%;
            }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .dashboard-card {
            animation: float 4s ease-in-out infinite;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Student Count Card -->
        <div class="dashboard-card">
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.25M13.5 7a4 4 0 11-8 0 4 4 0 018 0z" />
                </svg>
            </div>
            <h3>Total Students</h3>
            <div class="count">${studentCount}</div>
        </div>

        <!-- Faculty Count Card -->
        <div class="dashboard-card">
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                </svg>
            </div>
            <h3>Total Faculty</h3>
            <div class="count">${facultyCount}</div>
        </div>

        <!-- Course Count Card -->
        <div class="dashboard-card">
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                </svg>
            </div>
            <h3>Total Courses</h3>
            <div class="count">${courseCount}</div>
        </div>
    </div>
    
    
     
</body>
</html>
