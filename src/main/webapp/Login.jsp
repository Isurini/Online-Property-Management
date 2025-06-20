<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 <link rel ="stylesheet" href ="CSS/Login.css">
</head>
<body>
<div class="login-box">
        <h1>LOGIN</h1>
        <form action="LoginInsertServlet" method ="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
        <div class="options">
                <label>
                    <input type="checkbox" id="checkbox" required> Remember me
                </label>
                <a href="#" class="forgot-password"> Forgot Password?</a>
        </div>
            <button type="submit">Login</button>
        </form>
        <div class="member">
        <p>Don't have an account?<a href="Register.jsp">Sign Up</a></p>
        </div>
    </div>
</body>
</html>