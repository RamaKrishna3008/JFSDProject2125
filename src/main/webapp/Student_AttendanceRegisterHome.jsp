<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
<style>
:root {
    --primary-color: #007bff;
    --secondary-color: #6c757d;
    --background-color: #f0f4f8;
    --white: #ffffff;
    --text-color: #333333;
    --border-color: #ddd;
    --gradient-light: rgba(0, 123, 255, 0.05);
    --gradient-dark: rgba(0, 123, 255, 0.1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    font-size: 16px; 
}

body {
    font-family: 'Arial', 'Helvetica', sans-serif;
    background-color: var(--background-color);
    color: var(--text-color);
    line-height: 1.6;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 1rem;
}

.form-container {
    background-color: var(--white);
    width: 100%;
    max-width: 500px; /* Adjusted from fixed width to responsive max-width */
    padding: 2rem;
    border-radius: 1.25rem;
    box-shadow: 
        0 1.25rem 3.125rem rgba(0, 0, 0, 0.1), 
        0 0.625rem 1.25rem rgba(0, 0, 0, 0.05);
    position: relative;
    overflow: hidden;
    transition: all 0.4s ease;
    margin: 0 auto; /* Center the container */
}

.form-container::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(
        circle at center, 
        var(--gradient-light) 0%, 
        transparent 70%
    );
    transform: rotate(-45deg);
    z-index: 1;
    pointer-events: none;
}

h2 {
    text-align: center;
    margin-bottom: 1.875rem;
    font-size: 1.5rem;
    position: relative;
    padding-bottom: 0.625rem;
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    width: 3.75rem;
    height: 3px;
    background-color: var(--primary-color);
    transform: translateX(-50%);
}

.form-group {
    margin-bottom: 1.25rem;
}

label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 600;
    color: var(--secondary-color);
}

select {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid var(--border-color);
    border-radius: 0.375rem;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath d='M1 4l5 5 5-5z' fill='%23999999'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 0.75rem center;
    transition: all 0.3s ease;
}

select:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px var(--gradient-dark);
}

.button {
    display: block;
    width: 100%;
    padding: 0.75rem;
    background-color: var(--primary-color);
    color: var(--white);
    border: none;
    border-radius: 0.375rem;
    cursor: pointer;
    font-size: 1rem;
    font-weight: 600;
    transition: all 0.3s ease;
    margin-top: 1.25rem;
}

.button:hover {
    background-color: #0056b3;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.button:active {
    transform: translateY(1px);
}

@media screen and (max-width: 480px) {
    html {
        font-size: 14px; /* Slightly smaller base font for very small screens */
    }

    .form-container {
        padding: 1.5rem;
        margin: 0;
        border-radius: 0.75rem;
    }

    h2 {
        font-size: 1.25rem;
        margin-bottom: 1.25rem;
    }

    select, .button {
        font-size: 0.9rem;
        padding: 0.625rem;
    }

}

@media screen and (min-width: 481px) and (max-width: 768px) {
    .form-container {
        width: 90%;
        max-width: 450px;
    }
}
</style>
</head>
<body>
<%@ include file="studentnavbar.jsp"%>
<div class="form-container">
  <h2>Attendance Register</h2>

  
  <form action="AttendanceRegister">
            <div class="form-group">
                <label for="academicyear">Academic Year</label>
                <select id="academicyear" name="academicyear" required>
                    <option value="">--Select--</option>
                    <option value="2025-2024">2025-2024</option>
                    <option value="2024-2023">2024-2023</option>
                </select>
            </div>

            <div class="form-group">
                <label for="sem">Semester</label>
                <select id="sem" name="sem" required>
                    <option value="">--Select--</option>
                    <option value="ODD">ODD Semester</option>
                    <option value="EVEN">EVEN Semester</option>
                    <option value="SUMMER">SUMMER Semester</option>
                </select>
            </div>

            <button type="submit" class="button">Submit</button>
        </form>
</div>

</body>
</html>