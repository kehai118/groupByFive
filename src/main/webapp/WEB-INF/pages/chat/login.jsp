<%--
  Created by IntelliJ IDEA.
  User: ding
  Date: 2019/11/26
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<form action="/com/loginOK" method="post">
      <span style="color: red">${tt}</span><br>
账号：<input type="text" placeholder="账号" name="account"><br>
密码：<input type="password" placeholder="密码" name="password"><br>
      <input type="submit" value="登录">
</form>
</body>
</html>
