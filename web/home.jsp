<%@ page import="model.Book" %>
<%@ page import="dao.BookDAO" %>
<%@ page import="java.util.List" %><%-- Created by IntelliJ IDEA. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Books Store Application</title>
  </head>
  <body>
  <%
    BookDAO bookDAO = new BookDAO();
    List<Book> listBook = bookDAO.listAllBooks();
  %>
    <ul>
      <%if(session.getAttribute("username") != null) {%>
      <li>Xin chào, <%=session.getAttribute("customerName")%></li>
      <li><a href="/logout">Logout</a></li>
      <% } %>
    </ul>
    <center>
      <h1>Bookstore Online</h1>
      <h2>

        <a href="/list">List All Books</a>

      </h2>
    </center>

    <div align="center">
      <div class="search-box">
        <form action="search" method = "post">
          <input value="${key}" type="text" name="key" placeholder="Type to search">
          <input type="submit" value="Search">
        </form>
      </div>
      <form action="order" method="get">
        <table border="1" cellpadding="5">
          <caption><h2>List of Books</h2></caption>
          <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Stock</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
          </tr>
          <c:forEach items="${list}" var='book'>
            <tr>
              <td>${book.id}</td>
              <td>${book.title}</td>
              <td>${book.author}</td>
              <td>${book.stock}</td>
              <td>${book.price}</td>
              <td>
                <input type="text" id="quantity" name="quantity" placeholder="Nhap so luong" disabled><br>
                <%--<a href="/edit?id=<c:out value='${book.id}' />">Edit</a>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <%--<a href="/delete?id=<c:out value='${book.id}' />">Delete</a>--%>
              </td>
              <td><input type="checkbox" id="checkbox" name="book" value="${book.id}" onclick="myFunction()"></option>"><br></td>

            </tr>
          </c:forEach>
        </table>
        <div style="border: black; background-color: aqua">
          <h1><input type="submit" value="Order Now"></h1>
        </div>
      </form>
      <script>
          function myFunction() {
              if(document.getElementById("checkbox").checked) {
                  document.getElementById("quantity").disabled = false;
              }
              else {
                  document.getElementById("quantity").disabled = true;
              }
          }
      </script>
    </div>
  </body>
</html>