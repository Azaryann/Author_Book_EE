<%@ page import="am.azaryan.authorbookee.model.Author" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10.11.2024
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
</head>
<body>
<h1>Books:</h1>
<a href="/books">Books</a> | <a href="/index.jsp">Main</a> <br>
<form action="/addBook" method="post">
    Title: <input type="text" name="title"> <br>
    Price: <input type="text" name="price"> <br>
    Qty: <input type="text" name="qty"> <br>
    CreatedAt: <input type="date" name="createdAt"> <br>
    Author:  <br>
    <select name="author_id">
        <%
            List<Author> authors = (List<Author>) request.getAttribute("authors");
            for (Author author : authors) {
        %>
        <option value="<%= author.getId() %>"><%= author.getName() %></option>
        <%
            }
        %>
    </select>
    <input type="submit" value="ADD">
</form>
</body>
</html>
