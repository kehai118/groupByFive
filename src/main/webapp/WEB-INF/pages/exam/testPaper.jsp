<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/27
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>testPaper</title>
    <%@include file="/WEB-INF/commonRel.jsp"%>

    <link href="/css/exam/doExam/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="/css/exam/doExam/test.css" rel="stylesheet" type="text/css" />

    <%--<link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/q_styles.css" />--%>
    <link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/style.css"/>
    <link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/bootstrap.min.css" />
    <script src="/js/exam/addQuestion/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/exam/addQuestion/bootbox.min.js"></script>
</head>
<body>
<%@include file="/Menu.jsp"%>
    <div class="content">
    <c:if test="${question.radioLength>0}">
        <div class="test_content">
            <div class="test_content_title">
                <h2>单选题</h2>
                <p>
                    <span>共</span><i class="content_lit">${question.radioLength}</i><span>题，</span><span>合计</span><i class="content_fs">${question.radioScore}</i><span>分</span>
                </p>
            </div>
        </div>
        <div class="test_content_nr">
        <ul>
            <c:forEach items="${question.radioQuestion}" var="it" varStatus="ip">
                <li id="${it.id}" class="lq_lq">  <%--题目index--%>
                <div class="test_content_nr_tt">
                    <i>${ip.count}</i><span>(${it.score}分)</span><font>${it.question}</font><b class="icon iconfont">&#xe881;</b>
                </div>

                <div class="test_content_nr_main">
                    <ul>
                        <c:forEach items="${it.options}" var="io" varStatus="is">
                                 <li class="option">
                                <input type="radio" class="radioOrCheck" name="answer${ip.count}"
                                       id="0_answer_${ip.count}_option_${is.count}" value="${io.optionIndex}"
                                       <c:if test="${empty test}">
                                           disabled
                                           <c:if test="${io.optionIndex eq it.answer}">
                                               checked
                                           </c:if>
                                       </c:if>
                                />
                                <label for="0_answer_${ip.count}_option_${is.count}">
                                    ${io.optionIndex}.
                                    <p class="ue" style="display: inline;">${io.descript}</p>
                                </label>
                            </li>
                        </c:forEach>
                        </li>
                    </ul>
                <c:if test="${empty test}">
                <label>
                    <p class="ue answer">答案：${it.answer}</p>
                </label>
                <p  class="explain">解析:${it.analyze}</p>
                </c:if>
                </div>

            </c:forEach>

        </ul>
    </div>
    </c:if>
    <c:if test="${question.checkBoxLength>0}">
        <div class="test_content">
             <div class="test_content_title">
            <h2>多选题</h2>
            <p>
                <span>共</span><i class="content_lit">${question.checkBoxLength}</i><span>题，</span><span>合计</span><i class="content_fs">${question.checkBoxScore}</i><span>分</span>
            </p>
        </div>
        </div>
        <div class="test_content_nr">
        <ul>
            <c:forEach varStatus="is" var="ip" items="${question.checkBoxQuestion}">
                <li id="${ip.id}" class="lq_lq">
                    <div class="test_content_nr_tt">
                    <i>${is.count}</i><span>(${ip.score}分)</span><font>${ip.question}</font><b class="icon iconfont">&#xe881;</b>
                </div>

                    <div class="test_content_nr_main">
                    <ul>
                        <c:forEach var="io" varStatus="iv" items="${ip.options}">
                        <li class="option">
                            <input type="checkbox" class="radioOrCheck" name="answer${is.count}"
                                   id="1_answer_${is.count}_option_${iv.count}" value="${io.optionIndex}"
                                    <c:if test="${empty test}">
                                        disabled
                                        <c:if test="${fn:contains(ip.answer,io.optionIndex)}">
                                            checked
                                        </c:if>
                                    </c:if>
                            />

                            <label for="1_answer_${is.count}_option_${iv.count}">
                                    ${io.optionIndex}.
                                <p class="ue" style="display: inline;">${io.descript}</p>
                            </label>
                        </li>
                        </c:forEach>
                    </ul>
                <c:if test="${empty test}">
                    <label>
                        <p class="ue answer">答案：${ip.answer}</p>
                    </label>
                    <p  class="explain">解析:${ip.analyze}</p>
                </c:if>
                </li>
            </c:forEach>
            </div>
        </ul>
    </div>
    </c:if>
</div>
</body>
</html>
