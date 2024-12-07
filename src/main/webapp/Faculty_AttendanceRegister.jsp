<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ include file="FacultyHome.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>
<head>
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
        :root {
    /* Color Palette */
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --background-light: #f8f9fa;
    --text-dark: #2c3e50;
    --text-muted: #34495e;
    --border-color: #e0e4e8;
    --hover-color: #f1f3f5;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    transition: all 0.3s ease;
}

body {
    font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
    background-color: var(--background-light);
    line-height: 1.6;
    color: var(--text-dark);
}

.form-container {
    width: 100%;
    max-width: 900px;
    margin: 100px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 
        0 10px 25px rgba(0, 0, 0, 0.05),
        0 5px 10px rgba(0, 0, 0, 0.03);
    overflow: hidden;
    border: 1px solid var(--border-color);
    margin-left: 400px;
}
:root {
    /* Color Palette */
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --background-light: #f8f9fa;
    --text-dark: #2c3e50;
    --text-muted: #34495e;
    --border-color: #e0e4e8;
    --hover-color: #f1f3f5;
    --accent-color: #e74c3c;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
    background-color: var(--background-light);
    line-height: 1.6;
    color: var(--text-dark);
}

.form-container {
    width: 100%;
    max-width: 1000px;
    margin: 2rem auto;
    background-color: white;
    border-radius: 12px;
    box-shadow: 
        0 10px 25px rgba(0, 0, 0, 0.05),
        0 5px 10px rgba(0, 0, 0, 0.03);
    overflow: hidden;
    border: 1px solid var(--border-color);
    margin-right: 150px;
}

select[name="hours"] {
    width: 100%;
    margin-bottom: 1.5rem;
    padding: 0.5rem;
    border: 1px solid var(--border-color);
    border-radius: 6px;
    background-color: white;
    max-height: 200px;
    overflow-y: auto;
    font-size: 0.9rem;
}

select[name="hours"] option {
    padding: 0.5rem;
    transition: background-color 0.2s ease;
}

select[name="hours"] option:checked {
    background-color: var(--primary-color);
    color: white;
}

.hours-container {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    margin-bottom: 1.5rem;
}

.hours-label {
    font-weight: 600;
    color: var(--text-muted);
    margin-bottom: 0.5rem;
}


@media screen and (max-width: 768px) {
    .form-container {
        margin: 1rem;
        border-radius: 8px;
        width: calc(100% - 2rem);
    }

    select[name="hours"] {
        width: 100%;
        max-height: 150px;
    }
}

input[type="checkbox"]:focus,
select[name="hours"]:focus,
input[type="submit"]:focus {
    outline: 3px solid rgba(52, 152, 219, 0.5);
    outline-offset: 2px;
}

.tooltip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted var(--text-muted);
    cursor: help;
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 200px;
    background-color: var(--text-dark);
    color: white;
    text-align: center;
    border-radius: 6px;
    padding: 0.5rem;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    transform: translateX(-50%);
    opacity: 0;
    transition: opacity 0.3s;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
    opacity: 1;
}

@media screen and (max-width: 480px) {
    body {
        font-size: 14px;
    }

    .course-info {
        flex-direction: column;
        align-items: flex-start;
    }

    .section-badge {
        margin-top: 0.5rem;
        align-self: flex-start;
    }

    table {
        font-size: 0.8rem;
    }
}

h3 {
    background-color: var(--primary-color);
    color: white;
    padding: 1rem;
    text-align: center;
    margin: 0;
    font-weight: 600;
    letter-spacing: 0.5px;
}

.attendance-wrapper {
    padding: 1.5rem;
}

.course-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: var(--hover-color);
    border-radius: 8px;
    padding: 1rem;
    margin-bottom: 1.5rem;
    position: relative;
    border: 1px solid var(--border-color);
}

.course-info-row {
    display: flex;
    align-items: center;
    margin-bottom: 0.5rem;
}

.course-label {
    font-weight: 600;
    color: var(--text-muted);
    margin-right: 0.5rem;
    min-width: 120px;
}

.course-value {
    color: var(--primary-color);
    font-weight: 500;
}

.section-badge {
    background-color: var(--secondary-color);
    color: white;
    padding: 0.4rem 0.8rem;
    border-radius: 6px;
    font-size: 0.9rem;
    font-weight: 600;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-bottom: 1.5rem;
}

table th {
    background-color: var(--primary-color);
    color: white;
    padding: 0.75rem;
    text-align: left;
    font-weight: 600;
    border-bottom: 2px solid var(--border-color);
}

table td {
    padding: 0.75rem;
    border-bottom: 1px solid var(--border-color);
    transition: background-color 0.2s ease;
}

table tr:nth-child(even) {
    background-color: var(--hover-color);
}

table tr:hover {
    background-color: rgba(52, 152, 219, 0.05);
}

input[type="checkbox"] {
    width: 18px;
    height: 18px;
    accent-color: var(--primary-color);
    cursor: pointer;
}

/* Submit Button */
.button-container {
    display: flex;
    justify-content: center;
    padding: 1rem;
}

input[type="submit"] {
    background-color: var(--secondary-color);
    color: white;
    border: none;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: 
        background-color 0.3s ease,
        transform 0.1s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

input[type="submit"]:hover {
    background-color: #27ae60;
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}

input[type="submit"]:active {
    transform: translateY(1px);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Responsive Adjustments */
@media screen and (max-width: 768px) {
    .form-container {
        margin: 1rem;
        border-radius: 8px;
    }

    .course-info {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.75rem;
    }

    .section-badge {
        align-self: flex-end;
    }

    .course-info-row {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.25rem;
    }

    .course-label {
        margin-right: 0;
        margin-bottom: 0.25rem;
    }

    table {
        font-size: 0.9rem;
    }
}

/* Print Styles */
@media print {
    body {
        background-color: white;
    }

    .form-container {
        box-shadow: none;
        border: none;
    }
}
.alert-danger {
    background: linear-gradient(to center, #ff416c, #ff4b2b);
    color: white;
    border-radius: 4px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 5px 15px rgba(255, 75, 43, 0.4);
    
}
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.form-container {
    animation: fadeIn 0.5s ease-out;
}

input[type="number"] {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid var(--border-color);
    border-radius: 6px;
    appearance: none;
    -webkit-appearance: none;
    margin: 0;
}

input[type="number"]::-webkit-inner-spin-button, 
input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

input:invalid {
    border-color: var(--accent-color);
    animation: shake 0.5s linear;
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
    20%, 40%, 60%, 80% { transform: translateX(5px); }
}

html {
    scroll-behavior: smooth;
}


    </style>
</head>
<body>
<br>
<c:if test="${msg == null}">
<div class="form-container">
    <form action="Post" method="post">
        <h3>Attendance Register</h3>
        <div class="attendance-wrapper">
            <div class="course-info">
                <div>
                    <div class="course-info-row">
                        <span class="course-label">Course Title:</span>
                        <span class="course-value"><c:out value="${Course.coursetitle}"></c:out></span>
                    </div>
                    <div class="course-info-row">
                        <span class="course-label">Course Code:</span>
                        <span class="course-value"><c:out value="${Course.coursecode}"></c:out></span>
                        <input type="hidden"  name ="courseId" value="${Course.courseid}">
                    </div>
                </div>
                <div class="section-badge">
                    Section: <c:out value="${section}"></c:out>
                     <input type="hidden" name ="section" value="${section}">
                </div>
            </div>
            <select name="hours" multiple style="height: 150px; width: 100px;" required="required">
            <option value="">-Select-</option>
        			<% for (int j = 1; j <= 24; j++) { %>
           			 <option value="<%= j %>"><%= j %></option>
       				 <% } %>
    				</select>

            <table>
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Select</th>
                </tr>

                <c:forEach items="${slist}" var="slist" varStatus="status">
                <tr>
                    <td><c:out value="${slist.student.id}" /></td>
                    <td><c:out value="${slist.student.name}" /></td>
                    <td><input type="checkbox" name="${status.index}" value="true" ></td>
                </tr>
                </c:forEach>
            </table>
        </div>

        <div class="button-container">
            <input type="submit" value="Submit Attendance">
        </div>
    </form>
</div>
</c:if>

<c:if test="${msg != null}">
    <div class="alert alert-danger" style="background-color: #ffebee; border-color: #ffcdd2; color: #d32f2f;">
        <h1>${msg}</h1>
    </div>
</c:if>

</body>
</html>