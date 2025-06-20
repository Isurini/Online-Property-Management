<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ Records</title>
    <link rel="stylesheet" href="CSS/DisplayFAQs.css">
</head>
<body>
    <h1>FAQ Records</h1>
    
    <input type="text" id="searchInput" placeholder="Search...">
    
    <table border="1">
        <tr>
            <th>FAQ ID</th>
            <th>User ID</th>
            <th>Question</th>
            <th>Answer</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="faq" items="${faqsList}">
            <tr>
                <td>${faq.faqsid}</td>
                <td>${faq.id}</td>
                <td>${faq.question}</td>
                <td>${faq.answer}</td>
                <td>
                    <form action="UpdateFAQsServlet" method="post" style="display:inline;">
                        <input type="hidden" name="faqsid" value="${faq.faqsid}" />
                        <input type="text" name="question" value="${faq.question}" readonly />
                        <input type="text" name="answer" value="${faq.answer}" />
                        <input type="submit" value="Submit" />
                    </form>
                    <form action="DeleteFAQsServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete?')">
                        <input type="hidden" name="faqsid" value="${faq.faqsid}" />
                        <input type="submit" value="Delete" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    <script>
    function filterTable(){
        var input = document.getElementById("searchInput");
        var filter = input.value.toUpperCase();
        var table = document.querySelector("table");
        var tr = table.getElementsByTagName("tr");
        
        for(var i = 1; i < tr.length; i++){
            var tds = tr[i].getElementsByTagName("td");
            var matched = false;
            for(var j = 0; j < tds.length - 1; j++){
                if(tds[j]){
                    var textvalue = tds[j].textContent || tds[j].innerText;
                    if(textvalue.toUpperCase().indexOf(filter) > -1){
                        matched = true;
                        break;
                    }
                }
            }
            tr[i].style.display = matched ? "" : "none";
        }
    }
    
    document.getElementById("searchInput").addEventListener("input", filterTable);
    </script>
    <%@ include file="Footer.jsp" %>
</body>
</html>
