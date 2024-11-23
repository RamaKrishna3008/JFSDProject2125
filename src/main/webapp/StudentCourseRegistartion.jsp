<%@page import="com.klef.jfsd.sdp.model.Course"%>
<%@page import="com.klef.jfsd.sdp.model.FacultyCourseMapping"%>
<%@page import="java.util.List"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%! int i=0; %>

<html> 
<head> 
<title>View Course</title>
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
<link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
</head>
<body>
<%@include file="studentnavbar.jsp" %>

<c:if test="${message == null}">
<div class="form-container">
  <h2>My Courses</h2>
  
  <form action="/Student/Courses/Register" method="post">
    <table>
      <tr> 
        <th>SNO</th>
        <th>COURSE CODE</th>
        <th>COURSE TITLE</th>
        <th>SECTION</th>
      </tr> 

      <c:forEach items="${fcm}" var="fcm">
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
              %>
                      <option value="<%=fcmObj.getCourseid()+"/"+section.getSection()+"/"+section.getFaculty().getId() %>">
                        <%= section.getSection() %>
                      </option>
              <%
                    }
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
  <h1>${message}</h1>
</c:if>


</body> 
</html>
