<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="Header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="CSS/Profile.css">
</head>
<body>

<div class="container">
    <!-- LEFT PANEL -->
    <div class="profile">
        <div class="profile-header">
            <img src="Images/User.png" alt="profile" class="profile-img"/>
            <div class="profile-text-container">
                <h1 class="profile-name">Financial Manager</h1>
            </div>
        </div>
        
        <div class="menu">
            <a href="Profile.jsp" class="menu-link active">Account</a>
            <a href="ChangePassword.jsp" class="menu-link">Change Password</a>
             <a href="AddPayments.jsp" class="menu-link">Payments</a>
             <a href="ViewFAQsServlet" class="menu-link">FAQs</a>
        </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="account">
        <div class="account-header">
            <h1 class="account-title">Account Details</h1>
        </div>

        <div class="input-container">
            <label>ID</label>
            <input type="number" name="id" value="${user.id}" readonly/>
        </div>
        <div class="input-container">
            <label>First Name</label>
            <input type="text" name="firstname" value="${user.firstname}" readonly/>
        </div>
        <div class="input-container">
            <label>Last Name</label>
            <input type="text" name="lastname" value="${user.lastname}" readonly/>
        </div>
        <div class="input-container">
            <label>Contact Number</label>
            <input type="tel" name="contactnumber" value="${user.contactnumber}" readonly/>
        </div>
        <div class="input-container">
            <label>Email Address</label>
            <input type="email" name="email" value="${user.email}" readonly/>
        </div>

        <!-- BUTTONS -->
        <div class="btn-container">
            <form action="UpdateProfile.jsp" method="post" class="update">
                <input type="hidden" name="id" value="${user.id}" />
                <input type="hidden" name="firstname" value="${user.firstname}" />
                <input type="hidden" name="lastname" value="${user.lastname}" />
                <input type="hidden" name="contactnumber" value="${user.contactnumber}" />
                <input type="hidden" name="email" value="${user.email}" />
                <button class="btn-update" type="submit">Update Account</button>
            </form>

            <form action="DeleteServlet" method="post" class="delete">
                <input type="hidden" name="id" value="${user.id}" />
                <button class="btn-delete" type="submit">Delete Account</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
