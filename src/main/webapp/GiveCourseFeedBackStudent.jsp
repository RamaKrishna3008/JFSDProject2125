<%@page import="com.klef.jfsd.sdp.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Student st = (Student) session.getAttribute("student");
if (st == null) {
    response.sendRedirect("stsessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f4f8;
    line-height: 1.6;
    color: #333;
}

.container {
    max-width: 650px;
    margin: 40px auto;
    padding: 30px;
    background: #ffffff;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    border-radius: 12px;
    border-top: 5px solid #4a90e2;
}

h1 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 25px;
    font-weight: 600;
}

.question {
    margin: 25px 0;
    padding: 15px;
    background-color: #f9fcff;
    border-radius: 8px;
    border-left: 4px solid #4a90e2;
}

.question p {
    margin-bottom: 15px;
    color: #2c3e50;
    font-weight: 500;
}

.options {
    margin-top: 15px;
}

.options label {
    display: block;
    margin-bottom: 10px;
    cursor: pointer;
    padding: 8px 15px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.options label:hover {
    background-color: #e6f2ff;
}

.options input[type="radio"] {
    margin-right: 10px;
    accent-color: #4a90e2;
}

.submit-btn {
    text-align: center;
    margin-top: 30px;
}

button {
    background-color: #4a90e2;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

button:hover {
    background-color: #357abd;
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}

/* Responsive adjustments */
@media (max-width: 600px) {
    .container {
        margin: 20px;
        padding: 20px;
    }
}
/* Styling for system messages and alerts */
.alert {
    max-width: 650px;
    margin: 40px auto;
    padding: 25px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    background-color: #ffebee;
    border-left: 5px solid #ef5350;
}

.alert h1 {
    color: #d32f2f;
    font-size: 1.8rem;
    margin: 0;
    font-weight: 600;
}

/* Variant for success messages */
.alert-success {
    background-color: #e8f5e9;
    border-left-color: #4caf50;
}

.alert-success h1 {
    color: #2e7d32;
}

/* Variant for warning messages */
.alert-warning {
    background-color: #fff3e0;
    border-left-color: #ff9800;
}

.alert-warning h1 {
    color: #f57c00;
}

/* Responsive adjustments */
@media (max-width: 600px) {
    .alert {
        margin: 20px;
        padding: 20px;
    }
    
    .alert h1 {
        font-size: 1.5rem;
    }
}
    </style>
</head>
<body>
<jsp:include page="studentnavbar.jsp" />
<c:if test="${message == null}">
    <div class="container">
        <h1>Faculty Feedback Form</h1><br>
        <b>Course Name : ${coursename}</b><br><b>Faculty Name : ${facultyname}</b>
        <form action="submitFeedback" method="post">
      	<input type="hidden" name="courseId" value="${courseId}">
      	<input type="hidden" name="facultyId" value="${fid}">
      	<input type="hidden" name="studentId" value="<%=st.getId()%>">
            <div class="question">
                <p>1. How would you rate the faculty's knowledge of the subject?</p>
                <div class="options">
                    <label><input type="radio" name="question1" value="Excellent" required> Excellent</label>
                    <label><input type="radio" name="question1" value="Good"> Good</label>
                    <label><input type="radio" name="question1" value="Average"> Average</label>
                    <label><input type="radio" name="question1" value="Poor"> Poor</label>
                </div>
            </div>
            <div class="question">
                <p>2. How well does the faculty explain concepts?</p>
                <div class="options">
                    <label><input type="radio" name="question2" value="Excellent" required> Excellent</label>
                    <label><input type="radio" name="question2" value="Good"> Good</label>
                    <label><input type="radio" name="question2" value="Average"> Average</label>
                    <label><input type="radio" name="question2" value="Poor"> Poor</label>
                </div>
            </div>
            <div class="question">
                <p>3. How approachable is the faculty for doubts or clarification?</p>
                <div class="options">
                    <label><input type="radio" name="question3" value="Excellent" required> Excellent</label>
                    <label><input type="radio" name="question3" value="Good"> Good</label>
                    <label><input type="radio" name="question3" value="Average"> Average</label>
                    <label><input type="radio" name="question3" value="Poor"> Poor</label>
                </div>
            </div>
            <div class="question">
                <p>4. How would you rate the faculty's punctuality and preparation?</p>
                <div class="options">
                    <label><input type="radio" name="question4" value="Excellent" required> Excellent</label>
                    <label><input type="radio" name="question4" value="Good"> Good</label>
                    <label><input type="radio" name="question4" value="Average"> Average</label>
                    <label><input type="radio" name="question4" value="Poor"> Poor</label>
                </div>
            </div>
            <div class="question">
                <p>5. How effective is the faculty's use of teaching aids and technology?</p>
                <div class="options">
                    <label><input type="radio" name="question5" value="Excellent" required> Excellent</label>
                    <label><input type="radio" name="question5" value="Good"> Good</label>
                    <label><input type="radio" name="question5" value="Average"> Average</label>
                    <label><input type="radio" name="question5" value="Poor"> Poor</label>
                </div>
            </div>
            <div class="submit-btn">
                <button type="submit">Submit Feedback</button>
            </div>
        </form>
    </div>
    </c:if>

<c:if test="${message != null}">
    <div class="alert alert-danger" role="alert" style="background-color: #ffebee; border-color: #ffcdd2; color: #d32f2f;">
        <h1>${message}</h1>
    </div>
</c:if>
</body>
</html>
