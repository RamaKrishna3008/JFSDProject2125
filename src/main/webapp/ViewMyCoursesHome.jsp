
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
<style>
  body {
    background-color: #f0f4f8;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
  }

  .form-container {
    background-color: #ffffff;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    width: 90%;
    max-width: 600px;
    box-sizing: border-box;
  }

  h2 {
    text-align: center;
    color: #333333;
    font-size: 1.5rem;
    margin-bottom: 20px;
  }

  .button {
    background-color: #007bff;
    border: none;
    color: white;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .button:hover {
    background-color: #0056b3;
  }

  input[type=text], input[type=password], input[type=number], input[type=email],
  select, input[type=date], input[type=datetime-local] {
    width: 100%;
    padding: 12px;
    margin: 8px 0;
    border: 1px solid #ddd;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 14px;
  }

  label {
    font-weight: bold;
    color: #555;
  }

  table {
    width: 100%;
    border-spacing: 0 10px;
  }

  td {
    padding: 8px;
    vertical-align: top;
  }

  .center {
    text-align: center;
  }

  h3 {
    color: red;
    text-align: center;
    font-size: 1rem;
    margin-bottom: 10px;
  }

  @media (max-width: 600px) {
    .form-container {
      width: 100%;
      padding: 15px;
    }

    h2 {
      font-size: 1.2rem;
    }

    input[type=text], input[type=password], input[type=number], input[type=email],
    select, input[type=date], input[type=datetime-local] {
      font-size: 13px;
      padding: 10px;
    }

    .button {
      font-size: 14px;
      padding: 8px 16px;
    }
  }
</style>
</head>
<body>
<%@ include file="studentnavbar.jsp"%>
<div class="form-container">
  <h2>My Courses</h2>

  
  <form action="ViewMyCourses">
    <table>
      <tr>
        <td><label for="academicyear">Academic Year</label>
			<select id="academicyear" name="academicyear" required>
			<option value="">--Select--</option>
   			 <option value="2025-2024">2025-2024</option>
    		<option value="2024-2023">2024-2023</option>
			</select></td></tr>
			
			<tr><td><label for="sem">Semester</label>
			<select id="sem" name="sem" required>
			<option value="">--Select--</option>
   			 <option value="ODD">ODD Semester</option>
    		<option value="EVEN">EVEN Semester</option>
    		<option value="SUMMER">SUMMER Semester</option>
			</select>
        </td>
      </tr>
      <tr>
        <td class="center">
          <input type="submit" value="Submit" class="button">
        </td>
      </tr>
    </table>
  </form>
</div>


</body>
</html>