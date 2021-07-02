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
<h1 style="text-align: center ; font-family: 'Baby Universe' ; color: #007bff;margin-top: 20px">---- Customer ---</h1>

<div>
    <div class="row mt-5 mb-3">
        <div class="col align-content-start">
            <a href="/customer?action=create" class="btn btn-primary" style="margin-left: 50px">Create Customer</a>
        </div>

            <form action="/customer?action=search" method="post" class="col align-content-end">
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
                <%--                String customerCode, String customerName, String customerBirthday, int customerGender,--%>
                <%--                String customerIdCard, String customerPhone, String customerEmail, String customerAddress,--%>
                <%--                int customerTypeId--%>
                <th scope="col">STT</th>
                <th scope="col">Customer Code</th>
                <th scope="col">Customer Name</th>
                <th scope="col">customer Birthday</th>
                <th scope="col">customer Gender</th>
                <th scope="col">customer IdCard</th>
                <th scope="col">customer Phone</th>
                <th scope="col">customer Email</th>
                <th scope="col">customer Address</th>
                <th scope="col">customer TypeId</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer" varStatus="a">
                <tr>
                    <td>${a.count}</td>
                    <td>${customer.customerCode}</td>
                    <td><a href="/customer?action=view&id=${customer.customerId}">${customer.customerName}</a></td>
                    <td>${customer.customerBirthday}</td>
                    <td>
                        <c:choose>
                            <c:when test="${customer.customerGender == 0 }">Female</c:when>
                            <c:when test="${customer.customerGender == 1 }">Male</c:when>
                            <c:otherwise>LGBT</c:otherwise>
                        </c:choose>

                    </td>
                    <td>${customer.customerIdCard}</td>
                    <td>${customer.customerPhone}</td>
                    <td>${customer.customerEmail}</td>
                    <td>${customer.customerAddress}</td>

                    <c:forEach var="type" items="${customerTypeList}">
                        <c:if test="${type.customerTypeId == customer.customerTypeId}">
                            <td>${type.customerTypeName}</td>
                        </c:if>
                    </c:forEach>

                    <td>
                        <button class="btn btn-primary">
                            <a href="/customer?action=edit&id=${customer.customerId}" style="color: white">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#myModal"
                                onclick="myFunction('${customer.customerId}','${customer.customerName}')">
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
            <form action="/customer">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Note</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <input type="hidden" name="action" value="delete">
                <input type="hidden" id="idCustomer" name="id">
                <div class="modal-body">
                    Bạn có muốn xóa <span id="nameCustomer" style="color: #7abaff"></span> không ?
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
