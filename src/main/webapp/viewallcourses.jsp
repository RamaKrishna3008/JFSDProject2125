<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>

<head>
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
        /* Your Custom CSS */
        .navbar-toggle {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
            background: #1a237e;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 4px;
            padding: 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .navbar-toggle span {
            display: block;
            width: 4px;
            height: 4px;
            background-color: white;
            border-radius: 50%;
            transition: all 0.3s ease;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: -260px;
            height: 100vh;
            width: 260px;
            background: linear-gradient(180deg, #1a237e 0%, #1e40af 100%);
            padding: 20px;
            transition: all 0.3s ease;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
            z-index: 999;
        }

        .sidebar.active {
            left: 0;
        }

        .main-content {
            transition: margin-left 0.3s ease;
            padding: 20px;
        }

        .main-content.shifted {
            margin-left: 260px;
        }

        @media screen and (max-width: 768px) {
            .main-content.shifted {
                margin-left: 0;
            }

            .sidebar {
                width: 100%;
                left: -100%;
            }

            .sidebar.active {
                left: 0;
            }
        }

        h3 {
            color: #1a237e;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        h3 u {
            border-bottom: 3px solid #1a237e;
            text-decoration: none;
            padding-bottom: 5px;
        }

        #myTableContainer {
            width: 60%;
            margin: 30px 180px 30px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        #myTable {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border: none;
        }

        #myTable th {
            background: linear-gradient(145deg, #1a237e, #283593);
            color: white;
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 16px;
            text-align: left;
            border: none;
        }

        #myTable td {
            padding: 16px;
            vertical-align: middle;
            border-bottom: 1px solid #e9ecef;
            color: #2d3748;
            font-size: 0.95rem;
        }

        #myTable tr:hover {
            background-color: #f8f9ff;
            transition: background-color 0.3s ease;
        }

        #myTable td img {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            object-fit: cover;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #myInput {
            width: 95%;
            margin: 0 auto 20px auto;
            display: block;
            padding: 12px 20px;
            font-size: 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            background-color: white;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            font-family: inherit;
        }

        #myInput:focus {
            outline: none;
            border-color: #1a237e;
            box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.1);
        }

        #myInput::placeholder {
            color: #a0aec0;
        }

        .action-cell {
            display: flex;
            gap: 8px;
        }

        #myTable td a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.875rem;
            transition: all 0.2s ease;
            min-width: 70px;
        }

        #myTable td a:nth-child(1) {
            background-color: #4CAF50;
            color: white;
        }

        #myTable td a:nth-child(2) {
            background-color: #2196F3;
            color: white;
        }

        #myTable td a:nth-child(3) {
            background-color: #f44336;
            color: white;
        }

        #myTable td a:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            opacity: 0.9;
        }

        .toast {
            min-width: 300px;
            padding: 16px 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            font-family: inherit;
            font-weight: 500;
        }

        .toast.success {
            background: linear-gradient(145deg, #4CAF50, #43A047);
        }

        .toast.failure {
            background: linear-gradient(145deg, #f44336, #e53935);
        }

        @media screen and (max-width: 768px) {
            #myTableContainer {
                width: 100%;
                margin: 10px 0;
                overflow-x: auto;
            }

            #myInput {
                width: 100%;
                margin: 10px 0;
            }

            #myTable td,
            #myTable th {
                padding: 12px;
                font-size: 0.9rem;
            }

            #myTable td a {
                padding: 6px 12px;
                min-width: 60px;
            }
        }
    </style>
</head>

<body>
<%@ include file="AdminHome.jsp" %>
    <h2 align="center">View All Courses</h2>

    <div id="myTableContainer">
        <table id="myTable" align="center">
            <thead>
                <tr>
                    <th>COURSE ID</th>
                    <th>COURSE CODE</th>
                    <th>COURSE TITLE</th>
                    <th>LTPS</th>
                    <th>CREDITS</th>
                    <th>For Batch</th>
                    <th>Academic Year</th>
                    <th>Offered in Sem</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${coursedata}" var="course">
                    <tr>
                        <td>${course.courseid}</td>
                        <td><c:out value="${course.coursecode}" /></td>
                        <td><c:out value="${course.coursetitle}" /></td>
                        <td><c:out value="${course.ltps}" /></td>
                        <td><c:out value="${course.credits}" /></td>
                        <td><c:out value="${course.forBatch}" /></td>
                        <td><c:out value="${course.academicYear}" /></td>
                        <td><c:out value="${course.offeredsem}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>

</html>
