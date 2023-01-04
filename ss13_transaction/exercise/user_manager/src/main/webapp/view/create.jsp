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
    <title>Title</title>
    <link rel="stylesheet" href="../view/css-form.css">
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">

</head>
<body>
<h1 class="text-center text-primary">User Management</h1>
<h2>
    <a href="users?action=users"><button class="btn btn-success">List All Users</button></a>
</h2>
<div class="form-table">
    <form method="post" action="users?action=create">
        <div class="row">
            <p class="col-md-4">Name: </p>
            <input class="col-md-8" type="text" name="name">
        </div>

        <div class="row">
            <p class="col-md-4">Email: </p>
            <input class="col-md-8" type="text" name="email">
        </div>
        <div class="row">
            <p class="col-md-4">Country: </p>
            <input class="col-md-8" type="text" name="country">
        </div>
        <button  class="btn-submit"  type="submit">Add new</button>
    </form>
</div>
<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
