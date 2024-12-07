<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
        :root {
    --primary-color: #2c3e50;
    --secondary-color: #3498db;
    --background-color: #f4f4f9;
    --white: #ffffff;
    --gray: #95a5a6;
    --error-color: #e74c3c;
    --text-color: #333;
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    line-height: 1.6;
}

.container {
    background: rgba(255, 255, 255, 0.9);
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    transition: transform 0.3s ease;
}

.container:hover {
    transform: translateY(-5px);
}

h2 {
    text-align: center;
    color: var(--primary-color);
    margin-bottom: 30px;
    font-size: 2rem;
    font-weight: 600;
    position: relative;
}

h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 3px;
    background: var(--secondary-color);
}

.input-group {
    margin-bottom: 25px;
    position: relative;
}

.label-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

label {
    font-weight: 600;
    color: var(--text-color);
    font-size: 0.9rem;
}

.password-hint {
    color: var(--gray);
    font-size: 0.8rem;
}

input {
    width: 100%;
    padding: 12px 15px;
    font-size: 1rem;
    border: 2px solid rgba(149, 165, 166, 0.4);
    border-radius: 10px;
    transition: all 0.3s ease;
    background: rgba(255, 255, 255, 0.7);
}

input:focus {
    border-color: var(--secondary-color);
    outline: none;
    box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
}

.error-message {
    color: var(--error-color);
    font-size: 0.9rem;
    margin-top: 8px;
    display: none;
    animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

button {
    width: 100%;
    padding: 14px;
    background: linear-gradient(45deg, var(--primary-color) 0%, var(--secondary-color) 100%);
    color: var(--white);
    border: none;
    border-radius: 10px;
    font-size: 1rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

button:hover {
    background: linear-gradient(45deg, var(--secondary-color) 0%, var(--primary-color) 100%);
    transform: translateY(-2px);
    box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
}

button:disabled {
    background: var(--gray);
    cursor: not-allowed;
    transform: none;
    box-shadow: none;
}

@media screen and (max-width: 600px) {
    .container {
        width: 95%;
        padding: 25px;
    }

    h2 {
        font-size: 1.5rem;
    }
}
    </style>
</head>
<body>
<c:if test="${uname != null}">
    <div class="container">
        <h2>Reset Password</h2>
        <form id="resetPasswordForm" action="/reset-password" method="POST">
            <input type="hidden" value="${uname}" name="uname">
            
            <div class="input-group">
                <div class="label-container">
                    <label for="password">New Password</label>
                    <span class="password-hint">(8+ chars, 1 uppercase, 1 symbol)</span>
                </div>
                <input type="password" id="password" name="password" required 
                       minlength="8" 
                       pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
                       title="Must contain at least one number, one uppercase and lowercase letter, one symbol, and be at least 8 characters long">
            </div>
            
            <div class="input-group">
                <label for="confirm-pass">Confirm Password</label>
                <input type="password" id="confirm-pass" name="confirm-pass" required>
                <div id="passwordError" class="error-message">
                    Passwords do not match
                </div>
            </div>
            
            <button type="submit" id="submitBtn" disabled>Reset Password</button>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('confirm-pass');
            const passwordError = document.getElementById('passwordError');
            const submitBtn = document.getElementById('submitBtn');
            const resetPasswordForm = document.getElementById('resetPasswordForm');

            function validatePasswords() {
                if (passwordInput.value !== confirmPasswordInput.value) {
                    passwordError.style.display = 'block';
                    submitBtn.disabled = true;
                    return false;
                } else {
                    passwordError.style.display = 'none';
                    
                    const passwordStrengthRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                    if (passwordStrengthRegex.test(passwordInput.value)) {
                        submitBtn.disabled = false;
                        return true;
                    } else {
                        submitBtn.disabled = true;
                        return false;
                    }
                }
            }

            confirmPasswordInput.addEventListener('input', validatePasswords);
            passwordInput.addEventListener('input', validatePasswords);

            resetPasswordForm.addEventListener('submit', function(event) {
                if (!validatePasswords()) {
                    event.preventDefault();
                }
            });
        });
    </script>
</c:if>
</body>
</html>