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
		<form class="inquiry-form" method="post" action="updateBuyerDetails">
        
            <div class="form-header">
                <h2>YOU CAN UPDATE YOUR INFORMATION</h2>
                <img src="Images/nexgen_logo.png" alt="Nexgen Real Estate" class="logo2">
                
                
            </div>
            <label for="nic">NIC Number</label>
            <input type="text" id="nic" name="nic" placeholder="NIC Number" required value="${param.nic}" readonly>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Name" required value="${param.name}">

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="number" placeholder="Phone Number" required value="${param.number}">

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Email Address" required value="${param.email}">

            <label for="message">Message</label>
			<textarea id="message" name="message" rows="4" oninput="autoResize(this)" required>${param.message}</textarea>
            
            <button type="submit">Update details</button>
            
    
          
        </form>
    </div>
		
  <%@ include file="Footer.jsp" %> 

</body>
</html>