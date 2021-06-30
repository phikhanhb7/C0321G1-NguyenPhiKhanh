<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/28/2021
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User details</h1>
<p style="margin-left: 50px">
    <a href="/users">Back to User list</a>
</p>

    <div style="margin-left: 50px">
        <table style="border: 1px solid">
            <tr>
                <td>id: </td>
                <td>${user.id}</td>
            </tr>
            <tr>
                <td>Name: </td>
                <td>${user.name}</td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>${user.email}</td>
            </tr>
            <tr>
                <td>Country: </td>
                <td>${user.country}</td>
            </tr>

        </table>
    </div>

</body>
</html>
