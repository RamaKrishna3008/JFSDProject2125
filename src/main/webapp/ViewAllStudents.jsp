<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ERP</title>
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

/* Search Input */
#myInput {
    width: 100%;
    max-width: 500px;
    margin: 0 auto 30px;
    display: block;
    padding: 15px 25px;
    font-size: 1rem;
    border: 2px solid #e2e8f0;
    border-radius: 50px;
    background-color: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
}

#myInput:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 4px rgba(26, 35, 126, 0.1);
}

/* Table Styles */
#myTableContainer {
    background: white;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
    overflow: hidden;
}

#myTable {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}

#myTable th {
    background: linear-gradient(145deg, var(--primary-color), var(--secondary-color));
    color: white;
    font-weight: 600;
    font-size: 0.9rem;
    text-transform: uppercase;
    letter-spacing: 1px;
    padding: 18px;
    text-align: left;
}

#myTable td {
    padding: 16px;
    border-bottom: 1px solid #edf2f7;
    vertical-align: middle;
    font-size: 0.95rem;
}

#myTable tr:hover {
    background-color: #f8f9ff;
    transition: background-color 0.3s ease;
}

#myTable td img {
    width: 60px;
    height: 60px;
    border-radius: 12px;
    object-fit: cover;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Action Buttons */
#myTable td .action-cell {
    display: flex;
    gap: 10px;
}

#myTable td a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 8px 16px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 500;
    font-size: 0.875rem;
    transition: all 0.3s ease;
    min-width: 80px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

#myTable td a:nth-child(1) { background-color: #4CAF50; color: white; }
#myTable td a:nth-child(2) { background-color: #2196F3; color: white; }
#myTable td a:nth-child(4) { background-color: #f44336; color: white; }
#myTable td a:nth-child(3) { background-color: #FF9800; color: white; }

#myTable td a:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
    
    #myTable {
        font-size: 0.8rem;
    }
    
    #myTable td, #myTable th {
        padding: 12px;
    }
}
.action-links {
    padding: 8px !important;
}

.action-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 6px;
    align-items: center;
}

.action-grid a {
    font-size: 0.8rem;
    padding: 6px 10px;
    text-align: center;
}

/* Toast Notification */
.toast {
    position: fixed;
    bottom: 20px;
    right: 20px;
    min-width: 300px;
    padding: 16px 20px;
    border-radius: 10px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 1200;
}

.toast.show {
    opacity: 1;
}

.toast.success {
    background: linear-gradient(145deg, #4CAF50, #43A047);
    color: white;
}

.toast.failure {
    background: linear-gradient(145deg, #f44336, #e53935);
    color: white;
}
    </style>
    
    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";
                td = tr[i].getElementsByTagName("td");
                for (var j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            break;
                        }
                    }
                }
            }
        }
    </script>
</head>
<body>
    <!-- Add the toggle button -->
    <button class="navbar-toggle" id="navbarToggle" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
    </button>

    <!-- Add the sidebar -->
    <div class="sidebar" id="sidebar">
        <h2 style="color: white; text-align: center; margin-bottom: 30px;">Menu</h2>
        <div class="dropdown">
            <a href="Home" style="color: white; text-decoration: none; display: block; padding: 10px; margin: 5px 0;">Home</a>
            <a href="ViewAllStudent" style="color: white; text-decoration: none; display: block; padding: 10px; margin: 5px 0;">View Student</a>
            <!-- Add more menu items as needed -->
        </div>
    </div>

    <!-- Wrap your existing content in a main-content div -->
    <div class="main-content" id="mainContent">
        <!-- Your existing content here -->
        <h3 align="center"><u>View All Student</u></h3>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Student Name">
        <!-- Rest of your existing content -->
    </div>

    <script>
    // Add this new script for toggle functionality
    document.addEventListener('DOMContentLoaded', function() {
        const navbarToggle = document.getElementById('navbarToggle');
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('mainContent');
        
        navbarToggle.addEventListener('click', function() {
            sidebar.classList.toggle('active');
            mainContent.classList.toggle('shifted');
        });

        // Close sidebar when clicking outside
        document.addEventListener('click', function(event) {
            if (!sidebar.contains(event.target) && !navbarToggle.contains(event.target)) {
                sidebar.classList.remove('active');
                mainContent.classList.remove('shifted');
            }
        });
    });

   </script>



<table align=center id="myTable">

<tr class="header">

<th>Student Image</th>
<th>Academic Year</th>
<th>ID</th>
<th>Name</th>
<th>Father Name</th>
<th>Mother Name</th>
<th>Contact No</th>
<th>Address</th>
<th>Status</th>
<th>Creation Time</th>
<th>Updated Time</th>
<th>Update Status</th>
</tr>

<c:forEach items="${studentlist}" var="student">

<tr>
<td><img src='displaystudentimage?id=${student.id}' width="10%" height="10%" > </td>
<td> <c:out value="${student.batchname}"></c:out>  </td>
<td> <c:out value="${student.id}"></c:out>  </td>
<td> <c:out value="${student.name}"></c:out>   </td>
<td> <c:out value="${student.fatherName}"></c:out>   </td>
<td> <c:out value="${student.motherName}"></c:out>   </td>
<td> <c:out value="${student.contact}"></c:out>   </td>
<td> <c:out value="${student.address}"></c:out>   </td>
<td> <c:out value="${student.status}"></c:out>   </td>
<td> <c:out value="${student.createdAt}"></c:out>   </td>
<td> <c:out value="${student.updatedAt}"></c:out>   </td>
<td class="action-links">
    <div class="action-grid">
        <a href="UpdateStudent?id=${student.id}">Update</a>
        <a href="ViewStudentById?id=${student.id}">View</a>
        <a href="UpdateStudentRegistartionStatus?id=${student.id}">Permit</a>
        <a href="DeleteStudent?id=${student.id}">Delete</a>
    </div>
</td>


</tr>

</c:forEach>

</table>

<div id="toast" class="toast"></div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            if (message) {
                const toast = document.getElementById("toast");
                toast.textContent = message;
                
                    toast.classList.add("show", "success");
                
                
                setTimeout(() => {
                    toast.classList.remove("show", "success");
                }, 3000);
            }
        });
    </script>
    
</body>

</html>
