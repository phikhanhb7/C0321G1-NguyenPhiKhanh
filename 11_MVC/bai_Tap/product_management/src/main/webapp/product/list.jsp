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
    <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../bootstrap/dataTables.bootstrap.min.css">



    <style>
        table{
            border: 1px solid;
            margin: 50px 100px 30px 50px;
        }
        p{
            margin-left: 50px;
        }
    </style>
</head>
<body>
<h1 style="text-align: center">Product</h1>
<p>
    <a href="/product?action=create">Create new customer</a>
<form action="/product?action=search" method="post" style="margin-left: 50px">
    <input type="text" name="name" >
    <input type="submit" value="Search">
</form>
</p>
<div class="row">
    <div class="col-10">
        <table id="tableProduct"  class="table table-striped">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Color</th>
                <th scope="col">discription</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${products}" var="product" varStatus="a">
                <tr>
                    <td>${a.count}</td>
                    <td><a href="/product?action=view&id=${product.id}">${product.name}</a></td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                    <td>${product.color}</td>
                    <td>${product.discription}</td>
                    <td><a href="/product?action=edit&id=${product.id}">Edit</a></td>
                    <td>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal"
                                onclick="myFunction('${product.id}','${product.name}')">
                            Delete
                        </button>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-2"></div>
</div>

<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
            <div class="modal-content">
                <form action="/product">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Note</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" id="idProduct" name="id">
                    <div class="modal-body">
                        Bạn có muốn xóa <span id="nameProduct" style="color: #7abaff"></span> không ?
                    </div>
                    <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-danger btn-ok" value="Delete">
                </div>
                </form>
            </div>

    </div>
</div>

<script src="../bootstrap/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/jquery.dataTables.min.js"></script>
<script src="../bootstrap/dataTables.bootstrap4.min.js"></script>
<script src="../bootstrap/popper.min.js"></script>
<script src="../bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
    function myFunction(id,name) {
        document.getElementById("idProduct").value = id;
        document.getElementById('nameProduct').innerText = name ;
    }
</script>

<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4,

        });
    });
</script>



</body>
</html>
