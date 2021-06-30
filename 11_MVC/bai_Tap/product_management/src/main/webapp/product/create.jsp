<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/28/2021
  Time: 4:54 PM
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
            color:green;
        }
        div td {
            margin: 10px;
        }
    </style>
</head>
<body>
<div style="margin: 50px 20px 20px 50px">
    <h1>Create new customer</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/product">Back to customer list</a>
    </p>
    <form action="/product" method="post">
        <input type="hidden" name="action" value="create">
        <fieldset>
            <legend>Customer information</legend>
            <table>
                <tr>
                    <td style="margin-bottom: 10px">id: </td>
                    <td><input type="text" name="id" id="id"></td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" id="name"></td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td><input type="text" name="price" id="price"></td>
                </tr>
                <tr>
                    <td>quantity: </td>
                    <td><input type="text" name="quantity" id="quantity"></td>
                </tr>
                <tr>
                    <td>color: </td>
                    <td><input type="text" name="color" id="color"></td>
                </tr>
                <tr>
                    <td>discription: </td>
                    <td><input type="text" name="discription" id="discription"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create product"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>

<script src="bootstrap/jquery-3.6.0.min.js"></script>
<script src="bootstrap/popper.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<script src="bootstrap/jquery.dataTables.min.js"></script>
</body>
</html>
