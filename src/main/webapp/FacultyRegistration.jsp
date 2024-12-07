<%@ include file="AdminNavbar.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
	<style>
		/* Base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

body {
    background-color: #f5f7fa;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.container {
    background: white;
    border-radius: 16px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    padding: 40px;
    width: 100%;
    max-width: 600px;
    margin: 20px auto;
}

h2 {
    color: #1a237e;
    text-align: center;
    margin-bottom: 30px;
    font-size: 28px;
    font-weight: 600;
    position: relative;
    padding-bottom: 10px;
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 3px;
    background: linear-gradient(90deg, #1a237e, #283593);
    border-radius: 3px;
}

form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

label {
    color: #2d3748;
    font-weight: 500;
    font-size: 0.95rem;
    margin-bottom: 4px;
    display: block;
}

input[type="text"],
input[type="email"],
input[type="password"] {
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
input[type="password"]:focus {
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

.button-group {
    display: flex;
    gap: 15px;
    margin-top: 10px;
}

input[type="submit"],
input[type="reset"] {
    flex: 1;
    padding: 12px 24px;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
}

input[type="submit"] {
    background: linear-gradient(145deg, #1a237e, #283593);
    color: white;
}

input[type="reset"] {
    background: white;
    color: #1a237e;
    border: 2px solid #1a237e;
}

input[type="submit"]:hover,
input[type="reset"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

/* Toast Notification Styling */
.toast {
    position: fixed;
    bottom: 30px;
    right: 30px;
    padding: 16px 24px;
    border-radius: 10px;
    color: white;
    font-weight: 500;
    font-size: 0.95rem;
    opacity: 0;
    transform: translateY(100%);
    transition: all 0.3s ease;
}

.toast.show {
    opacity: 1;
    transform: translateY(0);
}

.toast.success {
    background: linear-gradient(145deg, #4CAF50, #43A047);
    box-shadow: 0 4px 15px rgba(76, 175, 80, 0.3);
}

.toast.failure {
    background: linear-gradient(145deg, #f44336, #e53935);
    box-shadow: 0 4px 15px rgba(244, 67, 54, 0.3);
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .container {
        padding: 20px;
        margin: 10px;
    }

    h2 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        padding: 10px 14px;
        font-size: 0.95rem;
    }

    .button-group {
        flex-direction: column;
    }

    input[type="submit"],
    input[type="reset"] {
        width: 100%;
    }

    .toast {
        bottom: 20px;
        right: 20px;
        left: 20px;
        text-align: center;
    }
}
	</style>
</head>
<body>
    <div class="container">
        <h2>Faculty Registration</h2>
        <form action="RegisterFaculty" method="post" enctype="multipart/form-data">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>

            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password</label>
            <input type="text" id="password" name="password" value="klu123" readonly="readonly">

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="contactno">Contact No</label>
            <input type="text" id="contactno" name="contactno" required>
            
            <label for="profileImage">Profile Image (JPG only)</label>
            <input type="file" id="profileImage" name="profileImage" accept=".jpg">

            <div class="button-group">
                <input type="submit" value="Register">
                <input type="reset" value="Clear">
            </div>
        </form>
    </div>
    <div id="toast" class="toast"></div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            if (message) {
                const toast = document.getElementById("toast");
                toast.textContent = "Registered Successful";
                
                if (message.includes("success")) {
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
</body>
</html>
