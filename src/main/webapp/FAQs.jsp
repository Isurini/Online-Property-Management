<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.UserModel" %>
<%@ include file="Header.jsp" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    int id = user.getId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQs</title>
<link rel="stylesheet" href="CSS/FAQs.css">
</head>
<body>
<h1>FAQs</h1>

<!-- You do NOT need to send user ID from frontend; use session in servlet instead -->
<form action="AddFAQsServlet" method="post">
    <section class="faq-section">
        <div class="faq-item">
            <p class="question">Q: How can I contact the financial support team regarding payment issues?</p>
            <p class="answer"><b>A: You can use our hotline or email our finance department. We typically respond within 24 hours.</b></p>
        </div>
        <div class="faq-item">
            <p class="question">Q: Is there a refund policy in case a deal is cancelled?</p>
            <p class="answer"><b>A: Yes, our platform follows a transparent refund policy. If a deal is canceled under valid conditions, partial or full refunds are processed depending on the transaction stage.</b></p>
        </div>
        <div class="faq-item">
            <p class="question">Q: Are all property payments made through the system legally documented?</p>
            <p class="answer"><b>A: Yes, all financial transactions are securely logged and legally documented. Receipts can be used for legal or tax purposes.</b></p>
        </div>
        <div class="faq-item">
            <p class="question">Q: How is my financial data protected on the platform?</p>
            <p class="answer"><b>A: We use SSL encryption, secure databases, and comply with data protection regulations to ensure your financial information is fully protected.</b></p>
        </div>
    </section>

    <section class="ask-question">
        <h3><b>Ask Another Question</b></h3>
        <textarea name="question" rows="5" placeholder="Type your question" required></textarea><br><br>
        <button type="submit">Submit</button>
    </section>
</form>
<%@ include file="Footer.jsp" %>
</body>
</html>
