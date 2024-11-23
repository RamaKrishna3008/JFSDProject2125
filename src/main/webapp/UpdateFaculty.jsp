<%@ include file="AdminHome.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Faculty</title>
	<style>
		.container {
    max-width: 600px;
    margin: 2rem auto;
    padding: 2rem;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #333;
    margin-bottom: 1.5rem;
    text-align: center;
    font-size: 24px;
}

form {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

label {
    font-weight: 500;
    color: #555;
    margin-bottom: 0.25rem;
}

input[type="text"],
input[type="email"],
input[type="number"],
input[type="password"],
input[type="file"] {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
    transition: border-color 0.3s ease;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="number"]:focus,
input[type="password"]:focus {
    outline: none;
    border-color: #4a90e2;
    box-shadow: 0 0 5px rgba(74, 144, 226, 0.3);
}

input[readonly] {
    background-color: #f5f5f5;
    cursor: not-allowed;
}

.button-group {
    display: flex;
    gap: 1rem;
    margin-top: 1rem;
}

input[type="submit"],
input[type="reset"] {
    flex: 1;
    padding: 0.75rem;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"] {
    background-color: #4a90e2;
    color: white;
}

input[type="submit"]:hover {
    background-color: #357abd;
}

input[type="reset"] {
    background-color: #e0e0e0;
    color: #333;
}

input[type="reset"]:hover {
    background-color: #d0d0d0;
}

/* Error state styling */
input:invalid {
    border-color: #dc3545;
}

/* File input specific styling */
input[type="file"] {
    padding: 0.5rem;
    background-color: #f8f9fa;
}

/* Responsive adjustments */
@media (max-width: 480px) {
    .container {
        margin: 1rem;
        padding: 1rem;
    }
    
    .button-group {
        flex-direction: column;
    }
    
    input[type="submit"],
    input[type="reset"] {
        width: 100%;
    }
}
	</style>
</head>
<body>
    <div class="container">
        <h2>Update Faculty</h2>
        <form action="UpdatingFaculty" method="post" enctype="multipart/form-data">
        <label for="id">Id</label>
            <input type="number" id="id" name="id" value="${faculty.getId() }" readonly="readonly">
        
            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="${faculty.getName() }" required>

            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="${faculty.getUsername() }" readonly="readonly">


            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="${faculty.getEmail() }"  required>
            
            <label for="password">Password</label>
            <input type="text" id="password" name="password" value="${faculty.getPassword() }" required>

            <label for="contactno">Contact No</label>
            <input type="text" id="contactno" name="contactno" value="${faculty.getContactno() }"  required>
            
            <label for="status">Status</label>
			<select id="status" name="status" required>
   			 <option value="ACTIVE" ${student.getActive() == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
    		<option value="NA" ${student.getActive() == 'NA' ? 'selected' : ''}>NA</option>
			</select>

			
			<label for="profileImage">Profile Image (JPG only)</label>
            <input type="file" id="profileImage" name="profileImage" accept=".jpg">
			
            <div class="button-group">
                <input type="submit" value="Update">
                <input type="reset" value="Clear">
            </div>
        </form>
    </div>
    
</body>
</html>
