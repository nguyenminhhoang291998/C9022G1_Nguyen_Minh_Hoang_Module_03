<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/30/2022
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        h2{text-align: center;
            margin: 10px}
        img{width: 100px}
        table{
            font-size: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
<h2>Danh sách khách hàng</h2>
<table class="table ">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Tên</th>
        <th scope="col">Ngày Sinh</th>
        <th scope="col">Địa Chỉ</th>
        <th scope="col">Ảnh</th>
    </tr>
    </thead>
    <tbody>

       <c:forEach var="customer" items="${customerList}">
       <tr>
           <td>${customer.name}</td>
           <td>${customer.dayOfBirth}</td>
           <td>${customer.address}</td>
           <td><img src=${customer.picturePath}></td>
       </tr>
       </c:forEach>

    </tbody>
</table>
</body>
</html>
