<%@ page import="com.klef.jfsd.sdp.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
Student st = (Student) session.getAttribute("student");
if (st == null) {
    response.sendRedirect("/SessionExpiry");
    return ;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
:root {
    --primary-color: #1a237e;
    --secondary-color: #283593;
    --background-color: #f8fafc;
    --text-color: #2d3748;
    --border-color: #e2e8f0;
    --hover-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

html, body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    line-height: 1.6;
    color: var(--text-color);
    background-color: var(--background-color);
    scroll-behavior: smooth;
}

form {
    width: 100%;
    max-width: 1200px;
    background-color: white;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
    padding: 2rem;
    margin: 1rem 0;
    margin-left: 170px; 
}

.info {
    margin-bottom: 1.5rem;
    padding: 1rem;
    background-color: #f9fafb;
    border-radius: 12px;
}

.info h3,.info h2 {
    color: var(--primary-color);
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid var(--border-color);
}

input[type="text"],
input[type="email"], 
input[type="password"], 
input[type="number"],
textarea {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid var(--border-color);
    border-radius: 10px;
    font-size: 1rem;
    transition: all 0.3s ease;
}

input[type="text"]:focus,
input[type="email"]:focus, 
input[type="password"]:focus, 
input[type="number"]:focus,
textarea:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.1);
}

input[type="file"] {
    width: 100%;
    padding: 1rem;
    border: 2px dashed var(--border-color);
    border-radius: 10px;
    cursor: pointer;
}

input[type="submit"] {
    width: 100%;
    padding: 0.75rem 1rem;
    background-color: var(--primary-color);
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

input[type="submit"]:hover {
    background-color: var(--secondary-color);
    transform: translateY(-3px);
    box-shadow: var(--hover-shadow);
}



    input[type="submit"], 
    input[type="text"], 
    input[type="email"], 
    textarea {
        font-size: 0.95rem;
        padding: 0.65rem 0.85rem;
    }
}
input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 2px dashed #e2e8f0;
    border-radius: 8px;
    cursor: pointer;
    font-size: 0.95rem;
}

input[type="file"]::-webkit-file-upload-button {
    background: #1a237e;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    margin-right: 10px;
    cursor: pointer;
    transition: all 0.3s ease;
}

input[type="file"]::-webkit-file-upload-button:hover {
    background: #283593;
}

#otpModal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: none;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    
    background-color: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
}

#otpModal .modal-content {
    background-color: white;
    padding: 40px;
    border-radius: 20px;
    width: 100%;
    max-width: 400px;
    text-align: center;
    
    box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
    
    animation: modalSlideIn 0.3s ease-out;
    position: relative;
    transform: scale(0.9);
    opacity: 0;
    transition: all 0.3s ease;
}

@keyframes modalSlideIn {
    from {
        opacity: 0;
        transform: scale(0.7);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

#otpModal.show .modal-content {
    transform: scale(1);
    opacity: 1;
}

#otpModal .close-btn {
    position: absolute;
    top: 15px;
    right: 15px;
    background: none;
    border: none;
    font-size: 24px;
    color: #666;
    cursor: pointer;
    transition: color 0.3s ease;
}

#otpModal .close-btn:hover {
    color: #1a237e;
}

@media screen and (max-width: 480px) {
    #otpModal .modal-content {
        width: 90%;
        margin: 0 5%;
        padding: 30px 20px;
    }
}

.email-container {
    margin-bottom: 20px;
}

.email-input-group {
    display: flex;
    align-items: center;
    gap: 10px;
}

.email-input-group input {
    flex-grow: 1;
}

.email-input-group .email-verify-btn {
    flex-shrink: 0;
    margin-top: 0;
    padding: 12px 15px;
}

@media screen and (max-width: 600px) {
    .email-input-group {
        flex-direction: column;
        align-items: stretch;
        gap: 10px;
    }
}

@media screen and (max-width: 600px) {
    #otpModal .modal-content {
        width: 90%;
        padding: 20px;
        margin: 0 5%;
    }

    #otpModal h2 {
        font-size: 20px;
    }

    #otpModal input[type="text"],
    #otpModal button {
        padding: 10px 15px;
        font-size: 0.95rem;
    }
}
#otpModal.show .modal-content {
    transform: scale(1);
    opacity: 1;
}

#otpModal .close-btn {
    position: absolute;
    top: 15px;
    right: 15px;
    background: none;
    border: none;
    font-size: 24px;
    color: #666;
    cursor: pointer;
    transition: color 0.3s ease;
}

#otpModal .close-btn:hover {
    color: #1a237e;
}

@media screen and (max-width: 480px) {
    #otpModal .modal-content {
        width: 90%;
        margin: 0 5%;
        padding: 30px 20px;
    }
}

.email-verify-btn {
    background-color: #f0f4f8;
    color: #1a237e;
    border: 2px solid #1a237e;
    padding: 10px 15px;
    border-radius: 8px;
    font-weight: 500;
    transition: all 0.3s ease;
    margin-top: 10px;
}

.email-verify-btn:hover {
    background-color: #1a237e;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

@media screen and (max-width: 600px) {
    #otpModal .modal-content {
        width: 90%;
        padding: 20px;
        margin: 0 5%;
    }

    #otpModal h2 {
        font-size: 20px;
    }

    #otpModal input[type="text"],
    #otpModal button {
        padding: 10px 15px;
        font-size: 0.95rem;
    }
}
input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"] {
    width: 100%;
    padding: 12px 16px;
    border: 2px solid #e2e8f0;
    border-radius: 8px;
    font-size: 1rem;
    color: #2d3748;
    transition: all 0.3s ease;
    background-color: white;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
input[type="number"]:focus {
    outline: none;
    border-color: #1a237e;
    box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.1);
}

input[type="text"]:hover,
input[type="email"]:hover,
input[type="password"]:hover {
    border-color: #cbd5e0;
}

input[readonly] {
    background-color: #f8fafc;
    cursor: not-allowed;
}
#otpModal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: none;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    
    /* Background blur effect */
    background-color: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
}

#otpModal .modal-content {
    background-color: white;
    padding: 40px;
    border-radius: 20px;
    width: 100%;
    max-width: 400px;
    text-align: center;
    
    box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
    
    animation: modalSlideIn 0.3s ease-out;
    position: relative;
    transform: scale(0.9);
    opacity: 0;
    transition: all 0.3s ease;
}
/* Toast Notification Styles */
.toast {
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    padding: 15px 30px;
    border-radius: 8px;
    color: white;
    font-weight: 500;
    z-index: 1100;
    opacity: 0;
    visibility: hidden;
    transition: all 0.3s ease-in-out;
    text-align: center;
    max-width: 90%;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.toast.show {
    opacity: 1;
    visibility: visible;
}

.toast.success {
    background-color: #1a237e; /* Dark blue from the existing color scheme */
}

.toast.failure {
    background-color: #d32f2f; /* Red for error messages */
}

textarea {
    width: 100%;
    padding: 12px 16px;
    border: 2px solid #e2e8f0;
    border-radius: 8px;
    font-size: 1rem;
    color: #2d3748;
    transition: all 0.3s ease;
    resize: vertical;
}

textarea:focus {
    outline: none;
    border-color: #1a237e;
    box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.1);
}

input[type="submit"] {
    width: 100%;
    padding: 12px 20px;
    background-color: #1a237e;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 20px;
}

input[type="submit"]:hover {
    background-color: #283593;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* Responsive Adjustments */
@media screen and (max-width: 600px) {
    form {
        padding: 10px;
        margin: 0 5px;
    }

    .info {
        padding: 15px;
    }
}
</style>
</head>
<body>

			<h2 align="center">Student Details</h2>

			<form action="updatedetails" method="post" enctype="multipart/form-data" onsubmit="return checkEmailVerification()">
				<div class="info">
					<label for="profileImage">Profile Image (JPG only) and Can be set Only Once</label>
					<input type="file" id="profileImage" name="profileImage" accept=".jpg" required>
					<input type="hidden" name="batch" value="<%=st.getBatchname() %>"/>
					<h3>Personal Information</h3>
					<label for="id">ID:</label>
					<input type="text" id="id" value="<%= st.getId() %>" name="id" readonly/>
					<label for="name">Name:</label>
					<input type="text"  id="name" value="<%= st.getName() %>" name="name" readonly>
				</div>
				
				<div class="info">
					<h3>Additional Information</h3>
					<label for="fatherName">Father's Name:</label> 
					<input type="text" id="fatherName" name="fatherName" value="<%= st.getFatherName() %>" required> 
					<label for="motherName">Mother's Name:</label> 
					<input type="text" id="motherName" name="motherName" value="<%= st.getMotherName() %>" required> 
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
				<div class="info">
					<h3>Verify Parent Email Only</h3>
				<div class="email-container">
    			<label for="parentEmail">Parent Email</label>
   				<div class="email-input-group">
        		<input type="email" id="parentEmail" name="parentEmail" required>
        		<button type="button" class="email-verify-btn" onclick="sendOtp()">Verify Email</button>
   				</div>
   				</div>
			</div>
				
				<input type="submit" value="Submit">
			</form>
	
	
<div id="otpModal">
    <div class="modal-content">
        <button class="close-btn" onclick="closeOtpModal()">&times;</button>
        <h2>Verify Email</h2>
        <div class="form-group">
            <label for="otpInput">Enter OTP</label>
            <input type="text" id="otpInput" class="form-control" placeholder="Enter 6-digit OTP">
        </div>
        <button class="email-verify-btn"  onclick="verifyOtp()">Verify OTP</button>
    </div>
</div>
	
<script>
let isEmailVerified = false;

function verifyOtp() {
    const email = document.getElementById("parentEmail").value;
    const otpInput = document.getElementById("otpInput").value;

    if (!otpInput || otpInput.length !== 6) {
        alert("Please enter a valid 6-digit OTP.");
        return;
    }

    const params = new URLSearchParams();
    params.append('email', email);
    params.append('otp', otpInput);

    fetch('/Student/verifyOtp', { 
        method: 'POST',
        headers: { 
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: params
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text();
    })
    .then(message => {
        if (message.includes("OTP Verified Successfully")) {
            isEmailVerified = true;

            closeOtpModal();

            const toast = document.getElementById("toast");
            toast.textContent = "Email Verified Successfully";
            toast.classList.add("show", "success");
            setTimeout(() => {
                toast.classList.remove("show", "success");
            }, 3000);
        } else {
            alert(message);
            isEmailVerified = false;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert("OTP Verification Failed. Please try again.");
        isEmailVerified = false;
    });
}


function checkEmailVerification() {
    if (!isEmailVerified) {
        alert("Please verify your email before submitting the form.");
        return false;
    }
    return true;
}

function sendOtp() {
    isEmailVerified = false;

    const email = document.getElementById("parentEmail").value;

    if (!email || !/\S+@\S+\.\S+/.test(email)) {
        alert("Please enter a valid email address.");
        return;
    }

    const params = new URLSearchParams();
    params.append('email', email);

    fetch('/Student/sendOtp', { 
        method: 'POST',
        headers: { 
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: params
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text();
    })
    .then(message => {
        console.log("Server Response:", message);
        alert(message);
        
        const otpModal = document.getElementById("otpModal");
        otpModal.style.display = "flex";
        setTimeout(() => {
            otpModal.classList.add("show");
        }, 10);
    })
    .catch(error => {
        console.error('Error:', error);
        alert("Failed to send OTP. Please try again.");
    });
}
function closeOtpModal() {
    const otpModal = document.getElementById("otpModal");
    otpModal.classList.remove("show");
    setTimeout(() => {
        otpModal.style.display = "none";
    }, 300); 
}

</script>
<div id="toast" class="toast"></div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            if (message) {
                const toast = document.getElementById("toast");
                toast.textContent = message;
                
                    toast.classList.add("show", "success");
                
                setTimeout(() => {
                    toast.classList.remove("show", "success", "failure");
                }, 3000);
            }
        });
    </script>
</body>
</html>
