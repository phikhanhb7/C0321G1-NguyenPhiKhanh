<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/25/2021
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
 <h2>Product Discount Calculator</h2>
 <form action="/display" method="post">
     <p>Product Description</p>
     <input type="text" name="product">
     <p>List Price</p>
     <input type="text" name="price">
     <p>Discount Percent</p>
     <input type="text" name="discount" placeholder="%">
     <p aria-colspan="2"></p>
     <input type="submit" name="Send" >
 </form>
  </body>
</html>
