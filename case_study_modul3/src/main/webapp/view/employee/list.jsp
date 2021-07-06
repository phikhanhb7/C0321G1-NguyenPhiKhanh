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
<h1 style="text-align: center ; font-family: 'Baby Universe' ; color: #007bff;margin-top: 20px">---- Employee ---</h1>

<div>
    <div class="row mt-5 mb-3">
        <div class="col align-content-start">
            <a href="/employee?action=create" class="btn btn-primary" style="margin-left: 50px">Create Employee</a>
        </div>

            <form action="/employee?action=search" method="post" class="col align-content-end">
                <input type="text" name="employeeName" placeholder="Enter Name">
                <input type="submit" value="Search">
            </form>


    </div>
</div>



<div class="row">
    <div class="col-11">
        <table id="tableCustomer" class="table table-striped">
            <thead>
            <tr>
<%--                int employeeId, String employeeName, String employeeBirthday, String employeeIdCard,--%>
<%--                double employeeSalary, String employeePhone, String employeeEmail, String employeeAddress,--%>
<%--                int positionId, int educationDegreeId, int divisionId, String userName--%>
                <th scope="col">STT</th>
                <th scope="col">employeeName</th>
                <th scope="col">employeeBirthday</th>
                <th scope="col">employeeIdCard</th>
                <th scope="col">employeeEmail</th>
                <th scope="col">employeeAddress</th>
                <th scope="col">position</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${employeeList}" var="employee" varStatus="a">
                <tr>
                    <td>${a.count}</td>

                    <td><a href="/employee?action=view&id=${employee.employeeId}">${employee.employeeName}</a></td>
                    <td>${employee.employeeBirthday}</td>
                    <td>${employee.employeeIdCard}</td>
                    <td>${employee.employeeEmail}</td>
                    <td>${employee.employeeAddress}</td>

                    <c:forEach var="type" items="${positionList}">
                        <c:if test="${type.positionId == employee.positionId}">
                            <td>${type.positionName}</td>
                        </c:if>
                    </c:forEach>

                    <td>
                        <button class="btn btn-primary">
                            <a href="/employee?action=edit&id=${employee.employeeId}" style="color: white">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#myModal"
                                onclick="myFunction('${employee.employeeId}','${employee.employeeName}')">
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
            <form action="/employee">
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
