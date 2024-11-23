<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
            color: #333;
        }
        h1 {
            color: #28a745;
        }
        .message {
            font-size: 18px;
            margin-bottom: 20px;
            text-align: center;
        }
        a {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Course Added Successfully!</h1>
    <div class="message">
        <c:out value="${message}"></c:out>
    </div>
    <a href="addcourse">Back</a>
   
</body>
</html>
