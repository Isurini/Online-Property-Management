<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Payment</title>
    <link rel="stylesheet" href="CSS/AddPayment.css">
</head>
<body>
<div class="main-content">
    <div class="payment-box">
        <h1>Update Payment</h1>
        <div class="wrapper">
            <form action="UpdatePaymentServlet" method="post">
                <input type="hidden" name="paymentID" value="${payment.paymentID}" />
                <div class="form-group">
                    <label for="paymentName">Name</label>
                    <input type="text" name="paymentName" value="${payment.paymentName}" placeholder="Name" required>
                </div>
                <div class="form-group">
                    <label for="paymentDate">Payment Date</label>
                    <input type="date" name="paymentDate" value="${payment.paymentDate}" required>
                </div>
                <div class="form-group">
                    <label for="paymentTime">Payment Time</label>
                    <input type="time" name="paymentTime" value="${payment.paymentTime}" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="number" name="amount" value="${payment.amount}" placeholder="Rs.0.00" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="paymentMethod">Payment Method</label>
                    <select name="paymentMethod" required>
                        <option value="" disabled>Select Method</option>
                        <option value="Cash" ${payment.paymentMethod == 'Cash' ? 'selected' : ''}>Cash</option>
                        <option value="Cheque" ${payment.paymentMethod == 'Cheque' ? 'selected' : ''}>Cheque</option>
                        <option value="Online payment" ${payment.paymentMethod == 'Online payment' ? 'selected' : ''}>Online Payment</option>
                        <option value="Bank payment" ${payment.paymentMethod == 'Bank payment' ? 'selected' : ''}>Bank Payment</option>
                    </select>
                </div>
                <button type="submit">Update Record</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
