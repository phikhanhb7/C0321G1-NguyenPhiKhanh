<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/24/2021
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Hello you</h1>
<form action="/login" method="post">
    <table>
        <tr>
            <th>Name </th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>Pass </th>
            <td><input type="text" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" name="Login"></td>
        </tr>
    </table>
</form>
</body>
</html>
