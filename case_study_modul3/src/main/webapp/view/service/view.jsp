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
    <form action="/service?action=view" style="width: 70%;margin-left: 155px">
        <div class="form-group row">
            <%--                String service_code, String serviceName, int serviceArea, double serviceCost,
            int serviceMaxPeople,--%>
            <%--                String serviceStandardRoom, String serviceDescriptionOtherConvenience,
            double servicePollArea,--%>
            <%--                int serviceNumberOfFloors, int serviceTypeId, int serviceRentTypeId)--%>

            <label class="col-sm-3 col-form-label">Service Id</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  readonly value="${service.serviceId}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">service_code</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" readonly value="${service.service_code}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceName</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control"  value="${service.serviceName}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceArea</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${service.serviceArea}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceCost</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control"  value="${service.serviceCost}">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceMaxPeople</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${service.serviceMaxPeople}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceStandardRoom</label>
            <div class="col-sm-6">
                <input type="email" readonly class="form-control"  value="${service.serviceStandardRoom}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceDescription OtherConvenience</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control"  value="${service.serviceDescriptionOtherConvenience}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">servicePollArea </label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control"  value="${service.servicePollArea}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceNumberOfFloors </label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control"  value="${service.serviceNumberOfFloors}">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceType</label>
            <div class="col-sm-6">
                <c:forEach var="type" items="${serviceTypeList}">
                    <c:if test="${type.serviceTypeId == service.serviceTypeId}">
                        <input type="text" readonly class="form-control" value="${type.serviceTypeName}">
                    </c:if>
                </c:forEach>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-3 col-form-label">serviceRentType</label>
            <div class="col-sm-6">
                <c:forEach var="type" items="${rentTypeList}">
                    <c:if test="${type.rentTypeId == service.serviceRentTypeId}">
                        <input type="text" readonly class="form-control" value="${type.rentTypeName}">
                    </c:if>
                </c:forEach>
            </div>
        </div>


        <div class="d-flex ">
            <a href="/service" class="btn btn-primary" style="margin-left: 200px">Back to list</a>
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
