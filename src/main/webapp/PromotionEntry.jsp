<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Promotion Entry Form</title>

    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/footer.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 40px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background-image: url('images/Pro.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin-bottom: 20px;
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
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        textarea {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        textarea {
            height: 80px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #2196F3;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2196F3;
        }

        footer {
            margin-top: auto;
            text-align: center;
            padding: 20px;
            background-color: #222;
            color: #fff;
            width: 100%;
            position: relative;
        }
    </style>

    <script>
        function validateForm() {
            const title = document.forms["promoForm"]["proTitle"].value.trim();
            const discount = document.forms["promoForm"]["discount"].value;
            const description = document.forms["promoForm"]["description"].value.trim();
            const startDate = document.forms["promoForm"]["startDate"].value;
            const endDate = document.forms["promoForm"]["endDate"].value;

            if (title.length < 3 || title.length > 100) {
                alert("Promotion title must be between 3 and 100 characters.");
                return false;
            }

            if (isNaN(discount) || discount <= 0 || discount > 100) {
                alert("Please enter a valid discount between 1 and 100.");
                return false;
            }

            if (description.length < 10 || description.length > 500) {
                alert("Description must be between 10 and 500 characters.");
                return false;
            }

            if (!startDate || !endDate || startDate > endDate) {
                alert("Start date must be before end date.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
<jsp:include page="Header.jsp" />

<div class="container">
    <form name="promoForm" action="InsertPromotionServlet" method="post" onsubmit="return validateForm();">
        <h2>Enter Promotion Details</h2>
        <table>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="proTitle" required minlength="3" maxlength="100"></td>
            </tr>
            <tr>
                <td>Discount (%):</td>
                <td><input type="number" name="discount" required step="0.01" min="0.01" max="100"></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><textarea name="description" required minlength="10" maxlength="500"></textarea></td>
            </tr>
            <tr>
                <td>Start Date:</td>
                <td><input type="date" name="startDate" required></td>
            </tr>
            <tr>
                <td>End Date:</td>
                <td><input type="date" name="endDate" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit Promotion">
                </td>
            </tr>
        </table>
    </form>
</div>

<jsp:include page="Footer.jsp" />
</body>
</html>
