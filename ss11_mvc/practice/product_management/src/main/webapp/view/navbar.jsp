<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/3/2023
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nav bar</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../view/css-navbar.css">

</head>
<body>
<div class="row d-flex justify-content-center bg-success">
    <div class="col-md-2 btn btn-success p-4"><a href="/product?action=list" style="text-decoration: none"><h3>Display List</h3></a></div>
    <div class="col-md-2 btn btn-success p-4"><a href="/product?action=create" style="text-decoration: none"><h3>Add</h3></a></div>
    <div class="col-md-3 p-3">
        <form action="/product?action=find" method="post">
        <input type="text" name="name" placeholder="Search by name Product" style="height: 40px; border-radius: 3px">
        <button class="btn btn-warning" type="submit"><h4>Search</h4></button>
        </form>
    </div>
</div>

<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
