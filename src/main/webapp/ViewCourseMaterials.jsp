<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>
<head>
<title>Course Materials</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    padding-top: 60px;
}

.form-container {
    background-color: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    width: 80%;
    max-width: 1000px;
    box-sizing: border-box;
    overflow-x: auto;
    position: relative;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 25px;
}

.materials-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.material-item {
    background-color: #f9f9f9;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: box-shadow 0.3s ease;
}

.material-item:hover {
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.material-info {
    flex-grow: 1;
    margin-right: 15px;
}

.material-name {
    font-weight: 600;
    color: #333;
    margin-bottom: 5px;
}

.material-details {
    color: #666;
    font-size: 14px;
}

.download-btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: 600;
    transition: background-color 0.3s ease;
    display: inline-flex;
    align-items: center;
    gap: 10px;
}

.download-btn:hover {
    background-color: #0056b3;
}

.download-btn svg {
    width: 20px;
    height: 20px;
}

.back-btn {
    display: inline-block;
    background-color: #000;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 20px;
    transition: background-color 0.3s ease;
    text-align: center;
}

.back-btn:hover {
    background-color: #333;
}

.no-materials {
    text-align: center;
    color: #666;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
}

@media screen and (max-width: 768px) {
    .form-container {
        width: 95%;
        padding: 15px;
    }

    .material-item {
        flex-direction: column;
        text-align: center;
    }

    .material-info {
        margin-right: 0;
        margin-bottom: 15px;
    }

    .download-btn {
        width: 100%;
        justify-content: center;
    }
}
</style>
<link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
</head>
<body>
<%@include file="studentnavbar.jsp"%>

<div class="form-container">
    <h2>Course Materials</h2>
    
    <div class="materials-container">
        <c:choose>
            <c:when test="${not empty materials}">
                <c:forEach items="${materials}" var="material">
                    <div class="material-item">
                        <div class="material-info">
                            <div class="material-name">
                                <c:out value="${material.filename}" />
                            </div>
                        </div>
                        <a href="displaymaterialbyid?id=${material.id}" class="download-btn" target="_blank">Open Material</a>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-materials">
                    No course materials available at this time.
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <a href="ViewMyCourses" class="back-btn">Back to My Courses</a>
    </div>
</div>

</body>
</html>