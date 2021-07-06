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

    <form action="/employee" method="post">
        <input type="hidden" name="action" value="create">

        <%--                int employeeId, String employeeName, String employeeBirthday, String employeeIdCard,--%>
        <%--                double employeeSalary, String employeePhone, String employeeEmail, String employeeAddress,--%>
        <%--                int positionId, int educationDegreeId, int divisionId, String userName--%>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">employeeName</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="employeeName" value="${employeeFail.employeeName}" >
                <small>${errList.get(0)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeBirthday</label>
            <div class="col-sm-6">
                <input type="date"  class="form-control" name="employeeBirthday" value="${employeeFail.employeeBirthday}">
                <small>${errList.get(1)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeIdCard</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="employeeIdCard" value="${employeeFail.employeeIdCard}">
                <small>${errList.get(2)}</small>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeSalary</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="employeeSalary" value="${employeeFail.employeeSalary}">
                <small>${errList.get(3)}</small>
            </div>
        </div>


        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeePhone</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control" name="employeePhone" value="${employeeFail.employeePhone}">
                <small>${errList.get(4)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeEmail</label>
            <div class="col-sm-6">
                <input type="text" y class="form-control" name="employeeEmail" value="${employeeFail.employeeEmail}" >
                <small>${errList.get(5)}</small>
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employeeAddress</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control"  name="employeeAddress" value="${employeeFail.employeeAddress}">
                <small>${errList.get(6)}</small>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">Position</label>
            <div class="col-sm-6">
                <select class="form-control" name="positionId">
                    <c:forEach var="type" items="${positionList}">
                        <option value="${type.positionId}" >${type.positionName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">EducationDegree</label>
            <div class="col-sm-6">
                <select class="form-control" name="educationDegreeId">
                    <c:forEach var="type" items="${educationDegreeList}">
                        <option value="${type.educationDegreeId}" >${type.educationDegreeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">Division</label>
            <div class="col-sm-6">
                <select class="form-control" name="divisionId">
                    <c:forEach var="type" items="${divisionList}">
                        <option value="${type.divisionId}" >${type.divisionName}</option>
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
            <a href="/employee" class="btn btn-primary" style="margin-left: 50px">Back to list</a>
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
