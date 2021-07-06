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
    <h1 style="margin-top: 20px ; color: #007bff ;text-align: center; font-family: 'Baby Universe'">Create new Employee</h1>

    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>

    <form action="/service" method="post">
        <input type="hidden" name="action" value="create">

        <%--                String service_code, String serviceName, int serviceArea, double serviceCost,
         int serviceMaxPeople,--%>
        <%--                String serviceStandardRoom, String serviceDescriptionOtherConvenience,
         double servicePollArea,--%>
        <%--                int serviceNumberOfFloors, int serviceTypeId, int serviceRentTypeId)--%>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">service_code</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="service_code"  >
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">serviceName</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control" name="serviceName" >
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">serviceArea</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="serviceArea" >
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">serviceCost</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="serviceCost" >
            </div>
        </div>


        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">serviceMaxPeople</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control" name="serviceMaxPeople">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">serviceStandardRoom</label>
            <div class="col-sm-6">
                <input type="text" y class="form-control" name="serviceStandardRoom"  >
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">serviceDescriptionOtherConvenience</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="serviceDescriptionOtherConvenience">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">servicePollArea</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="servicePollArea">
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">serviceNumberOfFloors</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="serviceNumberOfFloors">
            </div>
        </div>


        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">serviceType</label>
            <div class="col-sm-6">
                <select class="form-control" name="serviceTypeId">
                    <c:forEach var="type" items="${serviceTypeList}">
                        <option value="${type.serviceTypeId}" >${type.serviceTypeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">RentType</label>
            <div class="col-sm-6">
                <select class="form-control" name="serviceRentTypeId">
                    <c:forEach var="type" items="${rentTypeList}">
                        <option value="${type.rentTypeId}" >${type.rentTypeName}</option>
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
            <a href="/service" class="btn btn-primary" style="margin-left: 50px">Back to list</a>
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
