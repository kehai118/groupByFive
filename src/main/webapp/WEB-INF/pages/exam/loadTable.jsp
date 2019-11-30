<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/28
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"isELIgnored="false" %>
<html>
<head>
    <title>LoadTable</title>
</head>
<body>
<c:forEach items="${question}" var="ques">
    <tr tid="${ques.id}">
        <td>${ques.type}</td>
        <td>${ques.kind}</td>
        <td>${ques.question}</td>
        <td>${ques.score}分</td>
        <td>
            <a href="#" class="q_add">添加</a>
        </td>
    </tr>
</c:forEach>
</body>
</html>
