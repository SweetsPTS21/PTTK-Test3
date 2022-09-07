<%@ page import="model.Book" %>
<%@ page import="dao.BookDAO" %>
<%@ page import="java.util.List" %><%-- Created by IntelliJ IDEA. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Ordering</title>
</head>
<body>

    <ul>
        <%if(session.getAttribute("username") != null) {%>
        <li>Xin chào, <%=session.getAttribute("customerName")%></li>
        <li><a href="/logout">Logout</a></li>
        <% } %>
    </ul>
    <center>
        <h1>Bookstore Online</h1>
        <h2>
            <a href="#">Order Detail</a>
        </h2>
    </center>
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of Order Book</h2></caption>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <c:forEach items="${listOrder}" var='book'>
                <tr>
                    <td>${book.id}</td>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.price}</td>
                    <td>${book.quantity}</td>
                </tr>
            </c:forEach>
        </table>
        <h2>Total cost: </h2>
        <div style="border: black; background-color: aqua">
            <h1><input type="submit" name="submit" value="Pay Now"></h1>
        </div>
    </div>
</body>
</html>
