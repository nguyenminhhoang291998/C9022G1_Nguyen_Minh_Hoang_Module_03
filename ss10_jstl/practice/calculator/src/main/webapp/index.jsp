<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>

    </style>
</head>
<body>
<h2>Simple Calculator</h2>
<form action="/calculatorServlet" method="post">
    <p>First operand: <input type="text" name="firstOperand"></p>
    <p>Operator
        <select name="operator">
            <option value="addition">Addition</option>
            <option value="subtraction">Subtraction</option>
            <option value="multiplication">Multiplication</option>
            <option value="division">Division</option>
        </select>
    </p>
    <p>Second operand: <input type="text" name="secondOperand"></p>
    <button type="submit">Calculate</button>
</form>
</body>
</html>