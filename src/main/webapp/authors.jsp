<%@ page import="java.util.List" %>
<%@ page import="am.azaryan.authorbookee.model.Author" %>
<%@ page import="am.azaryan.authorbookee.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10.11.2024
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
</head>
<body>
<a href="/addAuthor">Add Author</a>
<br>
<h2>Authors: </h2>
<% List<Author> authors = (List<Author>) request.getAttribute("authors"); %>

<table style="border: 1px solid darkblue">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>phone</th>
        <th>dob</th>
        <th>gender</th>
    </tr>

    <% for (Author author : authors) { %>
    <tr>
        <td> <%= author.getId()%> </td>
        <td> <%= author.getName()%> </td>
        <td> <%= author.getSurname()%> </td>
        <td> <%= author.getPhone()%> </td>
        <td> <%= DateUtil.fromDateToString(author.getDateOfBirthday())%> </td>
        <td> <%= author.getGender().name()%> </td>
    </tr>
    <% } %>
</table>
</body>
</html>
