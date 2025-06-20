<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="CSS/firstHomePage.css">
    <script>
    let image = [
        "Images/img1.png",
        "Images/img2.png",
        "Images/img3.png"
    ];
    let firstHomePage = 0;

    function changeBackground() {
        let hero = document.getElementById("hero-section");
        if (hero) {
            hero.style.backgroundImage = "url('" + image[firstHomePage] + "')";
            firstHomePage = (firstHomePage + 1) % image.length;
        }
    }

    window.onload = function () {
        
        changeBackground();
        
        setInterval(changeBackground, 3000);
    };
</script>
</head>
<body>
<%@ include file="Header.jsp" %> 


<div id="hero-section">
    <div class="content">
        <h1>Find Your Dream Property</h1>
        <p>Everyone dreams of owning a large property. At NEXGEN Lands, we aim to make this dream a reality.</p>
        <div class="buttons">
            <a id="landBtn" href="land.jsp" class="btn" onclick="selectButton('landBtn')">Lands</a>
            <a id="houseBtn" href="propertyFeed.jsp" class="btn" onclick="selectButton('houseBtn')">Houses</a>
            <a id="apartmentBtn" href="apartment.jsp" class="btn" onclick="selectButton('apartmentBtn')">Apartments</a>
        </div>
    </div>
</div>
  <%@ include file="Footer.jsp" %> 

</body>
</html>

