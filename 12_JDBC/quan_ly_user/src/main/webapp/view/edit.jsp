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
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/dataTables.bootstrap.min.css">
    <style>
        .message{
            color: #20c997;
        }
    </style>
</head>
<body>

<h1>Edit User</h1>

<p >
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>

<form action="/users?action=edit&id=${user.id}"method="post">
    <fieldset>
        <legend>User information</legend>
        <table>
            <tr>
                <td>id: </td>
                <td><input type="text" name="id" id="id" value="${user.id}" readonly></td>
            </tr>
            <tr>
                <td>name: </td>
                <td><input type="text" name="name" id="name" value="${user.name}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email" value="${user.email}"></td>
            </tr>
            <tr>
                <td>Country: </td>
                <td><input type="text" name="country" id="country" value="${user.country}"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update User"></td>
            </tr>
        </table>
    </fieldset>

    <p>
        <a href="/users">Back to User list</a>
    </p>
</form>

<script src="bootstrap/jquery-3.6.0.min.js"></script>
<script src="bootstrap/popper.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<script src="bootstrap/jquery.dataTables.min.js"></script>
</body>
</html>
