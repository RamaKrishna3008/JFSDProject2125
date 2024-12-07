<%@page import="com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials"%>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>
<head>
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
       body {
    font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f4f7fa 0%, #f1f3f5 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
    padding: 40px 20px;
    line-height: 1.6;
}

.form-container {
    background-color: white;
    padding: 50px;
    border-radius: 20px;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1), 0 10px 20px rgba(0, 0, 0, 0.05);
    width: 90%;
    max-width: 1200px; /* Increased max-width */
    min-height: 80vh; /* Minimum height to make container larger */
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    position: static;
    overflow: hidden;
    transition: all 0.4s ease;
    margin-left: 215px; /* Added this line */
}


.form-container::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle at center, rgba(0, 123, 255, 0.03) 0%, transparent 70%);
    transform: rotate(-45deg);
    z-index: 1;
    pointer-events: none;
}

h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 40px;
    font-weight: 700;
    letter-spacing: -0.5px;
    position: relative;
    font-size: 2rem;
}

.materials-container {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    gap: 20px;
    overflow-y: auto;
    padding-right: 20px;
    margin-bottom: 30px;
}

/* Scrollbar for materials container */
.materials-container::-webkit-scrollbar {
    width: 10px;
}

.materials-container::-webkit-scrollbar-track {
    background: #f1f3f5;
    border-radius: 10px;
}

.materials-container::-webkit-scrollbar-thumb {
    background: #007bff;
    border-radius: 10px;
}

.material-item {
    background-color: #f8f9fa;
    border: 1px solid #e9ecef;
    border-radius: 12px;
    padding: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: all 0.3s ease;
    position: relative;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
}

/* Rest of the previous CSS remains the same */

/* Additional responsive adjustments */
@media (max-width: 768px) {
    .form-container {
        width: 95%;
        padding: 30px 20px;
        min-height: 90vh;
    }

    .materials-container {
        gap: 15px;
    }

    .material-item {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }
}

/* Adaptive typography for larger container */
@media (min-width: 1200px) {
    .form-container {
        padding: 60px;
    }

    h2 {
        font-size: 2.5rem;
        margin-bottom: 50px;
    }

    .material-name {
        font-size: 1.1rem;
    }
}

.back-btn {
    align-self: center;
    margin-top: auto;
    margin-bottom: 20px;
}

.material-item:hover::before {
    opacity: 1;
}

.material-info {
    flex-grow: 1;
    margin-right: 15px;
}

.material-name {
    font-weight: 600;
    color: #2c3e50;
    margin-bottom: 5px;
    font-size: 0.95rem;
    transition: color 0.3s ease;
}

.material-item:hover .material-name {
    color: #007bff;
}

.view-pdf-btn, .download-btn, .back-btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s ease;
    display: inline-flex;
    align-items: center;
    gap: 10px;
    text-transform: uppercase;
    font-size: 0.8rem;
    letter-spacing: 0.5px;
}

.view-pdf-btn:hover, .download-btn:hover, .back-btn:hover {
    background-color: #0056b3;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
}

.back-btn {
    background-color: #2c3e50;
    margin-top: 20px;
}

.back-btn:hover {
    background-color: #34495e;
}

.no-materials {
    text-align: center;
    color: #6c757d;
    padding: 30px;
    background-color: #f1f3f5;
    border-radius: 10px;
    font-style: italic;
}

.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    justify-content: center;
    align-items: center;
    z-index: 1000;
}

.modal-content {
    background: white;
    padding: 30px;
    border-radius: 15px;
    width: 80%;
    max-width: 700px;
    position: relative;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
    animation: modalSlideIn 0.3s ease;
}

@keyframes modalSlideIn {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.close-btn {
    position: absolute;
    top: 15px;
    right: 20px;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
    color: #6c757d;
    transition: color 0.3s ease;
}

.close-btn:hover {
    color: #007bff;
}

.modal-footer {
    margin-top: 20px;
    text-align: right;
}

/* Previous CSS remains the same, adding these additional styles */

:root {
    --primary-color: #007bff;
    --secondary-color: #6c757d;
    --background-light: #f8f9fa;
    --text-dark: #2c3e50;
    --transition-speed: 0.3s;
}

body {
    background: linear-gradient(135deg, #f4f7fa 0%, #f1f3f5 100%);
    color: var(--text-dark);
    text-rendering: optimizeLegibility;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.form-container {
    border: 1px solid rgba(0, 0, 0, 0.05);
    background: white;
    position: relative;
    overflow: hidden;
}

.form-container::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle at center, rgba(0, 123, 255, 0.05) 0%, transparent 70%);
    transform: rotate(-45deg);
    z-index: 1;
    pointer-events: none;
}

h2 {
    position: relative;
    padding-bottom: 15px;
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    width: 60px;
    height: 3px;
    background-color: var(--primary-color);
    transform: translateX(-50%);
    border-radius: 2px;
}

.materials-container {
    gap: 20px;
}

.material-item {
    background-color: white;
    border: 1px solid rgba(0, 123, 255, 0.1);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.04);
    transition: all var(--transition-speed) ease;
}

.material-item:hover {
    border-color: rgba(0, 123, 255, 0.2);
}

.material-name {
    display: flex;
    align-items: center;
    gap: 10px;
}

.material-name::before {
    display: inline-block;
    margin-right: 10px;
    opacity: 0.7;
}

.view-pdf-btn, .download-btn, .back-btn {
    position: relative;
    overflow: hidden;
    outline: none;
}

.view-pdf-btn::after, 
.download-btn::after, 
.back-btn::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(120deg, transparent, rgba(255,255,255,0.3), transparent);
    transition: all var(--transition-speed) ease;
}

.view-pdf-btn:hover::after, 
.download-btn:hover::after, 
.back-btn:hover::after {
    left: 100%;
}

.no-materials {
    background: linear-gradient(to right, #f1f3f5, #f8f9fa);
    border: 1px dashed var(--secondary-color);
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 15px;
}

.no-materials::before {
    font-size: 2rem;
    opacity: 0.6;
}

.modal {
    backdrop-filter: blur(5px);
}

.modal-content {
    border: 1px solid rgba(0, 0, 0, 0.1);
    max-height: 80vh;
    overflow-y: auto;
}

#pdfViewer {
    border-radius: 8px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
}

.download-btn {
    background-color: #28a745;
}

.download-btn:hover {
    background-color: #218838;
}

@media (max-width: 768px) {
    .material-item {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }

    .view-pdf-btn {
        width: 100%;
        justify-content: center;
    }

    .modal-content {
        width: 95%;
        margin: 0 10px;
        padding: 20px 15px;
    }
}

::-webkit-scrollbar {
    width: 8px;
}

::-webkit-scrollbar-track {
    background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
    background: var(--primary-color);
    border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
    background: #0056b3;
}

.view-pdf-btn:focus,
.download-btn:focus,
.back-btn:focus {
    outline: 2px solid rgba(0, 123, 255, 0.5);
    outline-offset: 2px;
}

@media print {
    body {
        background: white;
    }

    .form-container {
        box-shadow: none;
        border: none;
    }

    .view-pdf-btn, .download-btn {
        display: none;
    }
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
                         <button class="view-pdf-btn" data-src="displaymaterialbyid?id=${material.id}" data-id="${material.id}">View PDF</button>
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

<div id="pdfModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" id="closeBtn">&times;</span><br>
        <embed id="pdfViewer" src="" type="application/pdf" width="100%" height="500px">
        
        <div style="text-align: right; margin-top: 10px;">
            <a id="downloadLink" href="" class="download-btn" download>Download</a>
        </div>
    </div>
</div>


<script>
    const viewButtons = document.querySelectorAll('.view-pdf-btn');
    const pdfModal = document.getElementById('pdfModal');
    const closeBtn = document.getElementById('closeBtn');
    const pdfViewer = document.getElementById('pdfViewer');
    const downloadLink = document.getElementById('downloadLink');

    viewButtons.forEach(button => {
        button.addEventListener('click', () => {
            const pdfSrc = button.getAttribute('data-src');  
            const materialId = button.getAttribute('data-id');  
            
            pdfViewer.src = pdfSrc;
            downloadLink.href = 'displaymaterialbyid/' + materialId;
            
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
