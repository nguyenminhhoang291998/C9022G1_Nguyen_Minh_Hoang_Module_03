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
    <link rel="stylesheet" href="../view/css-list.css">
</head>
<body>
<c:import url="navbar.jsp"></c:import>
<h3 class="message">
    <c:if test='${requestScope["mess"] != null}'>
        <span class="message">${requestScope["mess"]}</span>
    </c:if>
</h3>
<h2>List Product</h2>
<table class="table table-striped m-5">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Producer</th>
        <th>Detail</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
<c:forEach var="product" items="${productList}">
    <tr>
        <td>${product.id}</td>
        <td>${product.name}</td>
        <td>${product.price}</td>
        <td>${product.description}</td>
        <td>${product.producer}</td>
        <td><button class="btn btn-primary"><a href="/product?action=detail&id=${product.id}"><p>Detail</p></a></button></td>
        <td><button class="btn btn-success"><a href="/product?action=update&id=${product.id}"><p>Edit</p></a></button></td>
        <td><button class="btn btn-danger"><a href="/product?action=remove&id=${product.id}"><p>Delete</p></a></button></td>
    </tr>
</c:forEach>
</table>
</body>
</html>
