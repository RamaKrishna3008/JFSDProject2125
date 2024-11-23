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
<title>View Faculty Course Mapping</title>
<style>
  body {
    background-color: lightgrey;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Ensure the body takes the full height of the viewport */
    margin: 0;
  }

  .form-container {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 60%; /* Adjust this value to control the width of the form */
    max-width: 900px; /* Optional: sets a maximum width */
    box-sizing: border-box;
    overflow-x: auto;
  }

  h2 {
    text-align: center;
  }

  .button {
    background-color: black;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  td, th {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
  }

  th {
    font-weight: bold;
  }

  label {
    padding: 12px 12px 12px 0;
    display: inline-block;
    font-weight: bold;
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
