<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Property Entry Form</title>
    
    <!-- Header Style sheet -->
    <link rel="stylesheet" type="text/css" href="CSS/header.css">
    <!-- Footer Style sheet -->
    <link rel="stylesheet" type="text/css" href="CSS/footer.css">

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
            background-image: url('Images/Pro.jpg');
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

        /* Optional: Footer Style (since external footer.css isn't linked) */
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
        window.onload = function () {
            const today = new Date().toISOString().split("T")[0];
            const dateInput = document.querySelector('input[name="postDate"]');
            dateInput.value = today;
            dateInput.min = today;
        };

        function validateForm() {
            const name = document.forms["propertyForm"]["pName"].value.trim();
            const location = document.forms["propertyForm"]["location"].value.trim();
            const price = document.forms["propertyForm"]["price"].value;
            const desc = document.forms["propertyForm"]["description"].value.trim();
            const owner = document.forms["propertyForm"]["ownerName"].value.trim();

            if (name.length < 3 || name.length > 50) {
                alert("Property name must be between 3 and 50 characters.");
                return false;
            }

            if (location.length < 3) {
                alert("Location must be at least 3 characters.");
                return false;
            }

            if (isNaN(price) || price <= 0) {
                alert("Please enter a valid positive price.");
                return false;
            }

            if (desc.length < 10 || desc.length > 500) {
                alert("Description must be between 10 and 500 characters.");
                return false;
            }

            if (owner.length < 3 || !/^[a-zA-Z\s]+$/.test(owner)) {
                alert("Owner name must be at least 3 characters and contain only letters and spaces.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
<!-- Header Include -->
<jsp:include page="Header.jsp" />
    <div class="container">
        <form name="propertyForm" action="InsertPropertyServlet" method="post" onsubmit="return validateForm();">
            <h2>Enter Property Details</h2>
            <table>
                <tr>
                    <td>Property Name:</td>
                    <td><input type="text" name="pName" required minlength="3" maxlength="50"></td>
                </tr>
                <tr>
                    <td>Location:</td>
                    <td><input type="text" name="location" required minlength="3"></td>
                </tr>
                <tr>
                    <td>Price (LKR):</td>
                    <td><input type="number" name="price" step="0.01" required min="0.01"></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><textarea name="description" required minlength="10" maxlength="500"></textarea></td>
                </tr>
                <tr>
                    <td>Post Date:</td>
                    <td><input type="date" name="postDate" required></td>
                </tr>
                <tr>
                    <td>Owner Name:</td>
                    <td><input type="text" name="ownerName" required pattern="[A-Za-z\s]{3,}" title="Only letters and spaces, minimum 3 characters"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Submit Property">
                    </td>
                </tr>
            </table>
        </form>
    </div>
<!-- Footer Include -->
<jsp:include page="Footer.jsp" />
</body>
</html>
