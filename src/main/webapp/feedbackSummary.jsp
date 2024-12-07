<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="AdminNavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Summary</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color: #f4f4f4;
        }

        .navbar {
            width: 245px;
            background-color: #2c3e50;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
        }

        .content-wrapper {
            margin-left: 245px;
            width: calc(100% - 215px);
            padding: 20px;
        }

        .content {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        #charts-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 20px;
            justify-content: center;
        }

        .chart-section {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 15px;
            max-width: 450px;
            margin: 0 auto;
            text-align: center;
        }

        .chart-section canvas {
            width: 100% !important;
            height: 250px !important;
        }

        .question {
            margin-top: 15px;
            font-size: 14px;
            color: #333;
        }

        .options {
            margin-top: 10px;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="content-wrapper">
        <div class="content">
            <h1>Feedback Summary</h1>
            <div id="charts-container">
                <c:forEach var="entry" items="${feedbackData}" varStatus="status">
                    <div class="chart-section">
                        <canvas id="${entry.key}-chart"></canvas>
                        <div class="question">
                            <c:choose>
                                <c:when test="${status.index == 3}">
                                    <p>How would you rate the faculty's knowledge of the subject?</p>
                                </c:when>
                                <c:when test="${status.index == 4}">
                                    <p>How well does the faculty explain concepts?</p>
                                </c:when>
                                <c:when test="${status.index == 0}">
                                    <p>How approachable is the faculty for doubts or clarification?</p>
                                </c:when>
                                <c:when test="${status.index == 2}">
                                    <p>How would you rate the faculty's punctuality and preparation?</p>
                                </c:when>
                                <c:when test="${status.index == 1}">
                                    <p>How effective is the faculty's use of teaching aids and technology?</p>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                    <script>
                    const ctx${entry.key} = document.getElementById('${entry.key}-chart').getContext('2d');
                    new Chart(ctx${entry.key}, {
                        type: 'bar',
                        data: {
                            labels: ['Excellent', 'Good', 'Average', 'Poor'],
                            datasets: [{
                                label: '${entry.key}',
                                data: [
                                    ${entry.value.Excellent != null ? entry.value.Excellent : 0},
                                    ${entry.value.Good != null ? entry.value.Good : 0},
                                    ${entry.value.Average != null ? entry.value.Average : 0},
                                    ${entry.value.Poor != null ? entry.value.Poor : 0}
                                ],
                                backgroundColor: ['#4caf50', '#2196f3', '#ffc107', '#f44336']
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { display: false }
                            },
                            scales: {
                                y: { beginAtZero: true }
                            }
                        }
                    });
                    </script>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>