<%@ include file="FacultyHome.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
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

        /* Circular Drop Zone Styles */
        .drop-zone {
            width: 150px;
            height: 150px;
            margin: 20px auto;
            border-radius: 50%;
            border: 2px dashed #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .drop-zone:hover {
            border-color: #666;
            background-color: #f8f8f8;
        }

        .drop-zone.dragover {
            border-color: #2196F3;
            background-color: rgba(33, 150, 243, 0.1);
        }

        .drop-zone-text {
            text-align: center;
            color: #666;
            font-size: 14px;
            pointer-events: none;
        }

        .drop-zone-icon {
            font-size: 24px;
            color: #666;
            margin-bottom: 10px;
            pointer-events: none;
        }

        #profileImage {
            display: none;
        }

        .preview-image {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
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

        /* Styles for readonly inputs */
        input[readonly] {
            background-color: #f5f5f5;
            cursor: not-allowed;
        }
        .toast {
            visibility: hidden;
            min-width: 250px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            top: 20px;
            right: 20px;
            font-size: 17px;
        }
        .toast.show {
            visibility: visible;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }
        .toast.success {
            background-color: green;
        }

        @keyframes fadein {
            from {top: 0; opacity: 0;}
            to {top: 20px; opacity: 1;}
        }
        @keyframes fadeout {
            from {top: 20px; opacity: 1;}
            to {top: 0; opacity: 0;}
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Profile</h2>
        <form action="UpdateProfile" method="post"  enctype="multipart/form-data">
            <div class="drop-zone" id="dropZone" onclick="document.getElementById('profileImage').click()">
                <div class="drop-zone-content">
                    <div class="drop-zone-text">Drop image here or click to upload</div>
                </div>
                <img id="previewImage" class="preview-image" src="" alt="Preview">
                <input type="file" id="profileImage" name="profileImage" accept=".jpg" hidden required="required">
            </div>

            <label for="id">Id</label>
            <input type="number" id="id" name="id" value="<%=f.getId()%>" readonly="readonly">

            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="<%=f.getName()%>" required>

            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="<%=f.getUsername()%>" readonly="readonly">

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%=f.getEmail()%>" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" value="<%=f.getPassword()%>" required>

            <label for="contactno">Contact No</label>
            <input type="text" id="contactno" name="contactno" value="<%=f.getContactno()%>" required>

            <div class="button-group">
                <input type="submit" value="Update">
            </div>
        </form>
    </div>
	<div id="toast" class="toast"></div>
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
    <script>
        const dropZone = document.getElementById('dropZone');
        const fileInput = document.getElementById('profileImage');
        const previewImage = document.getElementById('previewImage');
        const dropZoneContent = document.querySelector('.drop-zone-content');

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

        dropZone.addEventListener('drop', handleDrop, false);

        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;
            handleFiles(files);
        }

        fileInput.addEventListener('change', function() {
            handleFiles(this.files);
        });

        function handleFiles(files) {
            if (files.length > 0) {
                const file = files[0];
                if (file.type.startsWith('image/')) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        previewImage.style.display = 'block';
                        previewImage.src = e.target.result;
                        dropZoneContent.style.display = 'none';
                    }
                    reader.readAsDataURL(file);
                }
            }
        }

    </script>
    
</body>
</html>