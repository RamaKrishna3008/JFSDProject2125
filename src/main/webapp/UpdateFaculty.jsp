<%@ include file="AdminNavbar.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
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
    font-weight: 600;
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
    display: block;
}

input[type="text"],
input[type="email"],
input[type="number"],
input[type="password"],
input[type="file"],
textarea,
select {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
    transition: all 0.3s ease;
    background-color: #fff;
}

textarea {
    resize: vertical;
    min-height: 100px;
    font-family: inherit;
}

select {
    appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 0.75rem center;
    background-size: 1em;
    padding-right: 2.5rem;
}

input:focus,
textarea:focus,
select:focus {
    outline: none;
    border-color: #4a90e2;
    box-shadow: 0 0 5px rgba(74, 144, 226, 0.3);
}

/* Readonly inputs */
input[readonly] {
    background-color: #f5f5f5;
    cursor: not-allowed;
}

small {
    color: #666;
    font-size: 0.875rem;
    margin-top: 0.25rem;
    display: block;
}

input[type="file"] {
    padding: 0.5rem;
    background-color: #f8f9fa;
    border: 1px dashed #ddd;
}

input[type="file"]:hover {
    background-color: #f0f0f0;
}

.button-group {
    display: flex;
    gap: 1rem;
    margin-top: 1.5rem;
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
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

input[type="submit"] {
    background-color: #4a90e2;
    color: white;
}

input[type="submit"]:hover {
    background-color: #357abd;
    transform: translateY(-1px);
}

input[type="reset"] {
    background-color: #e0e0e0;
    color: #333;
}

input[type="reset"]:hover {
    background-color: #d0d0d0;
    transform: translateY(-1px);
}

input:invalid {
    border-color: #dc3545;
}
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
    
    h2 {
        font-size: 20px;
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
