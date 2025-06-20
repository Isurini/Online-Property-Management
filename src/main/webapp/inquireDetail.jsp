<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="CSS/inquire.css">

</head>
<body>
<%@ include file="Header.jsp" %>


<c:set var="bu" value="${inquireDetails}"/>


<div class="container">
        <div class="inquiry-form"  method="post" action="addBuyer" >
            <div class="form-header">
                <h1>YOUR INFORMATION</h1>
                <img src="Images/nexgen_logo.png" alt="Nexgen Real Estate" class="logo2">
                
                
            </div>
            <label for="nic">NIC Number</label>
            <input type="text" id="nic" name="nic" value="${bu.nic}" placeholder="NIC Number" required readonly>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="${bu.name}" placeholder="Name" required readonly>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="number" value="${bu.number}" placeholder="Phone Number" required readonly>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" value="${bu.email}" placeholder="Email Address" required readonly>

            <label for="message">Message</label>
			<textarea id="message" name="message" rows="4" oninput="autoResize(this)" required readonly>${bu.message}</textarea>
         
         
         	<!-- Update Button -->
        	<form method="post" action="updateDetails.jsp">
            	<input type="hidden" name="nic" value="${bu.nic}">
            	<input type="hidden" name="name" value="${bu.name}">
            	<input type="hidden" name="number" value="${bu.number}">
            	<input type="hidden" name="email" value="${bu.email}">
            	<input type="hidden" name="message" value="${bu.message}">
            	
            	<button type="submit" class="btn-orange" value="update" >Update</button>
        	</form>
		
		
		
		
        <!-- Delete Button -->
        <form method="post" action="deleteInquireDetails" onsubmit="return confirm('Are you sure you want to delete this?');">
            <input type="hidden" name="nic" value="${bu.nic}">
            <button type="submit" class="btn-red">Delete</button>
        </form>
        
        
        

        <!-- Finish Button -->
        <form method="get" action="inquire.jsp">
            <button type="submit" class="btn-green">Finish</button>
        </form>
        </div>
    </div>

    <script>
        function autoResize(textarea) {
            textarea.style.height = 'auto';
            textarea.style.height = (textarea.scrollHeight) + 'px';
        }

        function handleSubmit(event) {
            event.preventDefault();
            alert("Details Submitted");
            if (confirm("View details?")) {
                window.location.href = "registerB.jsp";
            }
            return false;
        }
        
        
    </script>
    
    <c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>

  <%@ include file="Footer.jsp" %> 
</body>
</html>


