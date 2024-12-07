<%@ include file="AdminNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 

<html> 
<head> 
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
    background: linear-gradient(135deg, #f4f7f9 0%, #e6eef3 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    line-height: 1.6;
    color: #2c3e50;
}

.form-container {
    background-color: #ffffff;
    border-radius: 20px;
    box-shadow: 
        0 25px 50px rgba(0, 0, 0, 0.1), 
        0 10px 20px rgba(0, 0, 0, 0.05);
    width: 75%;
    max-width: 1000px;
    padding: 30px;
    transform-style: preserve-3d;
    transform: translateZ(20px);
    border: 1px solid rgba(255, 255, 255, 0.25);
    overflow-x: auto;
    margin-left: 230px;
}

h2 {
    text-align: center;
    color: #34495e;
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
    width: 120px;
    height: 4px;
    background: linear-gradient(90deg, #5e7a9c, #7f9cb8);
    border-radius: 2px;
}

table {
    width: 100%;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 
        0 20px 40px rgba(0, 0, 0, 0.08), 
        0 10px 20px rgba(0, 0, 0, 0.05);
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 30px;
    background-color: white;
}

th, td {
    padding: 18px;
    text-align: center;
    border: 1px solid rgba(0, 0, 0, 0.06);
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

th {
    background: linear-gradient(135deg, #5e7a9c, #7f9cb8);
    color: white;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 0.95em;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

tr:nth-child(even) {
    background-color: rgba(94, 122, 156, 0.03);
}

tr:hover {
    background-color: rgba(94, 122, 156, 0.07);
    transform: scale(1.01);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: 700;
    color: #34495e;
    font-size: 0.9rem;
    letter-spacing: 0.5px;
}

/* Link Styling */
a {
    text-decoration: none;
    color: #5e7a9c;
    font-weight: 600;
    position: relative;
    transition: all 0.3s ease;
    display: inline-block;
    padding: 5px 10px;
    border-radius: 6px;
}

a:hover {
    color: #34495e;
    background-color: rgba(94, 122, 156, 0.1);
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

a:active {
    transform: translateY(1px);
    box-shadow: none;
}

.button {
    display: inline-block;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    background: linear-gradient(135deg, #5e7a9c, #7f9cb8);
    color: white;
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 10px 20px rgba(94, 122, 156, 0.2);
}

.button:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 25px rgba(94, 122, 156, 0.3);
    background: linear-gradient(135deg, #7f9cb8, #5e7a9c);
}

.button:active {
    transform: translateY(1px);
    box-shadow: 0 5px 10px rgba(94, 122, 156, 0.2);
}

@media screen and (max-width: 768px) {
    .form-container {
        width: 98%;
        padding: 20px;
        margin: 10px;
    }

    table {
        font-size: 14px;
    }

    th, td {
        padding: 12px;
    }
}

@media screen and (max-width: 768px) {
    .form-container {
        width: 98%;
        padding: 20px;
        margin: 10px;
    }

    table {
        font-size: 14px;
    }

    th, td {
        padding: 12px;
    }
}

/* Subtle Background Particle Animation */
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
        rgba(94, 122, 156, 0.03) 5%, 
        transparent 10%
    );
    animation: particleAnimation 120s linear infinite;
    z-index: -1;
}

/* Scroll Bar Styling for Overflow */
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background: rgba(94, 122, 156, 0.1);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, #5e7a9c, #7f9cb8);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
    background: linear-gradient(135deg, #7f9cb8, #5e7a9c);
}
</style>
</head> 

<body>

<div class="form-container">
  <h2>View Faculty Course Mapping</h2>

  <table>
    <tr> 
      <th>ID</th>
      <th>FACULTY ID</th>
      <th>FACULTY NAME</th>
      <th>COURSE CODE</th>
      <th>COURSE TITLE</th>
      <th>SECTION</th>
      <th>FeedBack</th>
    </tr> 

    <c:forEach items="${fcmdata}" var="fcm"> 
        <tr> 
          <td><c:out value="${fcm.mappingid}" /></td> 
          <td><c:out value="${fcm.faculty.id}" /></td> 
          <td><c:out value="${fcm.faculty.name}" /></td>
          <td><c:out value="${fcm.course.coursecode}" /></td> 
          <td><c:out value="${fcm.course.coursetitle}" /></td> 
          <td><c:out value="${fcm.section}" /></td> 
          <td><a href="feedbackSummary?facultyId=${fcm.faculty.id}&courseId=${fcm.course.courseid}">View Student FeedBack</a></td>
        </tr> 
    </c:forEach> 
  </table>
</div>

</body> 
</html>
