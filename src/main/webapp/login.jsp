<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
body, html {
    height: 100%;
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f4f4f4;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.fullwidth {
    display: flex;
    height: 100vh;
    overflow: hidden;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
}

.bg-left {
    flex: 1;
    background: linear-gradient(45deg, #1a1a1a 0%, #2c3e50 100%);
    color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 3rem;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.bg-left::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(45deg, rgba(26,26,26,0.8) 0%, rgba(44,62,80,0.8) 100%);
    z-index: 1;
}

.bg-left h1, .bg-left .university-description {
    position: relative;
    z-index: 2;
}

.bg-left h1 {
    font-size: 2.5rem;
    margin-bottom: 1.5rem;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

.university-description {
    max-width: 600px;
    line-height: 1.8;
    font-size: 1.1rem;
    color: rgba(255,255,255,0.9);
    margin-top: 0;
}

.bg-right {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(10px);
}

.login-form {
    width: 100%;
    max-width: 400px;
    padding: 2.5rem;
    background: #ffffff;
    border-radius: 20px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    border: 1px solid rgba(0,0,0,0.08);
    transition: all 0.3s ease;
}

.login-form:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.15);
}

.login-form h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 2rem;
    font-size: 1.8rem;
    font-weight: 600;
}

.login-form input {
    width: 100%;
    padding: 12px 15px;
    margin-bottom: 1.2rem;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    font-size: 1rem;
    transition: all 0.3s ease;
    box-sizing: border-box;
}

.login-form input:focus {
    border-color: #2c3e50;
    outline: none;
    box-shadow: 0 0 0 3px rgba(44,62,80,0.1);
}

.login-form input[type="submit"] {
    background: linear-gradient(45deg, #2c3e50 0%, #3498db 100%);
    color: white;
    border: none;
    padding: 14px;
    cursor: pointer;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-top: 1rem;
    transition: all 0.3s ease;
}

.login-form input[type="submit"]:hover {
    background: linear-gradient(45deg, #34495e 0%, #2980b9 100%);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.icon {
    margin-right: 10px;
    color: #2c3e50;
}


.captcha-container {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 1.2rem;
    width: 100%;
}

#captcha {
    flex: 0 0 auto;
    height: 40px;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    margin: 0; 
}

.login-form input[name="Captcha"] {
    flex: 1;
    margin-bottom: 0; 
}

.login-form form {
    display: flex;
    flex-direction: column;
    gap: 1.2rem;
}


.login-form input {
    margin-bottom: 0; 
}

/* Responsive adjustments */
@media screen and (max-width: 480px) {
    .captcha-container {
        flex-direction: column;
        gap: 0.8rem;
    }
    
    #captcha {
        width: 100%;
        height: auto;
    }
    
    .login-form input[name="Captcha"] {
        width: 100%;
    }
}

/* Toast Notification Styles */
.toast {
    visibility: hidden;
    min-width: 280px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 8px;
    padding: 16px;
    position: fixed;
    z-index: 1000;
    top: 20px;
    right: 20px;
    font-size: 0.95rem;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

.toast.show {
    visibility: visible;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

.toast.success {
    background-color: #2ecc71;
}

.toast.failure {
    background-color: #e74c3c;
}

/* Toast Animations */
@keyframes fadein {
    from {
        top: 0;
        opacity: 0;
    }
    to {
        top: 20px;
        opacity: 1;
    }
}

@keyframes fadeout {
    from {
        top: 20px;
        opacity: 1;
    }
    to {
        top: 0;
        opacity: 0;
    }
}

/* Responsive Styles */
@media screen and (max-width: 768px) {
    .fullwidth {
        flex-direction: column;
    }
    
    .bg-left, .bg-right {
        flex: none;
        width: 100%;
    }
    
    .bg-left {
        padding: 2rem;
    }
    
    .bg-left h1 {
        font-size: 2rem;
    }
    
    .university-description {
        font-size: 1rem;
        padding: 0 1rem;
    }
    
    .login-form {
        width: 90%;
        margin: 2rem auto;
        padding: 1.5rem;
    }
    
    .login-form h2 {
        font-size: 1.5rem;
    }
}

/* Accessibility Improvements */
@media (prefers-reduced-motion: reduce) {
    .login-form, .login-form input[type="submit"] {
        transition: none;
    }
    
    .toast.show {
        animation: none;
    }
    
}


        /* Modal Styles with Improved Design */
.modal-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    backdrop-filter: blur(10px);
    z-index: 9998;
    animation: fadeIn 0.3s ease-out;
}

.modal {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 90%;
    max-width: 400px;
    background: linear-gradient(135deg, rgba(255,255,255,0.95) 0%, rgba(245,245,245,0.95) 100%);
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.1), 0 5px 15px rgba(0,0,0,0.05);
    backdrop-filter: blur(15px);
    z-index: 9999;
    border: 1px solid rgba(255,255,255,0.2);
    animation: slideUp 0.4s ease-out;
}

.modal-header {
    font-size: 20px;
    font-weight: 700;
    text-align: center;
    color: #2c3e50;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid rgba(44,62,80,0.1);
}

.modal input {
    width: 100%;
    padding: 12px;
    margin: 15px 0;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    font-size: 16px;
    transition: all 0.3s ease;
    background-color: #f9f9f9;
}

.modal input:focus {
    border-color: #3498db;
    outline: none;
    box-shadow: 0 0 0 3px rgba(52,152,219,0.1);
}

.modal button {
    width: 100%;
    padding: 12px;
    background: linear-gradient(45deg, #2c3e50 0%, #3498db 100%);
    color: white;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 15px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
}

.modal button:hover {
    background: linear-gradient(45deg, #34495e 0%, #2980b9 100%);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.modal button:last-child {
    background: linear-gradient(45deg, #95a5a6 0%, #7f8c8d 100%);
    margin-top: 10px;
}

.modal button:last-child:hover {
    background: linear-gradient(45deg, #7f8c8d 0%, #636363 100%);
}

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

@keyframes slideUp {
    from { 
        opacity: 0; 
        transform: translate(-50%, -40%);
    }
    to { 
        opacity: 1; 
        transform: translate(-50%, -50%);
    }
}

/* Responsive Adjustments */
@media screen and (max-width: 480px) {
    .modal {
        width: 95%;
        padding: 20px;
    }
    
    .modal-header {
        font-size: 18px;
    }
    
    .modal input {
        padding: 10px;
        font-size: 14px;
    }
}
.forgot-password-btn {
    background: none;
    border: none;
    color: #2c3e50;
    text-decoration: underline;
    cursor: pointer;
    font-size: 0.9rem;
    padding: 0;
    margin: 10px 0;
    align-self: flex-start;
    transition: color 0.3s ease;
}

.forgot-password-btn:hover {
    color: #3498db;
}
    </style>
</head>
<body onload="loadcaptcha()">
    <div class="fullwidth">
        <div class="bg-left">    
            <h1>SHS University ERP</h1>
            <p class="university-description">
                Welcome to the University ERP System. Manage your courses, track your progress, and access all university resources efficiently. Our ERP system is designed to streamline your academic journey and provide seamless access to essential services.
            </p>
        </div>
        <div class="bg-right">    
            <div class="login-form">
                <h2><i class="fas fa-user icon"></i>Login</h2>
                <form action="checklogin" method="post">
    				<input type="text" id="username" name="username" placeholder="Username" required>
    				<input type="password" id="password" name="password" placeholder="Password" required>
    			<div class="captcha-container">
       			 <img id="captcha" alt="error" onclick="loadcaptcha()" src=""/>
      			  <input type="text" name="Captcha" placeholder="Enter Captcha"  required="required">
    				</div>
                    <button type="button" class="forgot-password-btn" onclick="openForgotPasswordModal()">Forgot Password?</button>
                    <input type="submit" value="Login">
                </form>
            </div>
        </div>
    </div>
    
    <div id="toast" class="toast"></div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message =  urlParams.get('message');
            if (message) {
                const toast = document.getElementById("toast");
                toast.textContent = message;
                if (message.includes("Password Reset Success")) {
                    toast.classList.add("show", "success");
                } else {
                    toast.classList.add("show", "failure"); 
                }

                setTimeout(() => {
                    toast.classList.remove("show", "success", "failure");
                }, 3000);
            }
        });
    </script>

    <!-- Modals -->
    <div id="forgotPasswordModal" class="modal">
        <div class="modal-header">Forgot Password</div>
        <input type="text" id="forgotUsername" placeholder="Enter your Username">
        <button onclick="sendOtp()">Send OTP</button>
        <button onclick="closeModal('forgotPasswordModal')">Close</button>
    </div>
    <div id="verifyOtpModal" class="modal">
        <div class="modal-header">Verify OTP</div>
        <input type="text" id="otpInput" placeholder="Enter the OTP">
        <button onclick="verifyOtp()">Verify OTP</button>
        <button onclick="closeModal('verifyOtpModal')">Close</button>
    </div>
    <div id="modalOverlay" class="modal-overlay"></div>

    <script>
    function sendOtp() {
        const username = document.getElementById('forgotUsername').value;
        if (!username) {
            alert('Please enter your username.');
            return;
        }

        fetch('/sendOtp?username=' + encodeURIComponent(username), {
            method: 'POST'
        })
        .then(response => {
            if (!response.ok) {
                if (response.status === 404) {
                    throw new Error('User not found. Please check your username.');
                } else {
                    throw new Error('An error occurred. Please try again.');
                }
            }
            return response.text();
        })
        .then(data => {
            alert('OTP sent successfully!');
            closeModal('forgotPasswordModal');
            document.getElementById('verifyOtpModal').style.display = 'block';
            document.getElementById('modalOverlay').style.display = 'block';
        })
        .catch(err => {
            alert(err.message);
        });
    }
    function verifyOtp() {
        const otp = document.getElementById('otpInput').value;
        const username = document.getElementById('forgotUsername').value; // Get the username from the modal input field

        if (!otp) {
            alert('Please enter the OTP.');
            return;
        }

        fetch('/verifyOtp?otp=' + encodeURIComponent(otp), {
            method: 'POST'
        })
        .then(response => response.text())
        .then(data => {
            if (data.includes('Verified')) {
                alert('OTP verified successfully!');
                closeModal('verifyOtpModal');
                window.location.href = '/resetpassword?username=' + encodeURIComponent(username);
            } else {
                alert('Invalid OTP.');
            }
        })
        .catch(err => alert('Error verifying OTP.'));
    }


        function openForgotPasswordModal() {
            document.getElementById('forgotPasswordModal').style.display = 'block';
            document.getElementById('modalOverlay').style.display = 'block';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
            document.getElementById('modalOverlay').style.display = 'none';
        }
    </script>
    
<script>

function loadcaptcha()
{
	var url = "/getcaptcha/6"
	callApi("GET",url,"",getCaptcha);
}

function getCaptcha(res)
{
	captcha.src="data:image/png;base64,"+res;
}

function callApi(method, url, data, responseHandler)
{
  var options;
  if(method == "GET" || method == "DELETE")
    options = {method: method, headers:{'Content-Type':'application/json'} };
  else
    options = {method: method, headers:{'Content-Type':'application/json'}, body: data };
  fetch(url, options)
    .then(response => {
      if(!response.ok)
        throw new Error(response.status + ": " + response.statusText);
      return response.text();
    })
    .then(data => responseHandler(data))
    .catch(error => alert(error));
}
</script>
    
</body>
</html>