<%@ page import="am.azaryan.authorbookee.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="am.azaryan.authorbookee.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10.11.2024
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Books</title>
</head>
<body>
<a href="/addBook">Add Book</a>
<h2>Books: </h2>
<% List<Book> books = (List<Book>) request.getAttribute("books"); %>

<table style="border: 1px solid darkblue">
  <tr>
    <th>id</th>
    <th>title</th>
    <th>price</th>
    <th>qty</th>
    <th>createdAt</th>
    <th>author</th>
  </tr>

  <% for (Book book : books) { %>
  <tr>
    <td> <%= book.getId()%> </td>
    <td> <%= book.getTitle()%> </td>
    <td> <%= book.getPrice()%> </td>
    <td> <%= book.getQty()%> </td>
    <td> <%= DateUtil.fromDateToSqlDateTimeString(book.getCreatedAt())%> </td>
    <td> <%= book.getAuthor().getName()%> </td>
  </tr>
  <% } %>
</table>
</body>
</html>
