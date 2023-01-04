<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/3/2023
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">
</head>
<body>
<h1 class="text-center text-danger bg-warning">User Management</h1>
<div>
    <div class="row">
        <div class="col-md-3 text-center">
            <h2>
                <a href="/users?action=create"><button class="btn btn-success">Add New User</button></a>
            </h2>
        </div>
        <div class="col-md-6">
            <h1 class="text-center text-primary">List of Users</h1>
        </div>
        <div class="col-md-3">
                <form action="/users?action=find" method="post">
                    <input type="text" name="country" placeholder="Search by country" style="height: 40px; border-radius: 3px">
                    <button class="btn btn-warning" type="submit"><h4>Search</h4></button>
                </form>
        </div>
    </div>
    <table class="table table-striped text-center" >
        <tr>
            <th>ID</th>
            <th style="margin-left: 90%">Name <a href="/users?action=sort"><button class="btn btn-primary">Sort ascending</button></a></th>
            <th>Email</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}"><button class="btn btn-primary">Edit</button></a>
                </td>
                <td>
                    <a href="/users?action=delete&id=${user.id}"><button class="btn btn-danger">Delete</button></a>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>


<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
