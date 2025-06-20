<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Promotion</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 500px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="date"], input[type="number"] {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        input[readonly] {
            background-color: #eee;
        }
    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String discount = request.getParameter("discount");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
%>

<form action="UpdatePromotionServlet" method="post">
    <h2>Update Promotion Details</h2>
    <table>
        <tr>
            <td><label for="id">ID:</label></td>
            <td><input type="text" id="id" name="id" value="<%= id %>" readonly></td>
        </tr>
        <tr>
            <td><label for="title">Title:</label></td>
            <td><input type="text" id="title" name="title" value="<%= title %>" required></td>
        </tr>
        <tr>
            <td><label for="description">Description:</label></td>
            <td><input type="text" id="description" name="description" value="<%= description %>" required></td>
        </tr>
        <tr>
            <td><label for="discount">Discount (%):</label></td>
            <td><input type="number" step="0.01" id="discount" name="discount" value="<%= discount %>" required></td>
        </tr>
        <tr>
            <td><label for="startDate">Start Date:</label></td>
            <td><input type="date" id="startDate" name="startDate" value="<%= startDate %>" required></td>
        </tr>
        <tr>
            <td><label for="endDate">End Date:</label></td>
            <td><input type="date" id="endDate" name="endDate" value="<%= endDate %>" required></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Update Promotion">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
