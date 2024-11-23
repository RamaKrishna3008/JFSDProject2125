<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University - ERP </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body, html {
    height: 100%;
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f4f4f4;
}

.fullwidth {
    display: flex;
    height: 100vh;
    overflow: hidden;
}

.bg-left {
    flex: 1;
    background: #1a1a1a;
    color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 2rem;
    text-align: center;
}

.bg-right {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fff;
}

.login-form {
    width: 100%;
    max-width: 450px;
    padding: 3rem;
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    border: 1px solid #e0e0e0;
    transition: all 0.3s ease;
}

.login-form:hover {
    transform: translateY(-10px);
    box-shadow: 0 20px 40px rgba(0,0,0,0.15);
}

.login-form h2 {
    text-align: center;
    color: #333;
    margin-bottom: 2rem;
    font-size: 2rem;
}

.login-form input {
    width: 100%;
    padding: 12px;
    margin-bottom: 1rem;
    border: 1px solid #ddd;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.login-form input:focus {
    border-color: #000;
    outline: none;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.login-form input[type="submit"] {
    background: #000;
    color: white;
    border: none;
    cursor: pointer;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.login-form input[type="submit"]:hover {
    background: #333;
}

.error-message {
    color: #d9534f;
    text-align: center;
    margin-top: 1rem;
}

.icon {
    margin-right: 10px;
    color: #000;
}

.university-description {
    max-width: 600px;
    line-height: 1.6;
    font-size: 1.2rem;
    color: #f4f4f4;
}

@media screen and (max-width: 768px) {
    .fullwidth {
        flex-direction: column;
    }
    
    .bg-left, .bg-right {
        flex: none;
        width: 100%;
    }
    
    .login-form {
        width: 90%;
        margin: auto;
        padding: 2rem;
    }
}
.toast {
            visibility: hidden;
            min-width: 250px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            top: 20px;
            right: 20px;
            font-size: 17px;
        }
        .toast.show {
            visibility: visible;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }
        .toast.success {
            background-color: green;
        }
        .toast.failure {
            background-color: red;
        }
        @keyframes fadein {
            from {top: 0; opacity: 0;}
            to {top: 20px; opacity: 1;}
        }
        @keyframes fadeout {
            from {top: 20px; opacity: 1;}
            to {top: 0; opacity: 0;}
        }
    </style>
</head>
<body>
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
                
               
                    toast.classList.add("show", "failure");
                
                setTimeout(() => {
                    toast.classList.remove("show","failure");
                }, 3000);
            }
        });
    </script>
</body>
</html>
