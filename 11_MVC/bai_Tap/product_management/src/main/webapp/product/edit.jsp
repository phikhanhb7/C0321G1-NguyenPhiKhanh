<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/28/2021
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/dataTables.bootstrap.min.css">
    <style>
        .message{
            color: #20c997;
        }
    </style>
</head>
<body>

<h1>Edit customer</h1>

<p >
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>

<form action="/product?action=edit&id=${product.id}"method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>id: </td>
                <td><input type="text" name="id" id="id" value="${product.id}" readonly></td>
            </tr>
            <tr>
                <td>name: </td>
                <td><input type="text" name="name" id="name" value="${product.name}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" value="${product.price}"></td>
            </tr>
            <tr>
                <td>quantity: </td>
                <td><input type="text" name="quantity" id="quantity" value="${product.quantity}"></td>
            </tr>
            <tr>
                <td>color: </td>
                <td><input type="text" name="color" id="color" value="${product.color}"></td>
            </tr>
            <tr>
                <td>discription: </td>
                <td><input type="text" name="discription" id="discription" value="${product.discription}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update Product"></td>
            </tr>
        </table>
    </fieldset>

    <p>
        <a href="/product">Back to Product list</a>
    </p>
</form>

<script src="bootstrap/jquery-3.6.0.min.js"></script>
<script src="bootstrap/popper.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<script src="bootstrap/jquery.dataTables.min.js"></script>
</body>
</html>
