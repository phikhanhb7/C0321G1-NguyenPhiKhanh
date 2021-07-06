<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/2/2021
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="assert/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="assert/bootstrap/dataTables.bootstrap.min.css">

</head>
<body>
<div class="container-fluid d-flex justify-content-center">
    <h1 style="font-family: 'Baby Universe' ;color: #007bff ; margin-top: 10px">Show Information </h1>
</div>
<div class="container d-flex ">
    <form action="/customer?action=view" style="width: 70%;margin-left: 155px">
        <div class="form-group row">
            <%--                String customerCode, String customerName, String customerBirthday, int customerGender,--%>
            <%--                String customerIdCard, String customerPhone, String customerEmail, String customerAddress,--%>
            <%--                int customerTypeId--%>
            <label class="col-sm-3 col-form-label">Customer Id</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" readonly value="${customer.customerId}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Customer Code</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" readonly value="${customer.customerCode}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Customer Name</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${customer.customerName}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer Birthday</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${customer.customerBirthday}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer Gender</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="
<c:if test="${customer.customerGender == 0 }">Female</c:if>
<c:if test="${customer.customerGender == 1 }">Male</c:if>
<c:if test="${customer.customerGender == 2}">LGBT</c:if>">


            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer IdCard</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${customer.customerIdCard}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer Phone</label>
            <div class="col-sm-6">
                <input type="email" readonly class="form-control" value="${customer.customerPhone}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer Email</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${customer.customerEmail}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer Address</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${customer.customerAddress}">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer TypeId</label>
            <div class="col-sm-6">
                <c:forEach var="type" items="${customerTypes}">
                    <c:if test="${type.customerTypeId == customer.customerTypeId}">
                        <input type="text" readonly class="form-control" value="${type.customerTypeName}">
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="d-flex ">
            <a href="/customer" class="btn btn-primary" style="margin-left: 200px">Back to list</a>
        </div>
    </form>
</div>

<script src="assert/bootstrap/jquery-3.6.0.min.js"></script>
<script src="assert/bootstrap/jquery.dataTables.min.js"></script>
<script src="assert/bootstrap/dataTables.bootstrap4.min.js"></script>
<script src="assert/bootstrap/popper.min.js"></script>
<script src="assert/bootstrap/bootstrap.min.js"></script>
</body>
</html>
