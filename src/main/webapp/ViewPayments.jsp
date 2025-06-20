<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Records</title>
    <link rel="stylesheet" href="CSS/ViewPayment.css">
</head>
<body>
    <h1>Payment Records</h1>
    
    <input type="text" id="searchInput" placeholder="search...">
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Payment Date</th>
            <th>Payment Time</th>
            <th>Amount</th>
            <th>Payment Method</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="payment" items="${paymentList}">
            <tr>
                <td>${payment.paymentID}</td>
                <td>${payment.paymentName}</td>
                <td>${payment.paymentDate}</td>
                <td>${payment.paymentTime}</td>
                <td>${payment.amount}</td>
                <td>${payment.paymentMethod}</td>
                
                <td>
                    <form action="UpdatePaymentServlet" method="Get" style="display:inline;">
                        <input type="hidden" name="id" value="${payment.paymentID}" />
                        <input type="submit" value="Update" />
                    </form>
                    <form action="DeletePaymentServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${payment.paymentID}" />
                        <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete?')" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    <script>
    function filterTable(){
    	var input,filter,table,tr,td,i,textvalue;
    	input =document.getElementById("searchInput");
    	filter=input.value.toUpperCase();
    	table=document.querySelector("table");
    	tr=table.getElementsByTagName("tr");
    	
    	for(i=0;i<tr.length;i++){
    		td=tr[i].getElementsByTagName("td");
    		for(var j=0;j<td.length;j++){
    			if(td[j]){
    				textvalue = td[j].textContent || td[j].innerText;
    				if(textvalue.toUpperCase().indexOf(filter)>-1){
    					tr[i].style.display="";
    					break;
    				}else{
    				tr[i].style.display="none";
    				}
    			}
    		}
    	}
    }
    
    document.getElementById("searchInput").addEventListener("input",filterTable);
    </script>
    <%@ include file="Footer.jsp" %>
</body>
</html>
