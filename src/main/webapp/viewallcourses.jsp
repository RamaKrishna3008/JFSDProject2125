<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>

<head>
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>

        #myTableContainer {
            width: 80%;
            margin: 30px 180px 30px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            margin-left: 280px;
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
            padding: 12px;
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

        @media screen and (max-width: 768px) {
            #myTableContainer {
                width: 100%;
                margin: 10px 0;
                overflow-x: auto;
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
<br><br>
    <h2 align="center">View All Courses</h2>

    <div id="myTableContainer">
        <table id="myTable" align="center">
            <thead>
                <tr>
                    <th>COURSE CODE</th>
                    <th>COURSE TITLE</th>
                    <th>L-T-P-S</th>
                    <th>CREDITS</th>
                    <th>For Batch</th>
                    <th>Academic Year</th>
                    <th>Offered in Sem</th>
                    <th>Students</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${coursedata}" var="course">
                    <tr>
                        <td><c:out value="${course.coursecode}" /></td>
                        <td><c:out value="${course.coursetitle}" /></td>
                        <td><c:out value="${course.ltps}" /></td>
                        <td><c:out value="${course.credits}" /></td>
                        <td><c:out value="${course.forBatch}" /></td>
                        <td><c:out value="${course.academicYear}" /></td>
                        <td><c:out value="${course.offeredsem}" /></td>
                        <td><a href="ViewRegisteredStudents/${course.academicYear}/${course.offeredsem}/${course.courseid}">View Registered Students</a></td>
                    </tr>
                    
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            if (message) {
                const toast = document.getElementById("toast");
                toast.textContent = message;
                
               
                    toast.classList.add("show", "success");
                
                setTimeout(() => {
                    toast.classList.remove("show", "success");
                }, 3000);
            }
        });
    </script>

</html>
