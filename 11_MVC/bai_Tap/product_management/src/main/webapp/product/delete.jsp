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
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/dataTables.bootstrap.min.css">
</head>
<body>
<div style="margin-left: 50px">

    <h1>Delete customer</h1>
    <p>
        <a href="/product">Back to customer list</a>
    </p>
    <form action="/product?action=delete&id=${product.id}" method="post">
        <h3>Are you sure?</h3>
        <fieldset>
            <legend>Product information</legend>
            <table>
                <tr>
                    <td>id: </td>
                    <td>${product.id}</td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td>${product.name}</td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td>${product.price}</td>
                </tr>
                <tr>
                    <td>quantity: </td>
                    <td>${product.quantity}</td>
                </tr>
                <tr>
                    <td>color: </td>
                    <td>${product.color}</td>
                </tr>
                <tr>
                    <td>discription: </td>
                    <td>${product.discription}</td>
                </tr>

                <tr>
                    <td>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal"
                                onclick="myFunction(${product.id})">
                            Delete
                        </button>
                    </td>
                    <td></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>


<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/product?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Chap nhan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Ban co muon xoa
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-danger btn-ok" value="Delete">
                    <input type="hidden" id="id" name="id">
                </div>
            </div>
        </form>
    </div>
</div>



<script type="text/javascript">
    function myFunction(id) {
        document.getElementById("id").value = id;
    }
</script>



<script src="bootstrap/jquery-3.6.0.min.js"></script>
<script src="bootstrap/popper.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<script src="bootstrap/jquery.dataTables.min.js"></script>
</body>
</html>
