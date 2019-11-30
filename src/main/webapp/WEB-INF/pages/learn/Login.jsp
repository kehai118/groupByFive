<%--
  Created by IntelliJ IDEA.
  User: yyq1
  Date: 2019/11/24
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<%--        <form action="/note/login" method="get">--%>
<%--            用户名：<input type="text" name="name">--%>
<%--            密码：<input type="password" name="password">--%>
<%--            <input type="submit" value="登录">--%>
<%--                    </form>--%>
    <form action="/note/Login" method="get">
    ${Login}
    用户名：<input type="text" name="name">
    密码：<input type="password" name="password">
    <input type="submit" value="登录">
    </form>

</body>
</html>
