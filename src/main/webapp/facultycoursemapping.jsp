<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ include file="AdminHome.jsp"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%String msg = request.getParameter("msg"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    transition: all 0.3s ease;
}

body {
    font-family: 'Inter', 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
    background: linear-gradient(135deg, #f6f8f9 0%, #e5ebee 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    line-height: 1.6;
    color: #2c3e50;
    perspective: 1000px;
}

.form-container {
    background-color: #ffffff;
    border-radius: 20px;
    box-shadow: 
        0 25px 50px rgba(0, 0, 0, 0.1), 
        0 10px 20px rgba(0, 0, 0, 0.05);
    width: 100%;
    max-width: 500px;
    padding: 40px;
    border: 1px solid rgba(255, 255, 255, 0.25);
}

h2 {
    text-align: center;
    color: #2c3e50;
    font-size: 2rem;
    margin-bottom: 30px;
    font-weight: 800;
    letter-spacing: -1px;
    position: relative;
    padding-bottom: 15px;
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 4px;
    background: linear-gradient(90deg, #3498db, #2ecc71);
    border-radius: 2px;
}

h3 {
    color: #e74c3c;
    text-align: center;
    font-size: 1rem;
    margin-bottom: 20px;
    font-weight: 600;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: 700;
    color: #34495e;
    font-size: 0.9rem;
    letter-spacing: 0.5px;
}

input[type=text],
input[type=password],
input[type=number],
input[type=email],
select,
input[type=date],
input[type=datetime-local] {
    width: 100%;
    padding: 12px 15px;
    margin-bottom: 15px;
    border: 2px solid rgba(52, 152, 219, 0.2);
    border-radius: 10px;
    font-size: 16px;
    outline: none;
    transition: all 0.3s ease;
    background-color: #f9f9f9;
}

input[type=text]:focus,
input[type=password]:focus,
input[type=number]:focus,
input[type=email]:focus,
select:focus,
input[type=date]:focus,
input[type=datetime-local]:focus {
    border-color: #3498db;
    box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
}

select {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath d='M1 4 L6 9 L11 4' fill='none' stroke='%2334495e' stroke-width='2'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 15px center;
    padding-right: 30px;
}

.button {
    display: inline-block;
    width: 48%;
    padding: 12px 20px;
    margin: 10px 1%;
    border: none;
    border-radius: 8px;
    background: linear-gradient(135deg, #3498db, #2980b9);
    color: white;
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 10px 20px rgba(52, 152, 219, 0.2);
}

.button:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 25px rgba(52, 152, 219, 0.3);
    background: linear-gradient(135deg, #2980b9, #3498db);
}

.button:active {
    transform: translateY(1px);
    box-shadow: 0 5px 10px rgba(52, 152, 219, 0.2);
}

table {
    width: 100%;
    border-spacing: 0 15px;
}

td {
    padding: 8px;
    vertical-align: top;
}

.center {
    text-align: center;
}

@media (max-width: 600px) {
    .form-container {
        width: 95%;
        padding: 25px;
        margin: 10px;
    }

    h2 {
        font-size: 1.5rem;
    }

    input[type=text],
    input[type=password],
    input[type=number],
    input[type=email],
    select,
    input[type=date],
    input[type=datetime-local] {
        font-size: 14px;
        padding: 10px;
    }

    .button {
        font-size: 14px;
        padding: 10px 15px;
    }
}

/* Subtle Background Animation */
@keyframes particleAnimation {
    0% { transform: translateY(0) rotate(0deg); }
    100% { transform: translateY(-100vh) rotate(360deg); }
}

body::before {
    content: "";
    position: fixed;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: repeating-radial-gradient(
        circle at center, 
        transparent 0%, 
        rgba(52, 152, 219, 0.03) 5%, 
        transparent 10%
    );
    animation: particleAnimation 120s linear infinite;
    z-index: -1;
}
</style>
</head>
<body>

<div class="form-container">
  <h2>Faculty Course Mapping</h2>

  <h3><%if(msg!=null){%>
  <%=msg%> 
  <%}%></h3>
  
  <form method="post" action="fcoursemappinginsert">
    <table>
      <tr>
        <td><label>Select Faculty</label></td>
        <td>
          <select name="fid" required>
            <option value="">--Select--</option>
            <c:forEach items="${facultydata}" var="faculty"> 
              <option value="${faculty.id}">${faculty.id}-${faculty.name}</option>
            </c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td><label>Select Course</label></td>
        <td>
          <select name="cid" required>
            <option value="">--Select--</option>
            <c:forEach items="${coursedata}" var="course"> 
              <option value="${course.courseid}">${course.coursecode}-${course.coursetitle}</option>
            </c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td><label>Provide Section</label></td>
        <td>
          <input type="number" name="section" min="1" max="40" required>
        </td>
      </tr>
      <tr>
        <td></td>
        <td class="center">
        <input type="hidden" name="ay" value="${ay }">
        <input type="hidden" name="sem" value="${sem }">
          <input type="submit" value="Submit" class="button">
          <input type="reset" value="Clear" class="button">
        </td>
      </tr>
    </table>
  </form>
</div>

</body>
</html>
