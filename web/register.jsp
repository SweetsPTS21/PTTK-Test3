<%--
  Created by IntelliJ IDEA.
  User: boixi
  Date: 8/23/2022
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Bookstore Online</title>
</head>
<body>
<div align="center">
    <h1>Customer Register Form</h1>
    <form action="/register" method="post">
        <table style="with: 80%">
            <tr>
                <td>First Name</td>
                <td><input type="text" name="firstName" /></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><input type="text" name="lastName" /></td>
            </tr>
            <tr>
                <td>UserName</td>
                <td><input type="text" name="username" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" /></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" /></td>
            </tr>
            <tr>
                <td>Contact No</td>
                <td><input type="text" name="contact" /></td>
            </tr>
        </table>
        <input type="submit" value="Submit" />
        <% String error = (String)session.getAttribute("error");
        if(error != null) { %>
        <div class="error">
            <%=error%>
        </div>
        <% } %>
    </form>
</div>
</body>
</html>