<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University</title>
    <link rel="stylesheet" href="style.css">
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    background-color: #f1f5f9;
}

.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    width: 260px;
    background: linear-gradient(180deg, #1e3a8a 0%, #1e40af 100%);
    padding: 20px;
    transition: all 0.4s ease;
    box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
}

.sidebar h2 {
    color: white;
    font-size: 24px;
    font-weight: 600;
    text-align: center;
    padding: 15px 0;
    margin-bottom: 30px;
    position: relative;
}

.sidebar h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 3px;
    background-color: #60a5fa;
    border-radius: 10px;
}

/* Dropdown Container */
.dropdown {
    position: relative;
    margin-bottom: 15px;
}

/* Main Menu Items */
.dropdown > a {
    display: flex;
    align-items: center;
    padding: 12px 20px;
    color: #e2e8f0;
    text-decoration: none;
    font-size: 16px;
    font-weight: 500;
    border-radius: 8px;
    transition: all 0.3s ease;
    cursor: pointer;
    background: rgba(255, 255, 255, 0.05);
}

.dropdown > a:hover {
    background: rgba(255, 255, 255, 0.1);
    color: white;
    transform: translateX(5px);
}

/* Dropdown Menu */
.dropdown-menu {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease;
    margin-left: 20px;
    margin-top: 5px;
}

.dropdown:hover .dropdown-menu {
    max-height: 200px;
}

/* Dropdown Menu Items */
.dropdown-menu a {
    display: block;
    padding: 10px 20px;
    color: #cbd5e1;
    text-decoration: none;
    font-size: 14px;
    font-weight: 400;
    border-radius: 6px;
    transition: all 0.3s ease;
    margin: 5px 0;
}

.dropdown-menu a:hover {
    background: rgba(255, 255, 255, 0.1);
    color: white;
    transform: translateX(5px);
}

/* Add icons to main menu items */
.dropdown > a::before {
    content: '';
    display: inline-block;
    width: 20px;
    height: 20px;
    margin-right: 10px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    opacity: 0.8;
}

/* Custom icons for each menu */
.dropdown:nth-child(1) > a::before {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='white'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z' /%3E%3C/svg%3E");
}

.dropdown:nth-child(2) > a::before {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='white'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4' /%3E%3C/svg%3E");
}
.dropdown:nth-child(3) > a::before {
background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='white'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253' /%3E%3C/svg%3E");
}


/* Add subtle hover animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.dropdown:hover .dropdown-menu a {
    animation: fadeIn 0.3s ease forwards;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .sidebar {
        width: 100%;
        height: auto;
        position: relative;
        padding: 15px;
    }

    .sidebar h2 {
        font-size: 20px;
        margin-bottom: 20px;
    }

    .dropdown > a {
        padding: 10px 15px;
        font-size: 14px;
    }

    .dropdown-menu {
        margin-left: 15px;
    }

    .dropdown-menu a {
        padding: 8px 15px;
        font-size: 13px;
    }
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
        .toast.failure {
            background-color: red;
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
    <div class="sidebar">
        <div class="dropdown">
        <h2>University</h2>
            <a>Student</a>
            <div class="dropdown-menu">
                <a href="studentregistration">Add Student</a>
                <a href="ViewAllStudent">View Student</a>
            </div>
        </div>
        <div class="dropdown">
            <a>Faculty</a>
            <div class="dropdown-menu">
            	<a href="facultyregistration">Add Faculty</a>
                <a href="ViewAllFaculty">View Faculty</a>
            </div>
        </div>
        <div class="dropdown">
            <a>Course</a>
            <div class="dropdown-menu">
            	<a href="addcourse">Add Course</a>
                <a href="viewallcourses">View Courses</a>
            </div>
            </div>
            <div class="dropdown">
            <a>Course Mapping</a>
            <div class="dropdown-menu">
                <a href="facultycoursemapping">Map Course to Faculty</a>
                 <a href="viewfcoursemapping">View Faculty Course Mapping</a>
            </div>
        </div>
        <div class="dropdown">
        <a href="../Logout">Logout</a>
        </div>
    </div>
     <div id="toast" class="toast"></div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            if (message) {
                const toast = document.getElementById("toast");
                toast.textContent = "Login Successful";
                
               
                    toast.classList.add("show", "success");
                
                setTimeout(() => {
                    toast.classList.remove("show", "success");
                }, 3000);
            }
        });
    </script>
</body>
</html>