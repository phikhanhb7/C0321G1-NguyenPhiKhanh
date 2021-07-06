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
    <link rel="stylesheet" href="assert/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="assert/bootstrap/dataTables.bootstrap.min.css">
    <style>
        .message{
            color:green;
        }
        label {
            text-align: right;
        }
        small{
            color: red;
        }
    </style>
</head>
<body>
<div style="margin: 50px 20px 20px 50px">
    <h1 style="margin-top: 20px ; color: #007bff ;text-align: center; font-family: 'Baby Universe'">Create new Customer</h1>

    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>

    <form action="/customer" method="post">
        <input type="hidden" name="action" value="create">

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Customer Code</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="customerCode" value="${customerFail.customerCode}" >
                <small>${errList.get(0)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">Customer Name</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control" name="customerName" value="${customerFail.customerName}">
                <small>${errList.get(1)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer Birthday</label>
            <div class="col-sm-6">
                <input type="date"  class="form-control"  name="customerBirthday" value="${customerFail.customerBirthday}">
                <small>${errList.get(2)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">customer Gender</label>
            <div class="col-sm-6">
<%--                <input type="text"  class="form-control"  name="customerGender">--%>
                         <select name="customerGender" class="form-control">
                             <option value="0"> Female</option>
                             <option value="1"> Male</option>
                             <option value="2"> LGBT</option>
                         </select>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer IdCard</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="customerIdCard" value="${customerFail.customerIdCard}" >
                <small>${errList.get(3)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer Phone</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control" name="customerPhone" value="${customerFail.customerPhone}">
                <small>${errList.get(4)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer Email</label>
            <div class="col-sm-6">
                <input type="text" y class="form-control" name="customerEmail" value="${customerFail.customerEmail}" >
                <small>${errList.get(5)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer Address</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="customerAddress" value="${customerFail.customerAddress}">
                <small>${errList.get(6)}</small>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer TypeId</label>
            <div class="col-sm-6">
                <select class="form-control" name="customerTypeId">
                    <c:forEach var="type" items="${customerType}">
                        <option value="${type.customerTypeId}" >${type.customerTypeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label"></label>
            <div class="col-sm-6 btn-primary">
                <input type="submit"  class="form-control btn-primary"  value="Create Customer">
            </div>
        </div>

        <div class="d-flex ">
            <a href="/customer" class="btn btn-primary" style="margin-left: 50px">Back to list</a>
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
