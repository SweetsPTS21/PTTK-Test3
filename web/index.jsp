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
    <h1>Customer Login Form</h1>
    <form action="/login" method="post">
        <table style="with: 80%">
            <tr>
                <td>UserName</td>
                <td><input type="text" name="username" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" /></td>
            </tr>
        </table>
        <input type="submit" value="Login" />
    </form>
    <a href="register.jsp">Register here</a>
    &nbsp;&nbsp;&nbsp;&nbsp;
</div>
</body>
</html>