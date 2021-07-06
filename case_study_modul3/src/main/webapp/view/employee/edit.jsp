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

    <h3 style="margin: 20px 0px 20px 20px ; color: #007bff ;text-align: center; font-family: 'Baby Universe'">Edit Employee </h3>

    <p >
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>

    <form action="/employee?action=edit&id=${employee.employeeId}"method="post">
        <div class="form-group row ">

            <%--                int employeeId, String employeeName, String employeeBirthday, String employeeIdCard,--%>
            <%--                double employeeSalary, String employeePhone, String employeeEmail, String employeeAddress,--%>
            <%--                int positionId, int educationDegreeId, int divisionId, String userName--%>

            <label  class="col-sm-3 col-form-label">employeeId</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="employeeId" readonly value="${employee.employeeId}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeeName</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="employeeName"  value="${employee.employeeName}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeBirthday</label>
            <div class="col-sm-6">
                <input type="date"  class="form-control" name="employeeBirthday" value="${employee.employeeBirthday}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeIdCard</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="employeeIdCard" value="${employee.employeeIdCard}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeSalary</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="employeeSalary" value="${employee.employeeSalary}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeePhone</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control" name="employeePhone" value="${employee.employeePhone}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeEmail</label>
            <div class="col-sm-6">
                <input type="text" y class="form-control" name="employeeEmail" value="${employee.employeeEmail}">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeAddress</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="employeeAddress" value="${employee.employeeAddress}">
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">PositionId</label>
            <div class="col-sm-6">
                <select class="form-control" name="positionId">
                    <c:forEach var="type" items="${positionList}">
                        <option value="${type.positionId}"${type.positionId==employee.positionId?"selected":""} >${type.positionName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">Division</label>
            <div class="col-sm-6">
                <select class="form-control" name="divisionId">
                    <c:forEach var="type" items="${divisionList}">
                        <option value="${type.divisionId}" ${type.divisionId==employee.divisionId?"selected":""}>${type.divisionName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">EducationDegree</label>
            <div class="col-sm-6">
                <select class="form-control" name="educationDegreeId">
                    <c:forEach var="type" items="${educationDegreeList}">
                        <option value="${type.educationDegreeId}" ${type.educationDegreeId==employee.educationDegreeId?"selected":""} >${type.educationDegreeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label"></label>
            <div class="col-sm-6 btn-primary">
                <input type="submit"  class="form-control btn-primary"  value="Edit Customer">
            </div>
        </div>


        <div class="d-flex ">
            <a href="/employee" class="btn btn-primary" style="margin-left: 200px">Back to list</a>
        </div>
    </form>

    <script src="assert/bootstrap/jquery-3.6.0.min.js"></script>
    <script src="assert/bootstrap/jquery.dataTables.min.js"></script>
    <script src="assert/bootstrap/dataTables.bootstrap4.min.js"></script>
    <script src="assert/bootstrap/popper.min.js"></script>
    <script src="assert/bootstrap/bootstrap.min.js"></script>
</body>
</html>
