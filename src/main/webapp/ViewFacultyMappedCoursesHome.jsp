<%@ include file="FacultyHome.jsp"%>
<%if(f==null)
{
	response.sendRedirect("/SessionExpiry");
}
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University - My Courses</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
        :root {
            --primary-color: #007bff;
            --secondary-color: #6c757d;
            --background-color: #f0f4f8;
            --white: #ffffff;
            --text-color: #333333;
            --border-color: #ddd;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', 'Helvetica', sans-serif;
            background-color: var(--background-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            line-height: 1.6;
        }

        .form-container {
   		background-color: white;
    	padding: 50px;
    	border-radius: 20px;
    	box-shadow: 
        0 20px 50px rgba(0, 0, 0, 0.1), 
        0 10px 20px rgba(0, 0, 0, 0.05);
    	width: 45%;
    	max-width: 1200px;
    	box-sizing: border-box;
    	position: relative;
    	overflow: hidden;
    	transition: all 0.4s ease;
    	margin-left: 215px; 
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(
                circle at center, 
                rgba(0, 123, 255, 0.05) 0%, 
                transparent 70%
            );
            transform: rotate(-45deg);
            z-index: 1;
            pointer-events: none;
        }

        h2 {
            text-align: center;
            color: var(--text-color);
            margin-bottom: 30px;
            font-size: 1.8rem;
            position: relative;
            padding-bottom: 10px;
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
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--secondary-color);
        }

        select {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath d='M1 4l5 5 5-5z' fill='%23999999'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
            transition: all 0.3s ease;
        }

        select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
        }

        .button {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-top: 20px;
        }

        .button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .button:active {
            transform: translateY(1px);
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 25px;
                margin: 10px;
            }

            h2 {
                font-size: 1.5rem;
            }

            select, .button {
                font-size: 14px;
                padding: 10px;
            }
        }
        
        .toast {
    position: fixed;
    top: 1.25rem;
    right: 1.25rem;
    min-width: 18.75rem;
    padding: 1rem 1.25rem;
    border-radius: 0.625rem;
    box-shadow: 0 0.375rem 1.25rem rgba(0, 0, 0, 0.15);
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 1200;
}

.toast.show {
    opacity: 1;
}

.toast.success {
    background: linear-gradient(145deg, #4CAF50, #43A047);
    color: white;
}

@media screen and (max-width: 480px) {
    .toast {
        width: calc(100% - 2.5rem);
        left: 1.25rem;
        right: auto;
        transform: translateX(0);
    }
}
    </style>
</head>
<body>
    <div class="form-container">
        <h2>My Courses</h2>
        <form action="viewFacultyMappedCourses">
            <div class="form-group">
                <label for="academicyear">Academic Year</label>
                <select id="academicyear" name="academicyear" required>
                    <option value="">--Select--</option>
                    <option value="2025-2024">2025-2024</option>
                    <option value="2024-2023">2024-2023</option>
                </select>
            </div>

            <div class="form-group">
                <label for="sem">Semester</label>
                <select id="sem" name="sem" required>
                    <option value="">--Select--</option>
                    <option value="ODD">ODD Semester</option>
                    <option value="EVEN">EVEN Semester</option>
                    <option value="SUMMER">SUMMER Semester</option>
                </select>
            </div>

            <button type="submit" class="button">Submit</button>
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
</body>
</html>