<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/28
  Time: 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>ExamErro</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<%@include file="/Menu.jsp"%>
    <h3>
        <c:if test="${not empty isDo}">你不能参与已经考过的考试</c:if>
        <c:if test="${not empty missTime}">开考30分钟后不能参加考试</c:if>
        <c:if test="${not empty history}">你不能参与曾经的考试</c:if>
        <c:if test="${not empty notStart}">考试尚未开始</c:if>
    </h3>
</body>
</html>
