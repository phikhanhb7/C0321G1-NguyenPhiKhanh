<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/28/2021
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="/bootstrap/bootstrap.min.css">
    <style>
        h2{
            text-align: center;
            color: #20c997;
            margin-top: 50px;
            margin-bottom: 50px;
        }
        table{
            border: 1px solid;
            margin: 0px 50px 0px 50px;

        }

    </style>
</head>
<body>
<h2>List Customer</h2>
<table class="table table-striped" >
    <thead>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Adress</th>
        <th scope="col">Image</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customerList}" var= "customer">
    <tr>
        <td>${customer.name}</td>
        <td>${customer.birthday}</td>
        <td>${customer.adress}</td>
        <td>
            <img src="${customer.image}" width="80px" height="80px">
        </td>

    </tr>
    </c:forEach>
</table>
</body>
</html>
