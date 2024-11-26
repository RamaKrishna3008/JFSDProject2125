<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ include file="FacultyHome.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 

<%
Faculty fac = (Faculty)session.getAttribute("faculty");
	if(fac==null)
	{
		response.sendRedirect("SessionExpiry");
		return ;
	}
%>

<html> 
<head> 
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<style>
  /* Global Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    line-height: 1.6;
    color: #333;
}

.form-container {
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    width: 90%;
    max-width: 1000px;
    padding: 30px;
    margin: 20px;
    overflow-x: auto;
}

h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 25px;
    font-size: 24px;
    border-bottom: 3px solid #3498db;
    padding-bottom: 10px;
}

/* Table Styles */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

th, td {
    padding: 15px;
    text-align: center;
    border: 1px solid #e0e0e0;
}

th {
    background-color: #3498db;
    color: white;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
    transition: background-color 0.3s ease;
}

/* Enhanced Href Styling */
td a {
    display: inline-block;
    margin: 5px;
    padding: 8px 15px;
    text-decoration: none;
    color: white;
    border-radius: 4px;
    transition: all 0.3s ease;
    font-weight: 500;
    text-transform: uppercase;
    font-size: 0.8em;
    letter-spacing: 0.5px;
    position: relative;
    overflow: hidden;
}

/* Specific Href Styles with Gradient and Hover Effects */
td a:nth-child(1) {
    background: linear-gradient(135deg, #2ecc71, #27ae60); /* Green gradient for Register */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

td a:nth-child(3) {
    background: linear-gradient(135deg, #f39c12, #d35400); /* Orange gradient for Add Internals */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

td a:nth-child(5) {
    background: linear-gradient(135deg, #3498db, #2980b9); /* Blue gradient for Add Materials */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}



/* Responsive Adjustments */
@media screen and (max-width: 768px) {
    .form-container {
        width: 95%;
        padding: 15px;
        margin: 10px;
    }

    table {
        font-size: 14px;
    }

    th, td {
        padding: 10px;
    }

    td a {
        padding: 6px 10px;
        margin: 3px;
        font-size: 0.7em;
    }
}

/* Print Styles */
@media print {
    body {
        background-color: white;
    }

    .form-container {
        box-shadow: none;
        width: 100%;
        padding: 0;
    }

    table {
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid black;
    }

    td a {
        color: black !important;
        background: none !important;
        text-decoration: underline;
    }
}
</style>
</head> 

<body>

<div class="form-container">
  <h2>My Courses</h2>

  <table>
    <tr> 
      <th>COURSE CODE</th>
      <th>COURSE TITLE</th>
      <th>SECTION</th>
      <th>Action</th>
    </tr> 

    <c:forEach items="${fcmdata}" var="fcm"> 
        <tr> 
          <td><c:out value="${fcm.course.coursecode}" /></td> 
          <td><c:out value="${fcm.course.coursetitle}" /></td> 
          <td><c:out value="${fcm.section}" /></td> 
          <td><a href="GetStudentsByCourses?fid=${fcm.faculty.id }&cid=${fcm.course.courseid}&section=${fcm.section}">Register</a><br><a href="AddStudentInternals?fid=${fcm.faculty.id }&cid=${fcm.course.courseid}&section=${fcm.section}">Add Internals</a><br><a href="AddCourseMaterials?cid=${fcm.course.courseid}&section=${fcm.section}">Add Materials</a></td>
        </tr> 
    </c:forEach> 
  </table>
</div>

</body> 
</html>
