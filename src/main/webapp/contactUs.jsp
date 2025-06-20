<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Property Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="CSS/Header.css">
    <link rel="stylesheet" type="text/css" href="CSS/Footer.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            color: #333;
        }
        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        section {
            padding: 40px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .contact-form, .company-info, .agents {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 40px;
        }
        .contact-form h2, .company-info h2, .agents h2 {
            color: #2c3e50;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }
        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        textarea {
            resize: vertical;
            min-height: 150px;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #2980b9;
        }
        .social-icons a {
            margin: 0 10px;
            color: #3498db;
            text-decoration: none;
            font-size: 24px;
        }
        .agents .agent {
            display: inline-block;
            width: 30%;
            text-align: center;
            margin-bottom: 20px;
        }
        .agents .agent img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
<!-- Header Include -->
<jsp:include page="Header.jsp" />
<section>
    <div class="contact-form">
        <center><h1>Contact Us</h1></center>
        <h2>Send Us a Message</h2>
        <form action="/submit-form" method="POST">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" required>

            <label for="message">Your Message</label>
            <textarea id="message" name="message" required></textarea>

            <button type="submit">Send Message</button>
        </form>
    </div>

    <div class="company-info">
        <h2>Our Office</h2>
        <p><strong>Address:</strong> 123 Property Lane, Colombo, Sri Lanka</p>
        <p><strong>Phone:</strong> +94 11 123 4567</p>
        <p><strong>Email:</strong> info@propertymanagement.lk</p>
        
    </div>

</section>
<!-- Footer Include -->
<jsp:include page="Footer.jsp" />
</body>
</html>
