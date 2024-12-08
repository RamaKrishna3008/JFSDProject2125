<%@ page import="com.klef.jfsd.sdp.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    boolean edit = "true".equals(request.getParameter("edit"));
    Student st = (Student) session.getAttribute("student");
    if (st == null) {
        response.sendRedirect("/SessionExpiry");
        return ;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
   <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
    <style>
.info img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
    margin: 1rem auto;
    display: block;
    border: 4px solid white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Form Section Styles */
.info {
    background: white;
    border-radius: 12px;
    padding: 2rem;
    margin-bottom: 2rem;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.info h3 {
    color: #1e40af;
    margin-bottom: 1.5rem;
    font-size: 1.2rem;
}

.info label {
    display: block;
    margin-bottom: 0.5rem;
    color: #4b5563;
    font-weight: 500;
}

.info p {
    margin-bottom: 1rem;
    padding: 0.75rem;
    background: #f8f9fa;
    border-radius: 6px;
    color: #333;
}

.info input[type="text"],.info input[type="email"],
.info input[type="password"] {
    width: 100%;
    padding: 0.75rem;
    margin-bottom: 1rem;
    border: 1px solid #e0e0e0;
    border-radius: 6px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
}

.info input[type="text"]:focus,.info input[type="email"]:focus,
.info input[type="password"]:focus {
    outline: none;
    border-color: #1e40af;
    box-shadow: 0 0 0 2px rgba(30, 64, 175, 0.1);
}

.info input[readonly] {
    background-color: #f8f9fa;
    cursor: not-allowed;
}

/* Button Styles */
input[type="submit"],
button[type="submit"] {
    background: #1e40af;
    color: white;
    border: none;
    padding: 0.75rem 1.5rem;
    border-radius: 6px;
    cursor: pointer;
    font-size: 1rem;
    font-weight: 500;
    transition: all 0.3s ease;
    display: block;
    margin: 2rem auto;
}

input[type="submit"]:hover,
button[type="submit"]:hover {
    background: #1a237e;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Error Message Styles */
.error-message {
    color: #dc2626;
    background: #fef2f2;
    padding: 1rem;
    border-radius: 6px;
    margin-bottom: 1rem;
    border: 1px solid #fee2e2;
}

/* Responsive Design */
@media (max-width: 768px) {
    .fullwidth {
        flex-direction: column;
    }

    .bg-left {
        width: 100%;
        height: auto;
        position: relative;
        padding: 1rem;
    }

    .bg-right {
        margin-left: 0;
        padding: 1rem;
    }

    .info {
        padding: 1rem;
    }

    .info img {
        width: 120px;
        height: 120px;
    }
}

input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 2px dashed #e2e8f0;
    border-radius: 8px;
    cursor: pointer;
    font-size: 0.95rem;
}

input[type="file"]::-webkit-file-upload-button {
    background: #1a237e;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    margin-right: 10px;
    cursor: pointer;
    transition: all 0.3s ease;
}

input[type="file"]::-webkit-file-upload-button:hover {
    background: #283593;
}
</style>

</head>
<body>
    <div class="fullwidth">
        <jsp:include page="studentnavbar.jsp" />
        <div class="bg-right">
            <h2>Student Details</h2>

            <form action="updatedetails" method="post" enctype="multipart/form-data">
                <input type="hidden" name="edit" value="true">

                <!-- Personal Information Section -->
                <div class="info">
                    <img alt="profilepic" src="/Admin/displaystudentimage?id=<%= st.getId() %>">

                    <% if (edit) { %>
                        <label for="profileImage">Upload New Profile Image:</label>
                        <input type="file" id="profileImage" name="profileImage" accept="image/*" required>
                    <% } %>
                    <label for="id">ID:</label>
                    <p id="id"><%= st.getId() %></p>
                    <input type="hidden" name="id" value="<%= st.getId() %>">

                    <label for="name">Name:</label>
                    <p id="name"><%= st.getName() %></p>
                    <input type="hidden" name="name" value="<%= st.getName() %>">
                </div>

                <!-- Additional Information Section -->
                <div class="info">
                    <h3>Additional Information</h3>
                    <label for="parentEmail">Parent Email</label>
        			<input type="email" id="parentEmail" name="parentEmail" value="<%=st.getParentEmail() %>" readonly>
                    <label for="fatherName">Father's Name:</label>
                    <input type="text" id="fatherName" name="fatherName"
                        value="<%= st.getFatherName() %>"
                        placeholder="Enter Father's Name" 
                        <%= edit ? "" : "readonly" %>>

                    <label for="motherName">Mother's Name:</label>
                    <input type="text" id="motherName" name="motherName"
                        value="<%= st.getMotherName() %>"
                        placeholder="Enter Mother's Name" 
                        <%= edit ? "" : "readonly" %>>

                    <label for="contact">Contact:</label>
                    <input type="text" id="contact" name="contact"
                        value="<%= st.getContact() %>"
                        placeholder="Enter Contact Number" 
                        <%= edit ? "" : "readonly" %>>

                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address"
                        value="<%= st.getAddress() %>"
                        placeholder="Enter Address" 
                        <%= edit ? "" : "readonly" %>>
                </div>

                <!-- Security Information Section -->
                <div class="info">
                    <h3>Security Information</h3>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password"
                        value="<%= st.getPassword() %>"
                        placeholder="Enter Password" 
                        <%= edit ? "" : "readonly" %>>

                    <label for="confirm_password">Confirm Password:</label>
                    <input type="password" id="confirm_password" name="confirm_password"
                        placeholder="Confirm your Password" 
                        <%= edit ? "" : "readonly" %>>
                </div>

                <!-- Submit Button for Edit Mode -->
                <% if (edit) { %>
                    <input type="submit" value="Submit">
                <% } %>
            </form>

            <!-- Edit Button when not in Edit Mode -->
            <% if (!edit) { %>
                <form method="get" action="profile">
                    <input type="hidden" name="edit" value="true">
                    <button type="submit">Edit</button>
                </form>
            <% } %>
        </div>
    </div>
</body>
</html>
