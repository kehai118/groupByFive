<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/24
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>新建考试</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>
<%@include file="/Menu.jsp"%>
    <link rel="stylesheet" type="text/css" href="/css/exam/newTest/styles.css" />

    <link href="/css/exam/doExam/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="/css/exam/doExam/test.css" rel="stylesheet" type="text/css" />

    <%--<link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/q_styles.css" />--%>
    <link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/style.css"/>
    <link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/bootstrap.min.css" />
    <script src="/js/exam/addQuestion/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/exam/addQuestion/bootbox.min.js"></script>
    <style>
        #header h1{
            text-align: center;
            margin: 1.5em auto;
            font-family: 方正粗黑宋简体;
            font-size: 25px;
        }

        h3{
            text-align: center;
            margin: .3em auto;
            font-family: 隶书;
        }

        *::-webkit-scrollbar{
            width:0;
        }

        #header{
            position: relative;
            overflow: hidden;
        }

        #clock{
            position:absolute;
            left: 50%;
            top:50%;
            transform: translate(-50%,-50%);
        }
        html>body #footer {
            margin-left: 0px;
            margin-right: 0px;
        }
    </style>
<!-- Begin Wrapper -->
<div id="wrapper">
    <!-- Begin Header -->
    <div id="header"><h1>新建考试</h1></div>
    <!-- End Header -->
    <!-- Begin Navigation -->
    <div id="navigation" style="text-align: right">操作人:${user.name}&emsp;&emsp;&emsp;	 当前时间:<span id="nowTime"></span> &emsp;</div>
    <!-- End Navigation -->
    <!-- Begin Faux Columns -->
    <div id="faux">
        <!-- Begin Left Column -->
        <div id="leftcolumn">
            <div style="height: 30vh; display: table;text-align: center;padding:10vh 0">
                <c:if test="${not empty paper}">
                <div id="formToCreate">
                <p>选择试卷:&emsp;<select class="sp">
                    <c:forEach items="${paper}" var="it">
                        <option value="${it.id}">${it.name}</option>
                    </c:forEach>
                </select>
                </p>
                    <%--<p>选择使用班级:&emsp;<select name="sc">
                        <c:forEach items="${paper}" var="it">
                            <option value="${it.id}">${it.name}</option>
                        </c:forEach>
                    </select></p>--%>
                    <p>考试时间(分钟):</p>
                    <jsp:useBean id="now" class="java.util.Date" scope="page"/>
                    <p><input type="number"  min="30" max="160" class="st" value="120"></p>
                    <p>开考时间:</p>
                    <p style="text-align: left;font-size: 0.75em;">日期：<input  type="date" pattern="yyyy-MM-dd"  class="sd1"></p>
                    <p style="text-align: left;font-size: 0.75em">时间：<input  type="time" pattern="HH:mm" min="09:00" max="18:00" class="sd2"></p>
                    <button class="magicBtn round" style="margin: 0 auto;" id="submitBtn">确定</button>
                    </div>
                </c:if>
                <c:if test="${empty paper}">
                    <p style="text-align: center;font-size: 16px;">还未有可用试卷</p>
                </c:if>
            </div>
            <div style="height: 35vh;position: relative;">
                <div id="clock"></div>
            </div>
            <div id="hiddenBtn" style="display: none;"></div>

        </div>
        <!-- End Left Column -->
        <!-- Begin Right Column -->
        <div id="rightcolumn" style="overflow-y:scroll;overflow-x:hidden; ">
        </div>
        <!-- End Right Column -->
        <div class="clear"> </div>
    </div>
    <!-- End Faux Columns -->
    <!-- Begin Footer -->
    <div id="footer" style="text-align: center;">Copyright &copy; - LBB YYQ FYW DST</div>
    <!-- End Footer -->
</div>
    <!-- End Wrapper -->
    <script src="/js/exam/addQuestion/mejs.js"></script>
    <script>
        $(function($){
            //时钟初始化
            AnalogClock("clock", {
                // 文本颜色
                foreColor: "#000",
                // 时钟的宽度
                width: 100,
                // 时钟的背景颜色
                bgColor: "#eee"
            });


            $('#submitBtn').click(function () {
                if($('.sd1').val()=='' || $('.sd2').val()=='' || $('st').val()=='') return;

                var tag=true;

                var limit=$('.st').val();
                var select=$('.sp').val();

                if(limit.length==0 || limit<30 || limit>300) {
                    tag = false;
                    return false;
                }
                var time=new Date($('.sd1').val()).Format("yyyy-MM-dd")+" "+$('.sd2').val()+":00";



                if(new Date(time).getTime() < new Date().getTime()){
                     $("#modalCss").remove();
                    var css=new MODALit({
                        el:"#hiddenBtn",
                        content:'<p style="font-size: 30px;text-align: center;font-family: 华文楷体;">考试日期小于当前时间</p>',
                        footer:false,
                        transition: 'slideUp'
                    });
                    css.modal.id = "modalCss";
                    $('#hiddenBtn').click();
                    tag=false;
                    return;
                }

                if(tag)
                 $.get('/exam/newTestSubmit',{
                     examTime:time,
                     testTime:limit,
                     testPaperId:select
                 },function (e) {
                     if(e>0){
                         var css=new MODALit({
                             el:"#hiddenBtn",
                             content:'<p style="font-size: 30px;text-align: center;font-family: 华文楷体;">创建考试'+e+'成功,请等待返回主页</p>',
                             footer:false,
                             transition: 'slideUp'
                         });
                         css.modal.id = "modalCss";
                         $('#hiddenBtn').click();
                         setTimeout(function () {
                             window.location.href="/exam/index";
                         },2000)
                     }
                 });

                return false;
            });

        });

        Date.prototype.Format = function(fmt) {
            var o = {
                "M+" : this.getMonth() + 1,
                "d+" : this.getDate(),
                "h+" : this.getHours(),
                "m+" : this.getMinutes(),
                "s+" : this.getSeconds(),
                "q+" : Math.floor((this.getMonth() + 3) / 3),
                "S" : this.getMilliseconds()
            };
            if (/(y+)/.test(fmt))
                fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt))
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        };

        setInterval(function () {
            $('#nowTime').html(new Date().Format("hh:mm:ss"))},500);

        $('.sd1').val(new Date().Format("yyyy-MM-dd"));
        $('.sd2').val(new Date().Format("hh:mm"));

        function IsDate(num){
            var regexp = /^([1][7-9][0-9][0-9]|[2][0][0-9][0-9])(\-)([0][1-9]|[1][0-2])(\-)([0-2][1-9]|[3][0-1])$/g;
            /// 日期范围：1700/01/01 ----2099-01-01 　
            return regexp.test(num);
        }

        function IsPhone(val){
            var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;//手机号码
            var isMob= /^0?1[3|4|5|8][0-9]\d{8}$/;// 座机格式
            if(isMob.test(val)||isPhone.test(val)){
                return true;
            }
            else{
                return false;
            }
        }

        load($('#rightcolumn'),'/exam/loadPaper?id='+$('.sp').val().trim());

        $('.sp').change(function () {
            load($('#rightcolumn'),'/exam/loadPaper?id='+$('.sp').val().trim());
        });

    </script>


</body>
</html>
