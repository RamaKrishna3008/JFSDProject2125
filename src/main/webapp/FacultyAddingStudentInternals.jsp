<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ include file="FacultyHome.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 

<html> 
<head> 
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<style>
  :root {
    --primary-color: #2c3e50;
    --secondary-color: #3498db;
    --background-light: #f4f6f7;
    --text-color: #333;
    --border-color: #e0e4e8;
    --white: #ffffff;
    --accent-color: #e74c3c;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
    background-color: var(--background-light);
    line-height: 1.6;
    color: var(--text-color);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
}

.form-container {
    width: 100%;
    max-width: 1200px;
    background-color: var(--white);
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
    padding: 30px;
    border: 1px solid var(--border-color);
    margin-left: 250px;
}

h2 {
    text-align: center;
    color: var(--primary-color);
    margin-bottom: 20px;
    font-weight: 600;
}

.course-info {
    background-color: #f9f9f9;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid var(--border-color);
}

.course-info-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}

.course-label {
    font-weight: 600;
    color: var(--primary-color);
}

.course-value {
    color: var(--secondary-color);
}

.section-badge {
    background-color: var(--secondary-color);
    color: white;
    padding: 5px 10px;
    border-radius: 4px;
    font-size: 0.9em;
    text-align: right;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table th, table td {
    border: 1px solid var(--border-color);
    padding: 12px;
    text-align: left;
}

table th {
    background-color: var(--primary-color);
    color: white;
    font-weight: 600;
}

table tr:nth-child(even) {
    background-color: #f8f9fa;
}

input[type="number"] {
    width: 100%;
    padding: 10px;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    appearance: none;
    -webkit-appearance: none;
}

input[type="number"]:focus {
    outline: none;
    border-color: var(--secondary-color);
    box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
}

.button-container {
    display: flex;
    justify-content: center;
}

input[type="submit"] {
    background-color: var(--secondary-color);
    color: white;
    border: none;
    padding: 12px 30px;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
    transition: background-color 0.3s ease, transform 0.1s ease;
}

input[type="submit"]:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
}

.alert-danger {
    background-color: var(--accent-color);
    color: white;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
}

/* Responsive Design */
@media screen and (max-width: 600px) {
    .form-container {
        padding: 15px;
        width: 100%;
    }

    .course-info-row {
        flex-direction: column;
    }

    table {
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
    }
}

*:focus {
    outline: 2px solid var(--secondary-color);
    outline-offset: 2px;
}

input, button, .form-container {
    transition: all 0.3s ease;
}

</style>
</head>
<body>
<c:if test="${msg == null}">
<div class="form-container">
<form action="AddStudentInternals/Post" method="post">
    <h2>Internals</h2>
    <div class="course-info">
        <div class="course-info-row">
            <span class="course-label">Course Title:</span>
            <span class="course-value"><c:out value="${Course.coursetitle}"></c:out></span>
        </div>
        <div class="course-info-row">
            <span class="course-label">Course Code:</span>
            <span class="course-value"><c:out value="${Course.coursecode}"></c:out></span>
            <input type="hidden"  name ="courseId" value="${Course.courseid}">
        </div>
        <div class="section-badge">
                    Section: <c:out value="${section}"></c:out>
                     <input type="hidden" name ="section" value="${section}">
                </div>
    </div>
  <table>
    <tr> 
      <th>Student id</th>
      <th>Student name</th>
      <th>Give Marks(Out of 60)</th>
    </tr> 

    <c:forEach items="${slist}" var="slist" varStatus="status" > 
        <tr> 
          <td><c:out value="${slist.student.id}" /></td> 
          <td><c:out value="${slist.student.name}" /></td> 
          <c:if test="${slist.studentInternals == -1 }">
          <td><input type="number" max=60 min=1 name="${status.index}"></td> 
          </c:if>
          <c:if test="${slist.studentInternals != -1 }">
          <td><c:out value="${slist.studentInternals}"></c:out> (Already Posted)</td>
          </c:if>
        </tr> 
    </c:forEach> 
  </table>
  <div class="button-container">
            <input type="submit" value="Post Internals">
        </div>
  </form>
</div>
</c:if>
<c:if test="${msg != null}">
    <div class="alert alert-danger" style="background-color: #ffebee; border-color: #ffcdd2; color: #d32f2f;">
        <h1>${msg}</h1>
    </div>
</c:if>
</body> 
</html>
