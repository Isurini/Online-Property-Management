<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="CSS/inquire.css">

</head>
<body>
<%@ include file="Header.jsp" %>

<div class="container">
        <form class="inquiry-form"  method="post" action="addBuyer" >
            <div class="form-header">
                <h1>INQUIRE</h1>
                <img src="Images/nexgen_logo.png" alt="Nexgen Real Estate" class="logo2">
                
                
            </div>
            <label for="nic">NIC Number</label>
            <input type="text" id="nic" name="nic" placeholder="NIC Number" required>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Name" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="number" placeholder="Phone Number" required pattern="[0-9]{10}" maxlength="10" title="Enter a 10-digit phone number">

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Email Address" required>

            <label for="message">Message</label>
            <textarea id="message" name="message" placeholder="Message" rows="4" oninput="autoResize(this)" required></textarea>

            <button type="submit">Send</button>
          
        </form>
        
        
    </div>
		<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector(".inquiry-form");
        form.addEventListener("submit", function (e) {
            alert("Details Submitted");
        });
    });
</script>

  <%@ include file="Footer.jsp" %> 

</body>
</html>