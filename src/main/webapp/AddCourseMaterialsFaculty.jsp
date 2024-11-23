<%@ include file="FacultyHome.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Materials</title>
    <style>
        .container {
            width: 400px;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin: auto;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Updated Drop Zone Styles */
        .drop-zone {
            width: 100%;
            height: 150px;
            margin: 20px 0;
            border: 2px dashed #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }

        .drop-zone:hover {
            border-color: #666;
            background-color: #f1f1f1;
        }

        .drop-zone.dragover {
            border-color: #2196F3;
            background-color: rgba(33, 150, 243, 0.1);
        }

        .drop-zone-text {
            text-align: center;
            color: #666;
            font-size: 14px;
        }

        input[type="file"] {
            display: none;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 48%;
            padding: 10px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type="submit"] {
            background-color: #4CAF50;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        input[type="reset"] {
            background-color: #f44336;
        }

        input[type="reset"]:hover {
            background-color: #da190b;
        }

        input[readonly] {
            background-color: #f5f5f5;
            cursor: not-allowed;
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
