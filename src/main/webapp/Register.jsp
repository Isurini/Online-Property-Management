<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
 <link rel ="stylesheet" href ="CSS/Register.css">
 <script>
    function validateForm() {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmpassword").value;

        if (password !== confirmPassword) {
            alert("Passwords do not match!");
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }
</script>
<script>
    let Images = [
        "Images/image4.jpg",
        "Images/image2.jpg",
        "Images/image3.webp"
    ];
    let firstHomePage = 0;

    function changeBackground() {
    	let hero = document.body;
        if (hero) {
            hero.style.backgroundImage = "url('" + Images[firstHomePage] + "')";
            firstHomePage = (firstHomePage + 1) % Images.length;
        }
    }

    window.onload = function () {
        
        changeBackground();
        
        setInterval(changeBackground, 3000);
    };
</script>
</head>
<body>
   <div class ="signup-box">
                <h1>SIGN UP</h1>
       
                <div class="wrapper">
                    <form action="UserInsertServlet" method ="post" onsubmit="return validateForm();">
                    <input type="text" name = "firstname" placeholder="First Name" required>
                    <input type="text" name = "lastname" placeholder="Last Name" required>
                   <input type="tel" name="contactnumber" placeholder="Contact Number" pattern="[0-9]{10}" maxlength="10" title="Enter a 10-digit phone number" required>
                    <input type="email" name = "email" placeholder="Email Address" required>
                    <input type="password" id="password" name = "password" placeholder="Password" required>
                    <input type="password"  id="confirmpassword" name = "confirmpassword" placeholder="Confirm Password" required>
                    <div class ="terms">
                        <input type ="checkbox" id="checkbox" required>
                        <label for="checkbox">Accept <a href="#">Terms and Conditions</a></label>
                    </div>
                    <button type="submit">Sign Up</button>
                </form>
                <div class="member">
                <p>Already have an account? <a href="Login.jsp">Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>
