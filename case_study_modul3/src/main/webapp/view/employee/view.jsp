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
    <form action="/employee?action=view" style="width: 70%;margin-left: 155px">
        <div class="form-group row">
            <%--                int employeeId, String employeeName, String employeeBirthday, String employeeIdCard,--%>
            <%--                double employeeSalary, String employeePhone, String employeeEmail, String employeeAddress,
            --%>
            <%--                int positionId, int educationDegreeId, int divisionId, String userName--%>

            <label class="col-sm-3 col-form-label">employee Id</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  readonly value="${employee.employeeId}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeeName</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" readonly value="${employee.employeeName}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeeBirthday</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" name="name" value="${employee.employeeBirthday}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeeIdCard</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${employee.employeeIdCard}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeeSalary</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control"  value="${employee.employeeSalary}">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeePhone</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" value="${employee.employeePhone}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeeEmail</label>
            <div class="col-sm-6">
                <input type="email" readonly class="form-control" name="phone" value="${employee.employeeEmail}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeeAddress</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control" name="email" value="${employee.employeeAddress}">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Position</label>
            <div class="col-sm-6">
                <c:forEach var="type" items="${positionList}">
                    <c:if test="${type.positionId == employee.positionId}">
                        <input type="text" readonly class="form-control" value="${type.positionName}">
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">educationDegree</label>
            <div class="col-sm-6">
                <c:forEach var="type" items="${educationDegreeList}">
                    <c:if test="${type.educationDegreeId == employee.educationDegreeId}">
                        <input type="text" readonly class="form-control" value="${type.educationDegreeName}">
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">division</label>
            <div class="col-sm-6">
                <c:forEach var="type" items="${divisionList}">
                    <c:if test="${type.divisionId == employee.divisionId}">
                        <input type="text" readonly class="form-control" value="${type.divisionName}">
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">PassWord</label>
            <div class="col-sm-6">
                <c:forEach var="type" items="${userNameList}">
                    <c:if test="${type.userName == employee.userName}">
                        <input type="text" readonly class="form-control" value="${type.password}">
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
