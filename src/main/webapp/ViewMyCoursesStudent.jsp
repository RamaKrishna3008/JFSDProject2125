<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 

<html> 
<head> 
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<style>
 
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    padding-top: 60px; /* Adjust for navbar */
}

.form-container {
    background-color: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    width: 80%;
    max-width: 1000px;
    box-sizing: border-box;
    overflow-x: auto;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 25px;
}

.button, a.button {
    background-color: #000;
    border: none;
    color: white;
    padding: 12px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.button:hover, a.button:hover {
    background-color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
}

td, th {
    padding: 15px;
    text-align: center;
    border: 1px solid #e0e0e0;
}

th {
    background-color: #f8f9fa;
    color: #333;
    font-weight: 600;
    text-transform: uppercase;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #e8e8e8;
    transition: background-color 0.3s ease;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
    font-weight: 600;
    color: #555;
}

/* Register Link Styling */
.register-link {
    text-decoration: none;
    background-color: #000;
    color: white;
    font-weight: bold;
    margin: 10px;
    display: block;
    text-align: center;
    position: absolute;
    top:120px;
    padding: 10px 20px;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.register-link:hover {
    background-color: #333;
    color: white;
}

/* View Course Materials Link Styling */
.course-materials-link {
    display: inline-block;
    background-color: #007bff;
    color: white;
    padding: 8px 15px;
    border-radius: 4px;
    text-decoration: none;
    font-size: 14px;
    transition: background-color 0.3s ease;
}

.course-materials-link:hover {
    background-color: #0056b3;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .form-container {
        width: 95%;
        padding: 15px;
    }

    table {
        font-size: 14px;
    }

    td, th {
        padding: 10px;
    }

    .course-materials-link {
        padding: 6px 12px;
        font-size: 12px;
    }
}

/* Ensure proper mobile responsiveness */
@media screen and (max-width: 480px) {
    table {
        font-size: 12px;
    }

    td, th {
        padding: 8px;
    }
}

</style>
<link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
</head>
<body>
<%@include file="studentnavbar.jsp" %>

<a href="Courses/Registration?ay=${ay}&sem=${sem}" class="register-link">Register New Courses</a>
<c:if test="${msg != null}">
    <h1 align="center">${msg}</h1>
</c:if>

<c:if test="${msg == null}">
<div class="form-container">

    

    <h2>My Courses</h2>

    <table>
        <tr>
            <th>COURSE CODE</th>
            <th>COURSE TITLE</th>
            <th>SECTION</th>
            <th>FACULTY NAME</th>
            <th>ACTIONS</th>
        </tr>

        <c:forEach items="${scm}" var="scm">
            <tr>
                <td><c:out value="${scm.course.coursecode}" /></td>
                <td><c:out value="${scm.course.coursetitle}" /></td>
                <td><c:out value="${scm.section}" /></td>
                <td><c:out value="${scm.faculty.name}" /></td>
                <td>
                    <a href="ViewCourseMaterials?cid=${scm.course.courseid}&section=${scm.section}&ay=${ay}&sem=${sem}" 
                       class="course-materials-link">
                        View Course Materials
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    </div>
    </c:if>

</body> 
</html>
