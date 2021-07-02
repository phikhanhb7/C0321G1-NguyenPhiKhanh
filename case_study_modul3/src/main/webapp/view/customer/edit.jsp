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
    <link rel="stylesheet" href="assert/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="assert/bootstrap/dataTables.bootstrap.min.css">
    <style>
        .message{
            color: #20c997;
        }
        label{
            text-align: center;
        }

    </style>
</head>
<body>

    <h3 style="margin: 20px 0px 20px 20px ; color: #007bff ;text-align: center; font-family: 'Baby Universe'">Edit Customer </h3>

    <p >
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>

    <form action="/customer?action=edit&id=${customer.customerId}"method="post">
        <div class="form-group row ">
            <%--                String customerCode, String customerName, String customerBirthday, int customerGender,--%>
            <%--                String customerIdCard, String customerPhone, String customerEmail, String customerAddress,--%>
            <%--                int customerTypeId--%>
            <label  class="col-sm-3 col-form-label">Customer Id</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="customerId" readonly value="${customer.customerId}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Customer Code</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="customerCode"  value="${customer.customerCode}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">Customer Name</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control" name="customerName" value="${customer.customerName}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer Birthday</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="customerBirthday" value="${customer.customerBirthday}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer Gender</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="customerGender" value="${customer.customerGender}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer IdCard</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="customerIdCard" value="${customer.customerIdCard}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer Phone</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control" name="customerPhone" value="${customer.customerPhone}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer Email</label>
            <div class="col-sm-6">
                <input type="text" y class="form-control" name="customerEmail" value="${customer.customerEmail}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer Address</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="customerAddress" value="${customer.customerAddress}">
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer TypeId</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="customerTypeId" value="${customer.customerTypeId}">
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label"></label>
            <div class="col-sm-6 btn-primary">
                <input type="submit"  class="form-control btn-primary"  value="Edit Customer">
            </div>
        </div>


        <div class="d-flex ">
            <a href="/customer" class="btn btn-primary" style="margin-left: 200px">Back to list</a>
        </div>
    </form>

    <script src="assert/bootstrap/jquery-3.6.0.min.js"></script>
    <script src="assert/bootstrap/jquery.dataTables.min.js"></script>
    <script src="assert/bootstrap/dataTables.bootstrap4.min.js"></script>
    <script src="assert/bootstrap/popper.min.js"></script>
    <script src="assert/bootstrap/bootstrap.min.js"></script>
</body>
</html>
