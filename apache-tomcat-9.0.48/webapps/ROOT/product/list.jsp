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
        table{
            border: 1px solid;
            margin: 50px 100px 30px 50px;
        }
        p{
            margin-left: 50px;
        }
    </style>
</head>
<body>
<h1 style="text-align: center">Product</h1>
<p>
    <a href="/product?action=create">Create new customer</a>
<form action="/product?action=search" method="post" style="margin-left: 50px">
    <input type="text" name="name" >
    <input type="submit" value="Search">
</form>
</p>
<div class="row">
    <div class="col-10">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Color</th>
                <th scope="col">discription</th>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td><a href="/product?action=view&id=${product.id}"></a>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                    <td>${product.color}</td>
                    <td>${product.discription}</td>
                    <td><a href="/product?action=edit&id=${product.id}">Edit</a></td>
                    <td><a href="/product?action=delete&id=${product.id}">Delete</a></td>
                </tr>

            </c:forEach>


            </tbody>
        </table>
    </div>
    <div class="col-2"></div>
</div>


<script src="bootstrap/jquery-3.6.0.min.js"></script>
<script src="bootstrap/popper.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<script src="bootstrap/jquery.dataTables.min.js"></script>
</body>
</html>
