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
<h1 style="text-align: center ; font-family: 'Baby Universe' ; color: #007bff;margin-top: 20px">----
    customerUsingService ---</h1>

<div>
    <div class="row mt-5 mb-3">

        <form action="/contracts?action=search" method="post" class="col align-content-end">
            <input type="text" name="customerName" placeholder="Enter Name">
            <input type="submit" value="Search">
        </form>


    </div>
</div>


<div class="row">
    <div class="col-11">
        <table id="tableCustomer" class="table table-striped">
            <thead>
            <tr>
                <%--                int customerId, String customerName, String customerPhone, int contractId,--%>
                <%--                String contractStartDate, String contractEndDate, String serviceName--%>
                <th scope="col">customerId</th>
                <th scope="col">customerName</th>
                <th scope="col">customerPhone</th>
                <th scope="col">contractId</th>
                <th scope="col">contractStartDate</th>
                <th scope="col">contractEndDate</th>
                <th scope="col">serviceName</th>
                <th scope="col">Show Attach Service</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${lists}" var="list">
                <tr>
                    <th scope="row">${list.customerId}</th>
                    <td>${list.customerName}</td>
                    <td>${list.customerPhone}</td>
                    <td>${list.contractId}</td>
                    <td>${list.contractStartDate}</td>
                    <td>${list.contractEndDate}</td>
                    <td>${list.serviceName}</td>
                    <td>
                        <div class="dropdown">
                            <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Attach Service
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <c:forEach items="${attachs}" var="attach">
                                    <c:if test="${attach.contractId == list.contractId}">
                                        <p class="dropdown-item" >${attach.attachServiceName}-Số lượng : ${attach.quantity}</p>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </td>

                    <td>
                        <button class="btn btn-primary">
                            <a href="contracts?action=edit&id=${list.contractId}"style="color: white">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#myModal"
                                onclick="myFunction('${list.contractId}')">
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
    <a href="/customer" class="btn btn-primary " style="margin-left: 50px"> Back to List Customer </a>
</div>

<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/customers">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Note</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <input type="hidden" name="action" value="delete">
                <input type="hidden" id="idCustomer" name="id">
                <div class="modal-body">
                    Bạn có muốn xóa  không ?
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
        document.getElementById("idCustomer").value = id;
        document.getElementById('nameCustomer').innerText = name;
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
