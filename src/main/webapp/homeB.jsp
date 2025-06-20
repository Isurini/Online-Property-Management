<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="CSS/registerB.css">
</head>
<body>

	<c:set var="cus" value="${customer}"/>

    <div class="register-container">
        <h2>YOUR ACCOUNT DETAILS</h2>
            <input type="text" name="firstName" value="${cus.firstName }" placeholder="Enter your First name..." required>
            <input type="text" name="lastName" value="${cus.lastName }" placeholder="Enter your Last name..." required>
            <input type="email" name="email" value="${cus.email }" placeholder="Enter your email address..." required>
            <input type="text" name="phone" value="${cus.phone }" placeholder="Enter your phone number..." required>
            <input type="password" name="password" value="${cus.password }" placeholder="Enter your password..." required>
            <input type="password" name="confirmPassword" value="${cus.confirmPassword }" placeholder="Confirm your password..." required>
        
    </div>

</body>
</html>