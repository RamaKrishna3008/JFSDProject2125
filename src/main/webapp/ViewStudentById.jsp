<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

:root {
    --primary-color: #1a237e;
    --secondary-color: #283593;
    --background-color: #f4f6f9;
    --text-color: #2d3748;
    --white: #ffffff;
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
    background-color: var(--background-color);
    color: var(--text-color);
    line-height: 1.6;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* Navbar Toggle */
.navbar-toggle {
    position: fixed;
    top: 20px;
    left: 20px;
    z-index: 1100;
    background: var(--primary-color);
    border: none;
    border-radius: 50%;
    width: 45px;
    height: 45px;
    cursor: pointer;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 4px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease;
}

.navbar-toggle:hover {
    transform: rotate(90deg);
}

.navbar-toggle span {
    width: 20px;
    height: 3px;
    background-color: white;
    border-radius: 2px;
}

/* Sidebar */
.sidebar {
    position: fixed;
    top: 0;
    left: -300px;
    height: 100vh;
    width: 300px;
    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
    padding: 30px;
    transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    z-index: 1000;
    box-shadow: 5px 0 15px rgba(0, 0, 0, 0.1);
}

.sidebar.active {
    left: 0;
}

.sidebar h2 {
    color: white;
    text-align: center;
    margin-bottom: 40px;
    font-family: 'Poppins', sans-serif;
}

.sidebar .dropdown a {
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    display: block;
    padding: 12px 20px;
    margin: 10px 0;
    border-radius: 8px;
    transition: all 0.3s ease;
    font-weight: 500;
}

.sidebar .dropdown a:hover {
    background-color: rgba(255, 255, 255, 0.1);
    color: white;
    transform: translateX(10px);
}

/* Main Content */
.main-content {
    transition: margin-left 0.4s ease;
    padding: 20px;
}

.main-content.shifted {
    margin-left: 300px;
}

/* Page Title */
h3 {
    color: var(--primary-color);
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 40px;
    text-align: center;
    font-family: 'Poppins', sans-serif;
}

h3 u {
    border-bottom: 4px solid var(--primary-color);
    text-decoration: none;
    padding-bottom: 8px;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .sidebar {
        width: 100%;
        left: -100%;
    }
    
    .sidebar.active {
        left: 0;
    }
    
    .main-content.shifted {
        margin-left: 0;
    }
}
.card {
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 20px;
    max-width: 400px;
    width: 100%;
    text-align: left;
    position: relative;
    margin: 0 auto;
}

.action-links {
    position: absolute;
    top: 20px;
    right: 20px;
    display: flex;
    gap: 10px;
}

.action-links a {
    text-decoration: none;
    padding: 6px 12px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 0.8rem;
    transition: all 0.3s ease;
    display: inline-block;
}

.action-links a:first-child {
    background-color: #2196F3;
    color: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.action-links a:last-child {
    background-color: #f44336;
    color: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.action-links a:first-child:hover {
    background-color: #1976D2;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
}

.action-links a:last-child:hover {
    background-color: #d32f2f;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
}

@media (max-width: 480px) {
    .action-links {
        top: 10px;
        right: 10px;
        gap: 5px;
    }
    
    .action-links a {
        padding: 4px 8px;
        font-size: 0.7rem;
    }
}

.profile-image-container {
    position: absolute;
    top: 55px;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border: 3px solid #ffffff;
}

.card h3 {
    text-align: center;
    color: #333333;
    margin-top: 120px;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #f0f0f0;
}

@media (max-width: 480px) {
    .card {
        padding: 15px;
        margin: 60px 10px 10px 10px;
    }
    
    .action-links {
        top: 10px;
        right: 10px;
        gap: 5px;
    }
    
    .action-links a {
        font-size: 0.8rem;
    }
}



        .profile-image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card p {
            margin: 12px 0;
            padding: 8px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .card p:hover {
            background-color: #f8f9fa;
        }

        .label {
            font-weight: 600;
            color: #1a237e;
            min-width: 120px;
            display: inline-block;
        }

        .value {
            color: #555555;
        }

        @media (max-width: 480px) {
            .card {
                padding: 20px;
                margin: 60px 15px 15px 15px;
            }

            .profile-image-container {
                width: 80px;
                height: 80px;
            }

            .card h3 {
                margin-top: 60px;
            }
        }
    </style>
</head>

<body>
    <button class="navbar-toggle" id="navbarToggle" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
    </button>

    <div class="sidebar" id="sidebar">
        <h2 style="color: white; text-align: center; margin-bottom: 30px;">Menu</h2>
        <div class="dropdown">
            <a href="Home" style="color: white; text-decoration: none; display: block; padding: 10px; margin: 5px 0;">Home</a>
            <a href="ViewAllStudent" style="color: white; text-decoration: none; display: block; padding: 10px; margin: 5px 0;">View Student</a>
        </div>
    </div>

    <div class="card">
    <div class="action-links">
        <a href="UpdateStudent?id=${student.id}">Update</a>
        <a href="DeleteStudent?id=${student.id}">Delete</a>
        
    </div>
    <br>
    <div class="profile-image-container">
        <img alt="profilepic" src="/Admin/displaystudentimage?id=${student.id}">
    </div>
        <h3><u>View Student By ID</u></h3>
        <p><span class="label">ID:</span> <span class="value"><c:out value="${student.id}" /></span></p>
        <p><span class="label">Academic Year:</span> <span class="value"><c:out value="${student.batchname}" /></span></p>
        <p><span class="label">Name:</span> <span class="value"><c:out value="${student.name}" /></span></p>
        <p><span class="label">Father's Name:</span> <span class="value"><c:out value="${student.fatherName}" /></span></p>
        <p><span class="label">Mother's Name:</span> <span class="value"><c:out value="${student.motherName}" /></span></p>
        <p><span class="label">Address:</span> <span class="value"><c:out value="${student.address}" /></span></p>
        <p><span class="label">Contact No:</span> <span class="value"><c:out value="${student.contact}" /></span></p>
        <p><span class="label">Status:</span> <span class="value"><c:out value="${student.status}" /></span></p>
        <p><span class="label">Registartion Status:</span> <span class="value"><c:out value="${student.registarationStatus}" /></span></p>
        <p><span class="label">Creation Time:</span> <br><span class="value"><c:out value="${student.createdAt}" /></span></p>
        <p><span class="label">Last Updated Time:</span> <br><span class="value"><c:out value="${student.updatedAt}" /></span></p>
        
        
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const navbarToggle = document.getElementById('navbarToggle');
            const sidebar = document.getElementById('sidebar');
            
            navbarToggle.addEventListener('click', function() {
                sidebar.classList.toggle('active');
            });

            document.addEventListener('click', function(event) {
                if (!sidebar.contains(event.target) && !navbarToggle.contains(event.target)) {
                    sidebar.classList.remove('active');
                }
            });
        });
    </script>
</body>
</html>