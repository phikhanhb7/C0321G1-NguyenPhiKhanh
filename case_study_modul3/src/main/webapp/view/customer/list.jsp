<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/29/2021
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid d-flex " style="background: #e6faf8">
    <div class="col-2"> Item
        <c:if test="${message!=null}">
            <p class="text-primary">${message}</p>
        </c:if>
    </div>

    <div class="col-8">
        <p class="text-center p-3 row" style="font-family: 'Comic Sans MS',cursive;font-weight: bold;font-size: 20px">
            LIST CUSTOMER</p>
        <p class="text-center p-3 row" style="font-family: 'Comic Sans MS',cursive;font-weight: bold;font-size: 20px">
            <button><a href="/customer?action=create" methods="get">Create Customer</a></button>
        </p>
        <p class="text-center p-3 row" style="font-family: 'Comic Sans MS',cursive;font-weight: bold;font-size: 20px">
            <button ><a href="/customeruseservice" methods="get">Customer List Are Using</a></button>
        </p>

        <p class="text-center p-3 row" style="font-family: 'Comic Sans MS',cursive;font-weight: bold;font-size: 20px">
        </p>
        <table id="tableCustomer" class="table table-bordered table-striped ">
            <thead>
            <tr>
                <th>STT</th>
                <th>Customer Type</th>
                <th>Name</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customers}" var="customer" varStatus="a">
                <tr>
                    <td>${a.count}</td>
                    <c:forEach var="type" items="${customerTypes}">
                        <c:if test="${type.idTypeCustomer == customer.idTypeCustomer}">
                            <td>${type.customerTypeName}</td>
                        </c:if>
                    </c:forEach>
                    <td>${customer.name}</td>
                    <td>${customer.dateOfBirth}</td>
                    <td>
                            ${customer.sex==1?"Male":"Female"}
                    </td>
                        <%--                    <td>--%>
                        <%--                    <c:if test="${customer.sex==1}">--%>
                        <%--                        Male--%>
                        <%--                    </c:if>--%>
                        <%--                    <c:if test="${customer.sex==0}">--%>
                        <%--                        FeMale--%>
                        <%--                    </c:if>--%>
                        <%--                    </td>--%>
                        <%--                    --%>
                    <td >
                        <a href="/customer?action=edit&id=${customer.idCustomer}">
                            <button type="button" class="btn btn-primary">Edit</button>
                        </a>
                    </td>
                    <td>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal"
                                onclick="myFunction(${customer.idCustomer})">
                            Delete
                        </button>
                    </td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-2"> Item <br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>

</div>
</body>
</html>
