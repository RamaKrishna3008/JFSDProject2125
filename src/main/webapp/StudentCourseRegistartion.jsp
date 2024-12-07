<%@page import="com.klef.jfsd.sdp.model.Course"%>
<%@page import="com.klef.jfsd.sdp.model.FacultyCourseMapping"%>
<%@page import="java.util.List"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%! int i=0; %>

<html> 
<head> 
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<style>
:root {
    --primary-color: #3498db;     /* Vibrant Blue */
    --secondary-color: #2ecc71;   /* Emerald Green */
    --accent-color: #e74c3c;      /* Bright Red */
    --background-color: #f7f9fc;  /* Soft Blue-Grey */
    --text-color: #2c3e50;        /* Dark Slate */
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    transition: all 0.3s ease;
}

body {
    font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
    background: linear-gradient(135deg, #f5f7fa 0%, #e9ecef 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    line-height: 1.6;
    color: var(--text-color);
}

.form-container {
    background-color: white;
    border-radius: 16px;
    box-shadow: 
        0 10px 25px rgba(0, 0, 0, 0.1), 
        0 6px 10px rgba(0, 0, 0, 0.05);
    width: 95%;
    max-width: 1100px;
    padding: 40px;
    animation: fadeIn 0.5s ease-out;
    border: 1px solid rgba(0, 0, 0, 0.05);
    margin-left: 215px;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

h2 {
    text-align: center;
    color: var(--primary-color);
    margin-bottom: 30px;
    font-size: 2.2rem;
    font-weight: 600;
    position: relative;
    padding-bottom: 10px;
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    width: 80px;
    height: 4px;
    background-color: var(--secondary-color);
    transform: translateX(-50%);
    border-radius: 2px;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 25px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    overflow: hidden;
    border-radius: 10px;
}

th, td {
    padding: 15px;
    text-align: center;
    border: 1px solid rgba(0, 0, 0, 0.08);
    transition: all 0.2s ease;
}

th {
    background-color: var(--primary-color);
    color: white;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-size: 0.9rem;
}

tr:nth-child(even) {
    background-color: rgba(46, 204, 113, 0.05);
}

tr:hover {
    background-color: rgba(52, 152, 219, 0.07);
}

select {
    width: 100%;
    padding: 12px;
    border: 2px solid rgba(0, 123, 255, 0.2);
    border-radius: 8px;
    background-color: white;
    font-size: 1rem;
    appearance: none;
    background-image: linear-gradient(45deg, transparent 50%, var(--primary-color) 50%),
                      linear-gradient(135deg, var(--primary-color) 50%, transparent 50%);
    background-position: calc(100% - 20px) calc(1em + 2px),
                         calc(100% - 15px) calc(1em + 2px);
    background-size: 5px 5px,
                     5px 5px;
    background-repeat: no-repeat;
}

select:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
}

input[type="submit"] {
    background: linear-gradient(to right, var(--primary-color), #2980b9);
    color: white;
    border: none;
    padding: 15px 30px;
    border-radius: 50px; 
    cursor: pointer;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    font-size: 1.1rem;
    box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
    position: relative;
    overflow: hidden;
    margin-top: 25px;
    width: 100%;
    transition: all 0.4s ease;
}

input[type="submit"]::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(120deg, transparent, rgba(255,255,255,0.3), transparent);
    transition: all 0.4s ease;
}

input[type="submit"]:hover {
    transform: translateY(-3px);
    box-shadow: 0 7px 20px rgba(52, 152, 219, 0.5);
}

input[type="submit"]:hover::before {
    left: 100%;
}

.alert-danger {
    background: linear-gradient(to center, #ff416c, #ff4b2b);
    color: white;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 5px 15px rgba(255, 75, 43, 0.4);
    animation: shake 0.5s;
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    10%, 30%, 50%, 70%, 90% { transform: translateX(-10px); }
    20%, 40%, 60%, 80% { transform: translateX(10px); }
}

@media screen and (max-width: 768px) {
    .form-container {
        width: 98%;
        padding: 20px;
        margin: 10px;
    }

    table {
        font-size: 0.9rem;
    }

    input[type="submit"] {
        font-size: 1rem;
        padding: 12px 25px;
    }
}
</style>
<link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
</head>
<body>
<%@include file="studentnavbar.jsp" %>

<c:if test="${message == null}">
<div class="form-container">
  <h2>Course Registration</h2>
  
  <form action="/Student/Courses/Register" method="post">
    <table>
      <tr> 
        <th>SNO</th>
        <th>COURSE CODE</th>
        <th>COURSE TITLE</th>
        <th>SECTION</th>
      </tr> 

      <c:forEach items="${fcm}" var="fcm" >
        <c:set var="currentFcm" value="${fcm}" scope="request" />
        <tr>
        
          <td><%=++i %></td>
          <td><c:out value="${fcm.coursecode}" /></td>
          <td><c:out value="${fcm.coursetitle}" /></td>
          <td>
            <select name="<%=i%>">
              <option value="">--Select--</option>
              <%
                Course fcmObj = (Course) request.getAttribute("currentFcm");

                if (fcmObj != null) {
                  String sectionsAttr = "sections" + fcmObj.getCourseid();

                  List<FacultyCourseMapping> sectionsList = (List<FacultyCourseMapping>) request.getAttribute(sectionsAttr);

                  if (sectionsList != null) {
                    for (FacultyCourseMapping section : sectionsList) {
                    	if(section.getCapacity()!=0){
              %>
                      <option value="<%=fcmObj.getCourseid()+"/"+section.getSection()+"/"+section.getFaculty().getId() %>">
                        <%= section.getSection() %>
                      </option>
              <%
                    }}
                  }
                }
              %>
            </select>
          </td>
        </tr>
      </c:forEach>
    </table>
    <input type="hidden" value="<%=i %>" name="n">
    <input type="submit" value="Register">
  </form>
</div>
</c:if>

<c:if test="${message != null}">
    <div class="alert alert-danger" role="alert" style="background-color: #ffebee; border-color: #ffcdd2; color: #d32f2f;">
        <h1>${message}</h1>
    </div>
</c:if>
<%i=0; %>

</body> 
</html>
