<%@ include file="FacultyHome.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
       /* Global Reset and Modern Design */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', 'Arial', sans-serif;
    background-color: #f4f7f6;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    line-height: 1.6;
    color: #333;
}

.container {
    width: 100%;
    max-width: 500px;
    padding: 30px;
    background-color: white;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    border-radius: 12px;
    margin: 20px;
    transition: all 0.3s ease;
}

.container:hover {
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
    transform: translateY(-5px);
}

.container h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2c3e50;
    font-weight: 600;
    position: relative;
    padding-bottom: 10px;
}

.container h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    width: 60px;
    height: 3px;
    background-color: #3498db;
    transform: translateX(-50%);
}

/* Drop Zone Styling with Enhanced Interactivity */
.drop-zone {
    width: 100%;
    height: 200px;
    margin: 20px 0;
    border: 2px dashed #a0aec0;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;
    background-color: #f9fafb;
    position: relative;
    overflow: hidden;
}

.drop-zone::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: repeating-linear-gradient(
        -45deg,
        transparent,
        transparent 10px,
        rgba(33, 150, 243, 0.05) 10px,
        rgba(33, 150, 243, 0.05) 20px
    );
    opacity: 0;
    transition: opacity 0.3s ease;
}

.drop-zone:hover::before {
    opacity: 1;
}

.drop-zone:hover {
    border-color: #3498db;
    background-color: rgba(52, 152, 219, 0.05);
}

.drop-zone.dragover {
    border-color: #2ecc71;
    background-color: rgba(46, 204, 113, 0.1);
}

.drop-zone-text {
    text-align: center;
    color: #718096;
    font-size: 16px;
    transition: color 0.3s ease;
}

.drop-zone:hover .drop-zone-text {
    color: #2c3e50;
}

/* Hide File Input */
input[type="file"] {
    display: none;
}

/* Label Styling */
label {
    display: block;
    margin-bottom: 8px;
    color: #4a5568;
    font-weight: 500;
    transition: color 0.3s ease;
}

label:hover {
    color: #3498db;
}

/* Input Fields */
input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #e2e8f0;
    border-radius: 6px;
    transition: all 0.3s ease;
    font-size: 16px;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
input[type="number"]:focus {
    border-color: #3498db;
    outline: none;
    box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
}

input[readonly] {
    background-color: #f8f9fa;
    cursor: not-allowed;
    color: #6c757d;
}

/* Button Styling */
.button-group {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

input[type="submit"] {
    width: 100%;
    padding: 14px;
    color: white;
    background: linear-gradient(135deg, #3498db, #2980b9);
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.3s ease;
    font-weight: 600;
    letter-spacing: 0.5px;
    text-transform: uppercase;
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
    background: linear-gradient(135deg, #2980b9, #3498db);
}

/* Responsive Adjustments */
@media screen and (max-width: 600px) {
    .container {
        width: 95%;
        padding: 20px;
        margin: 10px;
    }

    .drop-zone {
        height: 150px;
    }
}

/* Accessibility and Print Styles */
@media print {
    body {
        background-color: white;
    }

    .container {
        box-shadow: none;
        border: 1px solid #ccc;
    }
}
    </style>
</head>
<body>
    <div class="container">
    <h2>Add Materials</h2>
    <form action="AddingCourseMaterials" method="post" enctype="multipart/form-data">
    
        <div class="drop-zone" id="dropZone" onclick="document.getElementById('file').click()">
            <div class="drop-zone-text" id="fileNameDisplay">
                Drop files here or click to upload (PDF, PPTX, Word)
            </div>
            <input type="file" id="file" name="file" accept=".pdf,.pptx,.doc,.docx" required>
        </div>

        <label for="ctitle">Course Title</label>
        <input type="text" id="ctitle" name="ctitle" value="${course.coursetitle}" readonly>
        <input type="hidden" name="cid" value="${course.courseid}">

        <label for="ccode">Course Code</label>
        <input type="text" id="ccode" name="ccode" value="${course.coursecode}" readonly>

        <label for="section">Section No</label>
        <input type="text" id="section" name="section" value="${section}" readonly>
        
        <label for="filename">File name</label>
        <input type="text" id="filename" name="filename"  required="required">
        

        <div class="button-group">
            <input type="submit" value="Add">
        </div>
    </form>
</div>
<script>
    const dropZone = document.getElementById('dropZone');
    const fileInput = document.getElementById('file');
    const fileNameDisplay = document.getElementById('fileNameDisplay');

    // Handle drag and drop events
    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
        dropZone.addEventListener(eventName, preventDefaults, false);
    });

    function preventDefaults(e) {
        e.preventDefault();
        e.stopPropagation();
    }

    ['dragenter', 'dragover'].forEach(eventName => {
        dropZone.addEventListener(eventName, highlight, false);
    });

    ['dragleave', 'drop'].forEach(eventName => {
        dropZone.addEventListener(eventName, unhighlight, false);
    });

    function highlight(e) {
        dropZone.classList.add('dragover');
    }

    function unhighlight(e) {
        dropZone.classList.remove('dragover');
    }

    dropZone.addEventListener('drop', function (e) {
        const dt = e.dataTransfer;
        const files = dt.files;
        handleFiles(files);
    });

    fileInput.addEventListener('change', function () {
        handleFiles(this.files);
    });

    function handleFiles(files) {
        if (files.length > 0) {
            const file = files[0];
            const allowedTypes = [
                'application/pdf',
                'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                'application/msword',
                'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
            ];
            if (allowedTypes.includes(file.type)) {
                fileNameDisplay.textContent = `Selected file: ${file.name}`;
            } else {
                alert('Invalid file type. Please upload a PDF, PPTX, or Word document.');
                fileInput.value = '';
                fileNameDisplay.textContent = 'Drop files here or click to upload (PDF, PPTX, Word)';
            }
        }
    }
</script>
</body>
</html>
