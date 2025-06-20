<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us – Property Management System</title>
    <link rel="stylesheet" href="styles.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="CSS/Header.css">
    <link rel="stylesheet" type="text/css" href="CSS/Footer.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 2.5em;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .about-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 40px;
        }
        .about-section img {
            width: 100%;
            max-width: 500px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .about-section div {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
        }
        .about-section h2 {
            font-size: 2em;
            color: #2c3e50;
        }
        .about-section p {
            font-size: 1.1em;
            line-height: 1.6;
        }
        .team {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .team-member {
            text-align: center;
            margin: 20px;
            width: 250px;
        }
        .team-member img {
            width: 100%;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .team-member h3 {
            font-size: 1.2em;
            color: #2c3e50;
        }
        .team-member p {
            font-size: 1em;
            color: #7f8c8d;
        }
        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

<!-- Header Include -->
<jsp:include page="Header.jsp" />

<div class="container">
    <section class="about-section">
        <div>
            <h2>Who We Are</h2>
            <p>At NewGen Property, we specialize in providing comprehensive property management solutions for residential and commercial properties. Our team is dedicated to ensuring that property owners and tenants experience seamless and efficient services.</p>
        </div>
        <div>
            <img src="Images/OFFICE BUILDING.jpeg" alt="Office Image">
        </div>
    </section>

    <section class="about-section">
        <div>
            <img src="Images/TEAM.jpeg" alt="Team Image">
        </div>
        <div>
            <h2>Our Mission</h2>
            <p>Our mission is to deliver exceptional property management services that enhance the value of properties and the satisfaction of our clients. We aim to be the leading provider of property management solutions, known for our integrity, professionalism, and commitment to excellence.</p>
        </div>
    </section>

    <section class="about-section">
        <div>
            <h2>Our Vision</h2>
            <p>We envision a future where property management is simplified through innovative technology and personalized service, creating lasting relationships with property owners and tenants alike.</p>
        </div>
        <div>
            <img src="Images/VISION.jpeg" alt="Vision Image">
        </div>
    </section>

    <section class="team">
        <div class="team-member">
            <img src="Images/CEO.jpeg" alt="Team Member">
            <h3>Kamal Jayasinghe</h3>
            <p>CEO & Founder</p>
        </div>
        <div class="team-member">
            <img src="Images/MANAGER.jpeg" alt="Team Member">
            <h3>Sunil Ranasinghe</h3>
            <p>Operations Manager</p>
        </div>
        <div class="team-member">
            <img src="Images/CLIENT.jpeg" alt="Team Member">
            <h3>Emily Johnson</h3>
            <p>Client Relations</p>
        </div>
    </section>
</div>
<!-- Footer Include -->
<jsp:include page="Footer.jsp" />
</body>
</html>
    