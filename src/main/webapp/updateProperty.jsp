<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Property</title>

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

        input[type="text"] {
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
    String pName = request.getParameter("pName");
    String location = request.getParameter("location");
    String price = request.getParameter("price");
    String description = request.getParameter("description");
    String postDate = request.getParameter("postDate");
    String ownerName = request.getParameter("ownerName");
%>

<form action="UpdatePropertyServlet" method="post">
    <h2>Update Property Details</h2>
    <table>
        <tr>
            <td><label for="id">ID:</label></td>
            <td><input type="text" id="id" name="id" value="<%= id %>" readonly></td>
        </tr>
        <tr>
            <td><label for="pName">Name:</label></td>
            <td><input type="text" id="pName" name="pName" value="<%= pName %>" required></td>
        </tr>
        <tr>
            <td><label for="location">Location:</label></td>
            <td><input type="text" id="location" name="location" value="<%= location %>" required></td>
        </tr>
        <tr>
            <td><label for="price">Price (LKR):</label></td>
            <td><input type="text" id="price" name="price" value="<%= price %>" required></td>
        </tr>
        <tr>
            <td><label for="description">Description:</label></td>
            <td><input type="text" id="description" name="description" value="<%= description %>" required></td>
        </tr>
        <tr>
            <td><label for="postDate">Post Date:</label></td>
            <td><input type="text" id="postDate" name="postDate" value="<%= postDate %>" required></td>
        </tr>
        <tr>
            <td><label for="ownerName">Owner Name:</label></td>
            <td><input type="text" id="ownerName" name="ownerName" value="<%= ownerName %>" required></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Update">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
