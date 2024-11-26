<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
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
    max-width: 450px;
    border-radius: 15px;
    background-color: #fff;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
    padding: 30px;
    box-sizing: border-box;
    margin: 0 auto;
    transition: transform 0.3s ease;
}

.card:hover {
    transform: translateY(-5px);
}

.card h4 {
    font-size: 24px;
    font-weight: 600;
    text-align: center;
    margin-bottom: 25px;
    color: #2d3748;
    border-bottom: 3px solid #4299e1;
    padding-bottom: 10px;
}

.form-label {
    font-weight: 500;
    color: #4a5568;
    display: block;
    margin-bottom: 8px;
    font-size: 0.95rem;
}

.form-control {
    width: 100%;
    border: 2px solid #e2e8f0;
    border-radius: 8px;
    padding: 10px 12px;
    font-size: 15px;
    margin-bottom: 12px;
    box-sizing: border-box;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #4299e1;
    box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
    outline: none;
}

select {
    width: 100%;
    border: 2px solid #e2e8f0;
    border-radius: 8px;
    padding: 10px 12px;
    font-size: 15px;
    margin-bottom: 20px;
    background-color: white;
    cursor: pointer;
    appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 16px;
}

select:focus {
    border-color: #4299e1;
    box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
    outline: none;
}

.btn-primary {
    background-color: #4299e1;
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 12px 24px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 500;
    width: 100%;
    max-width: 130px;
    transition: all 0.3s ease;
}

.btn-primary:hover {
    background-color: #2b6cb0;
    transform: translateY(-2px);
}

.btn-outline-secondary {
    border: 2px solid #4299e1;
    color: #4299e1;
    background-color: transparent;
    border-radius: 8px;
    padding: 12px 24px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 500;
    width: 100%;
    max-width: 130px;
    transition: all 0.3s ease;
}

.btn-outline-secondary:hover {
    background-color: #ebf8ff;
    transform: translateY(-2px);
}

.button-container {
    display: flex;
    justify-content: space-between;
    margin-top: 30px;
    gap: 15px;
}

.mb-3 {
    margin-bottom: 20px;
}

@media (max-width: 480px) {
    .card {
        margin: 15px;
        padding: 20px;
        border-radius: 12px;
    }
    
    .button-container {
        flex-direction: column;
        gap: 12px;
        align-items: stretch;
    }
    
    .btn-primary,
    .btn-outline-secondary {
        max-width: 100%;
    }
    
    .card h4 {
        font-size: 20px;
    }
}

/* Add subtle animation for form validation */
.form-control:valid {
    border-color: #48bb78;
}

.form-control:invalid:not(:placeholder-shown) {
    border-color: #f56565;
}

/* Add subtle hover effect for form fields */
.form-control:hover {
    border-color: #cbd5e0;
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
            <label for="academicyear">Academic Year</label>
			<select id="academicyear" name="academicyear" required>
			<option value="">--Select--</option>
   			 <option value="2025-2024">2025-2024</option>
    		<option value="2024-2023">2024-2023</option>
			</select>
			
			<label for="sem">Offered Semester</label>
			<select id="sem" name="sem" required>
			<option value="">--Select--</option>
   			 <option value="ODD">ODD</option>
    		<option value="EVEN">EVEN</option>
    		<option value="SUMMER">SUMMER</option>
			</select>
            <div class="button-container">
                <button type="submit" class="btn-primary">Register</button>
                <button type="reset" class="btn-outline-secondary">Clear</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
