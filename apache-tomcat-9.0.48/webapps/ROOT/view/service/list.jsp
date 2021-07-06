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
        table {
            border: 1px solid;
            margin: 50px 100px 30px 50px;
        }

        p {
            margin-left: 50px;
        }
    </style>
</head>
<body>
<h1 style="text-align: center ; font-family: 'Baby Universe' ; color: #007bff;margin-top: 20px">---- Service ---</h1>

<div>
    <div class="row mt-5 mb-3">
        <div class="col align-content-start">
            <a href="/service?action=create" class="btn btn-primary" style="margin-left: 50px">Create Servie</a>
        </div>

    </div>
</div>



<div class="row">
    <div class="col-11">
        <table id="tableCustomer" class="table table-striped">
            <thead>
            <tr>
<%--                String service_code, String serviceName, int serviceArea, double serviceCost, int serviceMaxPeople,--%>
<%--                String serviceStandardRoom, String serviceDescriptionOtherConvenience, double servicePollArea,--%>
<%--                int serviceNumberOfFloors, int serviceTypeId, int serviceRentTypeId)--%>
                <th scope="col">STT</th>
                <th scope="col">service_code</th>
                <th scope="col">serviceName</th>
                <th scope="col">serviceArea</th>
                <th scope="col">serviceCost</th>
                <th scope="col">serviceMaxPeople</th>
                <th scope="col">serviceStandardRoom</th>
                <th scope="col">serviceDescriptionOtherConvenience</th>
                <th scope="col">servicePollArea</th>
                <th scope="col">serviceNumberOfFloors</th>
                <th scope="col">serviceType</th>
                <th scope="col">serviceRentType</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${serviceList}" var="service" varStatus="a">
                <tr>
                    <td>${a.count}</td>
                    <td>${service.service_code}</td>
                    <td><a href="/service?action=view&id=${service.serviceId}">${service.serviceName}</a></td>
                    <td>${service.serviceArea}</td>
                    <td>${service.serviceCost}</td>
                    <td>${service.serviceMaxPeople}</td>
                    <td>${service.serviceStandardRoom}</td>
                    <td>${service.serviceDescriptionOtherConvenience}</td>
                    <td>${service.servicePollArea}</td>
                    <td>${service.serviceNumberOfFloors}</td>

                    <c:forEach var="type" items="${serviceTypeList}">
                        <c:if test="${type.serviceTypeId == service.serviceTypeId}">
                            <td>${type.serviceTypeName}</td>
                        </c:if>
                    </c:forEach>

                    <c:forEach var="type" items="${rentTypeList}">
                        <c:if test="${type.rentTypeId == service.serviceRentTypeId}">
                            <td>${type.rentTypeName}</td>
                        </c:if>
                    </c:forEach>

                    <td>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#myModal"
                                onclick="myFunction('${service.serviceId}','${service.serviceName}')">
                            Delete
                        </button>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-1"></div>
</div>

<div class="d-flex mt-3">
    <a href="/view/home/home.jsp" class="btn btn-primary " style="margin-left: 50px"> Back to Menu </a>
</div>

<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/service">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Note</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <input type="hidden" name="action" value="delete">
                <input type="hidden" id="idEmployee" name="id">
                <div class="modal-body">
                    Bạn có muốn xóa <span id="nameEmployee" style="color: #7abaff"></span> không ?
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-danger btn-ok" value="Delete">
                </div>
            </form>
        </div>

    </div>
</div>

<script src="assert/bootstrap/jquery-3.6.0.min.js"></script>
<script src="assert/bootstrap/jquery.dataTables.min.js"></script>
<script src="assert/bootstrap/dataTables.bootstrap4.min.js"></script>
<script src="assert/bootstrap/popper.min.js"></script>
<script src="assert/bootstrap/bootstrap.min.js"></script>


<script type="text/javascript">
    function myFunction(id, name) {
        document.getElementById("idEmployee").value = id;
        document.getElementById('nameEmployee').innerText = name;
    }
</script>

<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4,

        });
    });
</script>


</body>
</html>
