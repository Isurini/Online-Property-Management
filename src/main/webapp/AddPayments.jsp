<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Details</title>
    <link rel="stylesheet" href="CSS/AddPayment.css">
</head>
<body>
<div class="main-content">
    <div class="payment-box">
        <h1>Payment Details</h1>
        <div class="wrapper">
            <form action="AddPaymentServlet" method="post">
                <div class="form-group">
                    <label for="paymentName">Name</label>
                    <input type="text" name="paymentName" placeholder="Name" required>
                </div>
                <div class="form-group">
                    <label for="paymentDate">Payment Date</label>
                    <input type="date" name="paymentDate" required>
                </div>
                <div class="form-group">
                    <label for="paymentTime">Payment Time</label>
                    <input type="time" name="paymentTime" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <div class="amount-input">
                    <input type="number" name="amount" placeholder="Rs.0.00" step="0.01" required>
                </div>       
                </div>
                <div class="form-group">
                    <label for="paymentMethod">Payment Method</label>
                    <select name="paymentMethod" required>
                        <option value="" disabled selected>Select Method</option>
                        <option value="Cash">Cash</option>
                        <option value="Cheque">Cheque</option>
                        <option value="Online">Online Payment</option>
                        <option value="Bank">Bank Payment</option>
                    </select>
                </div>
                <button type="submit">Add Payment</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
