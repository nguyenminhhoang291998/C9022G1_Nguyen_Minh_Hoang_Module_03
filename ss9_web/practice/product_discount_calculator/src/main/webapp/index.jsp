<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> Product Discount Calculator</title>
    <style>
        form{
            width: 220px;
            height: 300px;
            margin: 20px 500px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<div>
<form action="/display-discount" method="post" style="padding: 30px">

    <p>Product Description: </p><input type="text" name="description">
    <p>List Price: </p><input type="number" name="price">
    <p>Discount Percent: </p><input type="number" name="percent"><br>
    <button type="submit" style="margin: 30px"> Calculate Discount</button>
</form>
</div>
</body>
</html>