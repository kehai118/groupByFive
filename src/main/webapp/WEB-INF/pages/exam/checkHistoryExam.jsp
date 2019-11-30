<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/21
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>checkHistoryExam</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
  <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>


<link rel="stylesheet" type="text/css" href="/css/exam/chcekExam/style.css" media="screen" />
<%--<link href="/css/exam/doExam/main.css" rel="stylesheet" type="text/css" />--%>
<link href="/css/exam/doExam/iconfont.css" rel="stylesheet" type="text/css" />
<link href="/css/exam/doExam/test.css" rel="stylesheet" type="text/css" />
<style>
  h1{
    text-align: center;
    margin: 1em auto;
    font-family: 方正粗黑宋简体;
  }

  h3{
    text-align: center;
    margin: .3em auto;
    font-family: 隶书;
  }

  .error{
    background: red;
    color:#fff;
  }

  .right{
    background:green;
    color:#fff;
  }

  .miss{
    background:yellow;
    color:#fff;
  }

  .dpn{
    display: none;
  }

</style>

<div id="header">
  <h1>sc1907-19.11.22月考</h1><br>
  <h3>姓名:${user.realname}  成绩:${answer.score} 总分:${paper.totalScore}</h3>
  <h3>考试时间:<fmt:formatDate value="${answer.submitTime}"></fmt:formatDate></h3>
</div>
<!--//end #header//-->
<div id="centerColumn" class="clearfix">
  <div id="rightColumn">

  </div>
  <div id="paper">
  </div>
  <script>
      load("#paper","/exam/loadPaper?id=${paper.id}&type=2");
  </script>
</div>
<!--//end #centerColumn//-->
<div id="footer">Copyright &copy; - LBB YYQ FYW DST</div>
<!--//end #footer//-->

<script type="text/javascript">
  $(function ($) {
    var choose="${answer.answer}";

    setTimeout(function () {
      $('.test_content_nr_main').hover(function () {
        $('#rightColumn').html($(this).find('.explain').text());
      },function () {
        $('#rightColumn').html("");
      });
        $(".explain").hide();
       window.split = choose.substring(1,choose.length-1).split(',');
      $(".lq_lq").each(function() {
             $op=$(this);
            window.cs = split[$(this).index(".lq_lq")];
              $op.find("input:checked").each(function () {
                  if(window.cs.indexOf($(this).attr("value"))>-1){
                    $(this).next().addClass("right");
                  }else {
                    $(this).attr("checked",false);
                    $(this).next().addClass("miss");
                  }
                  window.cs.replace($(this).attr("value"),"");
              });
              if(window.cs.length>0){
                var strings = window.cs.split("");
                $(strings).each(function () {
                  var $find = $op.find("input[value="+this+"]");
                  $find.attr("checked",true);
                  $find.next().addClass("error");
                })
              }
        })
    },50);
  })

</script>
<%@include file="/Menu.jsp"%>
</body>
</html>
