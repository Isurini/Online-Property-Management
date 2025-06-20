<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="Header.jsp" %>
<%
    // Retrieve user data from the POST request
    String id = request.getParameter("id");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String contactnumber = request.getParameter("contactnumber");
    String email = request.getParameter("email");

    //Redirect to login page if no user data found in session or POST
    if (id == null || firstname == null || lastname == null || contactnumber == null || email == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<link rel="stylesheet" href="CSS/Profile.css">
</head>
<body>

<div class="container">
    <div class="profile">
        <div class="profile-header">
        <img src="Images/User.png" alt="profile" class="profile-img"/>
            <div class="profile-text-container">
                <h1 class="profile-name">Financial Manager</h1>
            </div>
        </div>
        <div class="menu">
            <a href="Profile.jsp" class="menu-link">Account</a>
            <a href="ChangePassword.jsp" class="menu-link">Change Password</a>
        </div>
    </div>

    <form class="account" action="UpdateProfileServlet" method="Post">
        <div class="account-header">
            <h1 class="account-title">Account Details</h1>
        </div>

        <div class="input-container">
            <label>ID</label>
            <input type="number" name="id" value="<%= id %>" readonly />
        </div>
        <div class="input-container">
            <label>First Name</label>
            <input type="text" name="firstname" value="<%= firstname %>" required />
        </div>
        <div class="input-container">
            <label>Last Name</label>
            <input type="text" name="lastname" value="<%= lastname %>" required />
        </div>
        <div class="input-container">
            <label>Contact Number</label>
            <input type="tel" name="contactnumber" value="<%= contactnumber %>" required />
        </div>
        <div class="input-container">
            <label>Email Address</label>
            <input type="email" name="email" value="<%= email %>" required />
        </div>

        <div class="btn-container">
        <button class="btn-save" type="submit">Save</button>
            <button class="btn-cancel" type="reset">Cancel</button>

        </div>
    </form>
</div>
 <%@ include file="Footer.jsp" %>
</body>
</html>
