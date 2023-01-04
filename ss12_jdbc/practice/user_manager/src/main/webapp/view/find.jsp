<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/4/2023
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../view/css-form.css">
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">
</head>
<body>
<h1 class="text-center text-primary">Find user by country</h1>
<h2>
    <a href="/users?action=create"><button class="btn btn-success">List all users</button></a>
</h2>

<div>
    <h2>List of Users</h2>
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}"><button class="btn btn-primary">Edit</button></a>
                </td>
                <td>
                    <a href="/users?action=delete&id=${user.id}"><button class="btn btn-primary">Delete</button></a>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>
<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
