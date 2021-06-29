<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/28/2021
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product details</h1>
<p style="margin-left: 50px">
    <a href="/product">Back to Product list</a>
</p>

    <div style="margin-left: 50px">
        <table style="border: 1px solid">
            <tr>
                <td>id: </td>
                <td>${product.id}</td>
            </tr>
            <tr>
                <td>Name: </td>
                <td>${product.name}</td>
            </tr>
            <tr>
                <td>Price: </td>
                <td>${product.price}</td>
            </tr>
            <tr>
                <td>quantity: </td>
                <td>${product.quantity}</td>
            </tr>
            <tr>
                <td>color: </td>
                <td>${product.color}</td>
            </tr>
            <tr>
                <td>discription: </td>
                <td>${product.discription}</td>
            </tr>

        </table>
    </div>

</body>
</html>
