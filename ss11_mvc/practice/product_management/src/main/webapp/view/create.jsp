<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/3/2023
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="../view/css-form.css">

</head>
<body>
<c:import url="navbar.jsp"></c:import>
<h2>Add Product</h2>
<div class="form-table">
<form method="post">
    <div class="row">
        <p class="col-md-4">ID: </p>
        <input class="col-md-8" type="number" name="id">
    </div>

    <div class="row">
        <p class="col-md-4">Name: </p>
        <input class="col-md-8" type="text" name="name">
    </div>

    <div class="row">
        <p class="col-md-4">Price: </p>
        <input class="col-md-8" type="text" name="price">
    </div>

    <div class="row">
        <p class="col-md-4">Description: </p>
        <input class="col-md-8" type="text" name="description">
    </div>

    <div class="row">
        <p class="col-md-4">Producer: </p>
        <input class="col-md-8" type="text" name="producer">
    </div>

    <button  class="btn-submit"  type="submit">Add new</button>
</form>
</div>
</body>
</html>
