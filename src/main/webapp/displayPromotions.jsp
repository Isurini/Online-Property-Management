<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Promotion Details</title>

    <!-- Main Page Styles -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px 15px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        button {
            padding: 5px 10px;
            margin: 2px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.9;
        }

        .update-btn {
            background-color: #2196F3;
            color: white;
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
        }

        img {
            max-height: 80px;
            border-radius: 4px;
        }
    </style>

    <!-- Header Style sheet -->
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <!-- Footer Style sheet -->
    <link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<body>

<!-- Header Include -->
<jsp:include page="Header.jsp" />

<h2 style="text-align: center;">Promotion Details</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Discount (%)</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="allPromotions" items="${allPromotions}">
<tr>
    <td>${allPromotions.id}</td>
    <td>${allPromotions.title}</td>
    <td>${allPromotions.description}</td>
    <td>${allPromotions.discount}</td>
    <td>${allPromotions.startDate}</td>
    <td>${allPromotions.endDate}</td>
    <td>
        <a href="updatePromotion.jsp?id=${allPromotions.id}&title=${allPromotions.title}&description=${allPromotions.description}&discount=${allPromotions.discount}&startDate=${allPromotions.startDate}&endDate=${allPromotions.endDate}">
            <button class="update-btn">Update</button>
        </a>
        <form action="DeletePromotionServlet" method="post" style="display:inline;">
            <input type="hidden" name="id" value="${allPromotions.id}" />
            <button type="submit" class="delete-btn">Delete</button>
        </form>
    </td>
</tr>
</c:forEach>


</table>

<!-- Footer Include -->
<jsp:include page="Footer.jsp" />

</body>
</html>
