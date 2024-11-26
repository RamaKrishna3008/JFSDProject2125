<!DOCTYPE html>
<html>
<head>
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f2f2f2;
        }

        .error-container {
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .error-image {
            max-width: 200px;
            margin-bottom: 20px;
        }

        .error-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <img src="/images/session-expired-image.png" alt="Session Expired" class="error-image">
        <h2 class="error-message">Your Session Has Expired</h2>
        <p>Your session has timed out. Please log in again to continue.</p>
        <a href="/Logout" class="error-button">Log In</a>
    </div>
</body>
</html>