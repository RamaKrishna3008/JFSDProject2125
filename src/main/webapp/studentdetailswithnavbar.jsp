<%@ page import="com.klef.jfsd.sdp.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
Student st = (Student) session.getAttribute("student");
if (st == null) {
    response.sendRedirect("stsessionexpiry");
    return;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
</head>
<body>

	<div class="fullwidth">
		<jsp:include page="studentnavbar.jsp" />
		<div class="bg-right">
			<h2>Student Details</h2>

			<form action="updatedetails" method="post" enctype="multipart/form-data">
				<div class="info">
					<label for="profileImage">Profile Image (JPG only) and Can be set Only Once</label>
					<input type="file" id="profileImage" name="profileImage" accept=".jpg" required>
					<input type="hidden" name="batch" value="<%=st.getBatchname() %>"/>
					<h3>Personal Information</h3>
					<label for="id">ID:</label>
					<p id="id"><%= st.getId() %></p>
					<input type="hidden" name="id" value="<%= st.getId() %>">
					<label for="name">Name:</label>
					<p id="name"><%= st.getName() %></p>
					<input type="hidden" name="name" value="<%= st.getName() %>">
				</div>
				
				<div class="info">
					<h3>Additional Information</h3>
					<label for="fatherName">Father's Name:</label> 
					<input type="text" id="fatherName" name="fatherName" value="<%= st.getFatherName() %>" required> 
					<label for="motherName">Mother's Name:</label> 
					<input type="text" id="motherName" name="motherName" value="<%= st.getMotherName() %>" required> 
					<label for="parentEmail">Parent Email:</label> 
					<input type="text" id="parentEmail" name="parentEmail" value="<%= st.getParentEmail()%>" readonly> 
					<label for="contact">Contact:</label> 
					<input type="text" id="contact" name="contact" value="<%= st.getContact() %>" required>
					<label for="address">Address:</label> 
					<textarea cols="30" rows="3" name="address" required><%= st.getAddress() %></textarea>
				</div>
				
				<div class="info">
					<h3>Security Information</h3>
					<label for="password">Password:</label> 
					<input type="text" id="password" name="password" placeholder="Enter Password" required> 
					<label for="confirm_password">Confirm Password:</label> 
					<input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm your Password" required>
				</div>
				
				<input type="submit" value="Submit">
			</form>
		</div>
	</div>

</body>
</html>
