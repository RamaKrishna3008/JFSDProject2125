<%@page import="com.klef.jfsd.sdp.model.Student"%>
<%
Student st = (Student) session.getAttribute("student");
if (st == null) {
    response.sendRedirect("stsessionexpiry");
    return;
}
%>
<style>
.profile-pic-container {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 100;
}

.profile-pic {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #1e3a8a;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>
<div class="bg-left">
	<!-- Vertical Navbar -->
	<button class="nav-button" onclick="window.location.href='/Student/home'">Dashboard</button>
	<button class="nav-button" onclick="window.location.href='/Student/profile'">Profile</button>
	<button class="nav-button" onclick="window.location.href='/Student/ViewMyCourses'">Courses</button>
	<button class="nav-button">My CGPA</button>
	<button class="nav-button">Attendance</button>
	<button class="nav-button" onclick="window.location.href='/Logout'">Logout</button>
</div>
<div class="profile-pic-container">
<img src="/Admin/displaystudentimage?id=<%=st.getId()%>" class="profile-pic" >
</div>