<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/27/2021
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../bootraps_min/bootstrap.min.css">

</head>
<body>

<div class="container-fluid d-flex justify-content-center">
    <h1>Edit Product</h1>
</div>
<div>
    <c:if test="${message!=null}">
        <h3 class="text-success">${message}</h3>
    </c:if>
</div>
<div class="container d-flex ">
    <form action="/products?action=edit" style="width: 70%;margin-left: 155px" method="post">
        <div class="form-group row">
            <label for="inputCode5" class="col-sm-3 col-form-label">Product Id</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputCode5" name="idProduct" readonly value="${product.id}" >
                <small>${errList.get(0)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputCode" class="col-sm-3 col-form-label">Product Name</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputCode" name="name" value="${product.name}" >
                <small>${errList.get(0)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputName" class="col-sm-3 col-form-label">Product Price</label>
            <div class="col-sm-6">
                <input type="number" class="form-control" id="inputName" name="price" value="${product.price}">
                <small>${errList.get(1)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputDate" class="col-sm-3 col-form-label">Quantity</label>
            <div class="col-sm-6">
                <input type="number" class="form-control" id="inputDate" name="quantity" value="${product.quantity}">
                <small>${errList.get(2)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputDate1" class="col-sm-3 col-form-label">Color</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputDate1" name="color" value="${product.color}">
                <small>${errList.get(2)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputDate2" class="col-sm-3 col-form-label">Description</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputDate2" name="description" value="${product.discription}">
                <small>${errList.get(2)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">Category</label>
            <div class="col-sm-6">
                <select name="category">
                    <c:forEach items="${categorys}" var="category">
                        <option value="${category.id}" ${category.id == product.idCategory?"selected":""}>${category.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="d-flex ">
            <a href="/products" class="btn btn-secondary" style="margin-left: 200px">Back to list</a>
            <input type="submit" class="btn btn-success" style="margin-left: 174px;width: 100px" value="Edit">
        </div>

    </form>
</div>

<script src="../../bootraps_min/jquery-3.6.0.min.js"></script>
<script src="../../bootraps_min/popper.min.js"></script>
<script src="../../bootraps_min/bootstrap.min.js"></script>
</body>
</html>
