<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration</title>
    <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    width: 100%;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.card {
    width: 100%;
    max-width: 400px;
    border-radius: 10px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 25px;
    box-sizing: border-box;
    margin: 0 auto;
}

.card h4 {
    font-weight: bold;
    text-align: center;
    margin-bottom: 20px;
    color: #333;
    border-bottom: 2px solid #007bff;
    padding-bottom: 8px;
}

.form-label {
    font-weight: bold;
    color: #333;
    display: block;
    margin-bottom: 5px;
}

.form-control {
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 8px;
    font-size: 14px;
    margin-bottom: 8px;
    box-sizing: border-box;
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
    outline: none;
}

.btn-primary {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 8px 15px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    max-width: 120px;
    transition: background-color 0.3s ease;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.btn-outline-secondary {
    border: 1px solid #007bff;
    color: #007bff;
    background-color: transparent;
    border-radius: 5px;
    padding: 8px 15px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    max-width: 120px;
    transition: background-color 0.3s ease;
}

.btn-outline-secondary:hover {
    background-color: #e6f2ff;
}

.button-container {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.mb-3 {
    margin-bottom: 15px;
}

@media (max-width: 480px) {
    .card {
        margin: 10px;
        padding: 15px;
    }
    
    .button-container {
        flex-direction: column;
        gap: 10px;
        align-items: center;
    }
    
    .btn-primary,
    .btn-outline-secondary {
        max-width: 100%;
    }
}
    </style>
</head>
<body>
<%@ include file="AdminHome.jsp" %>
<div class="container">
    <div class="card">
        <h4>Course Registration</h4>
        <form action="insertcourse" method="post">
            
            <div class="mb-3">
                <label for="courseCode" class="form-label">Course Code</label>
                <input type="text" class="form-control" id="courseCode" name="coursecode" placeholder="Enter course code" required>
            </div>
            <div class="mb-3">
                <label for="courseTitle" class="form-label">Course Title</label>
                <input type="text" class="form-control" id="courseTitle" name="coursetitle" placeholder="Enter course title" required>
            </div>
            <div class="mb-3">
                <label for="ForBatch" class="form-label">Academic Year</label>
                <input type="text" class="form-control" id="ForBatch" name="ForBatch" placeholder="Enter Academic Year" required>
            </div>
            <div class="mb-3">
                <label for="ltps" class="form-label">LTPS</label>
                <input type="text" class="form-control" id="ltps" name="ltps" placeholder="Enter LTPS (Lecture, Tutorial, Practical, Seminar)" required>
            </div>
            <div class="mb-3">
                <label for="credits" class="form-label">Credits</label>
                <input type="number" step="0.1" class="form-control" id="credits" name="credits" placeholder="Enter credits" required>
            </div>
            <div class="button-container">
                <button type="submit" class="btn-primary">Register</button>
                <button type="reset" class="btn-outline-secondary">Clear</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
