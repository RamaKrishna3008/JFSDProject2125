<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ include file="FacultyHome.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 

<html> 
<head> 
<title>Internals</title>
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
<style>
body {
    background-color: lightgrey;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.form-container {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 60%;
    max-width: 900px;
    box-sizing: border-box;
    overflow-x: auto;
}

h2 {
    text-align: center;
}

.course-info {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-bottom: 20px;
    text-align: left;
}

.course-info-row {
    display: flex;
    align-items: center;
    gap: 10px;
}

.course-label {
    min-width: 120px;
    font-weight: bold;
}

.course-value {
    font-weight: bold;
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
/* Add new button container style */
.button-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    padding-top: 10px;
}

/* Update submit button style */
input[type="submit"] {
    background-color: black;
    border: none;
    color: white;
    padding: 12px 30px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #333;
}
input[type="number"] {
    width: 60px;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    text-align: center;
    outline: none;
    transition: border-color 0.3s ease;
}

input[type="number"]:hover {
    border-color: #999;
}

input[type="number"]:focus {
    border-color: #333;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

input[type="number"] {
    -moz-appearance: textfield;
}

</style>
</head>
<body>

<div class="form-container">
<form action="">
    <h2>Internals</h2>
    <div class="course-info">
        <div class="course-info-row">
            <span class="course-label">Course Title:</span>
            <span class="course-value"><c:out value="${Course.coursetitle}"></c:out></span>
        </div>
        <div class="course-info-row">
            <span class="course-label">Course Code:</span>
            <span class="course-value"><c:out value="${Course.coursecode}"></c:out></span>
        </div>
    </div>
  <table>
    <tr> 
      <th>Student id</th>
      <th>Student name</th>
      <th>Give Marks(Out of 60)</th>
    </tr> 

    <c:forEach items="${slist}" var="slist"> 
        <tr> 
          <td><c:out value="${slist.student.id}" /></td> 
          <td><c:out value="${slist.student.name}" /></td> 
          <td><input type="number" max=60 min=1 name="${slist.student.id}"></td> 
        </tr> 
    </c:forEach> 
  </table>
  <div class="button-container">
            <input type="submit" value="Submit Attendance">
        </div>
  </form>
</div>

</body> 
</html>
