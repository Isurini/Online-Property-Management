<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <link rel="stylesheet" href="CSS/Profile.css">
    <script>
        function validateForm() {
            const newPassword = document.getElementsByName("newPassword")[0].value;
            const confirmNewPassword = document.getElementsByName("confirmNewPassword")[0].value;

            if (newPassword !== confirmNewPassword) {
                alert("New passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
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

    <form class="password" method="post" action="ChangePasswordServlet" onsubmit="return validateForm();">
        <div class="password-header">
            <h1 class="password-title">Password Settings</h1>
        </div>

        <!-- Hidden field with email from session -->
        <input type="hidden" name="email" value="<%= session.getAttribute("email") != null ? session.getAttribute("email") : "" %>" />

        <div class="input-container">
            <label>Old Password</label>
            <input type="password" name="oldPassword" placeholder="Old Password" required />
        </div>

        <div class="input-container">
            <label>New Password</label>
            <input type="password" name="newPassword" placeholder="New Password" required />
        </div>

        <div class="input-container">
            <label>Confirm New Password</label>
            <input type="password" name="confirmNewPassword" placeholder="Confirm New Password" required />
        </div>

        <div class="btn-container">
            <button class="btn-confirm" type="submit">Confirm</button>
            <button class="btn-cancel" type="reset">Cancel</button>
        </div>

        <div style="margin-top: 15px; color: red; text-align: center;">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </div>
    </form>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
