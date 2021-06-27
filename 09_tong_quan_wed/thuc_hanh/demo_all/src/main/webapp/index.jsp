<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/27/2021
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Product List</title>
  <link rel="stylesheet" href="../../bootraps_min/bootstrap.min.css">
  <link rel="stylesheet" href="../../bootraps_min/dataTables.bootstrap.min.css">
</head>
<body>
<div class="container-fluid align-items-center justify-content-between d-flex mb-3"
     style="background: #085F56;height: 60px">
  <div class=""><img src="../../img/FURAMA.png" height="60" width="60"/></div>
  <h1 class="d-flex justify-content-center text-white">Product List</h1>
  <p class="mr-4" style="color: white;font-size: larger">MY Name</p>
</div>



<div class="d-flex justify-content-between my-3">
  <a href="/products?action=create" class="btn btn-info" style="border-radius: 5px">Create New Product</a>
  <form action="/products?action=search" class="form-inline my-2 my-lg-0 d-flex" method="post">
    <input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchName">
    <button class="btn btn-info my-2 my-sm-0" type="submit">Search</button>
  </form>
</div>

<!--content body-->
<div class="container-fluid">
  <div class="row">
    <table id="tableCustomer" class="table table-striped table-bordered" style="width: 100%">
      <thead>
      <tr>
        <th scope="col">STT</th>
        <th scope="col">Product Name</th>
        <th scope="col">Price</th>
        <th scope="col">Quantity</th>
        <th scope="col">Color</th>
        <th scope="col">Description</th>
        <th scope="col">Category</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${products}" var="product" varStatus="status">
        <tr>
          <th scope="row">${status.count}</th>
          <th>${product.name}</th>
          <td>${product.price}</td>
          <td>${product.quantity}</td>
          <td>${product.color}</td>
          <td>${product.discription}</td>
          <c:forEach items="${categorys}" var="category">
            <c:if test="${product.idCategory==category.id}">
              <td>${category.name}</td>
            </c:if>
          </c:forEach>
          <td><a class="btn btn-warning" href="/products?action=edit&id=${product.id}">Edit</a></td>
          <td>
            <button type="button" class="btn btn-danger buttonDelete" data-toggle="modal"
                    data-target="#exampleModal" onclick="sendData('${product.id}','${product.name}')">
              Delete
            </button>
          </td>
        </tr>
      </c:forEach>

      </tbody>
    </table>
  </div>
</div>

<!-- Modal delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="/products?action=delete" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Delete product</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          Do you want to delete <span id="productName"></span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Delete</button>
          <input type="hidden" id="codeDelete" name="idProduct">
        </div>
      </form>
    </div>
  </div>
</div>
<script src="../../bootraps_min/jquery-3.6.0.min.js"></script>
<script src="../../bootraps_min/jquery.dataTables.min.js"></script>
<script src="../../bootraps_min/dataTables.bootstrap4.min.js"></script>
<script src="../../bootraps_min/popper.min.js"></script>
<script src="../../bootraps_min/bootstrap.min.js"></script>
<script>
  $(document).ready(function () {
    $('#tableCustomer').dataTable({
      "dom": 'lrtip',
      "lengthChange": false,
      "pageLength": 5,
    });
  });
  function sendData(id,name) {
    document.getElementById("codeDelete").value = id;
    document.getElementById("productName").innerText = name;
  }
</script>

</body>
</html>