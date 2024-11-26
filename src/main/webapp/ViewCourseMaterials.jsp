<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>
<head>
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding-top: 60px;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 1000px;
            box-sizing: border-box;
            overflow-x: auto;
            position: relative;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .materials-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .material-item {
            background-color: #f9f9f9;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s ease;
        }

        .material-item:hover {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .material-info {
            flex-grow: 1;
            margin-right: 15px;
        }

        .material-name {
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .view-pdf-btn, .download-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .view-pdf-btn:hover, .download-btn:hover {
            background-color: #0056b3;
        }

        .back-btn {
            display: inline-block;
            background-color: #000;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .back-btn:hover {
            background-color: #333;
        }

        .no-materials {
            text-align: center;
            color: #666;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 600px;
            position: relative;
        }

        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        .modal-footer {
            margin-top: 15px;
            text-align: right;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
</head>
<body>
<%@include file="studentnavbar.jsp"%>

<div class="form-container">
    <h2>Course Materials</h2>
    
    <div class="materials-container">
        <c:choose>
            <c:when test="${not empty materials}">
                <c:forEach items="${materials}" var="material">
                    <div class="material-item">
                        <div class="material-info">
                            <div class="material-name">
                                <c:out value="${material.filename}" />
                            </div>
                        </div>
                        <button class="view-pdf-btn" data-src="displaymaterialbyid?id=${material.id}">View PDF</button>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-materials">
                    No course materials available at this time.
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <a href="ViewMyCourses?academicyear=${ay}&sem=${sem}" class="back-btn">Back to My Courses</a>
    </div>
</div>

<!-- Modal -->
<div id="pdfModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" id="closeBtn">&times;</span>
        <embed id="pdfViewer" src="" type="application/pdf" width="100%" height="500px">
    </div>
</div>

<script>
    const viewButtons = document.querySelectorAll('.view-pdf-btn');
    const pdfModal = document.getElementById('pdfModal');
    const closeBtn = document.getElementById('closeBtn');
    const pdfViewer = document.getElementById('pdfViewer');

    viewButtons.forEach(button => {
        button.addEventListener('click', () => {
            const pdfSrc = button.getAttribute('data-src');
            pdfViewer.src = pdfSrc;
            pdfModal.style.display = 'flex';
        });
    });

    closeBtn.addEventListener('click', () => {
        pdfModal.style.display = 'none';
        pdfViewer.src = '';
    });

    window.addEventListener('click', (event) => {
        if (event.target === pdfModal) {
            pdfModal.style.display = 'none';
            pdfViewer.src = '';
        }
    });
</script>

</body>
</html>
