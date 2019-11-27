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
                <form id="formToCreate">
                <p>选择试卷:&emsp;<select class="sp">
                    <c:forEach items="${paper}" var="it">
                        <option value="${it.id}">${it.name}</option>
                    </c:forEach>
                </select>
                </p>
                    <p>选择使用班级:&emsp;<select name="sc">
                        <c:forEach items="${paper}" var="it">
                            <option value="${it.id}">${it.name}</option>
                        </c:forEach>
                    </select></p>
                    <p>考试时间(分钟):</p>
                    <p><input type="number"  min="30" max="160" class="st"></p>
                    <p>开考时间:</p>
                    <p style="text-align: left;font-size: 0.75em;">日期：<input  type="date" pattern="yyyy-MM-dd" value="2019-11-27" class="sd1"></p>
                    <p style="text-align: left;font-size: 0.75em">时间：<input  type="time" pattern="HH:mm" value="08:22" min="09:00" max="18:00" class="sd2"></p>
                    <button class="magicBtn round" style="margin: 0 auto;" id="submitBtn">确定</button>
                    </form>
                </c:if>
                <c:if test="${empty paper}">
                    <p style="text-align: center;font-size: 16px;">还未有可用试卷</p>
                </c:if>
            </div>
            <div style="height: 35vh;position: relative;">
                <div id="clock"></div>
            </div>

        </div>
        <!-- End Left Column -->
        <!-- Begin Right Column -->
        <div id="rightcolumn" style="overflow-y:scroll;overflow-x:hidden; ">
            <div class="content">
                <div class="test_content">
                    <div class="test_content_title">
                        <h2>单选题</h2>
                        <p>
                            <span>共</span><i class="content_lit">60</i><span>题，</span><span>合计</span><i class="content_fs">60</i><span>分</span>
                        </p>
                    </div>
                </div>
                <div class="test_content_nr">
                    <ul>
                        <li id="qu_0_0">  <%--题目index--%>
                            <div class="test_content_nr_tt">
                                <i>1</i><span>(1分)</span><font>在生产管理信息系统中，下列操作步骤能正确将工单推进流程的是（  ）</font><b class="icon iconfont">&#xe881;</b>
                            </div>

                            <div class="test_content_nr_main">
                                <ul>

                                    <li class="option">

                                        <input type="radio" class="radioOrCheck" name="answer1"
                                               id="0_answer_1_option_1" value="A" disabled
                                        />


                                        <label for="0_answer_1_option_1">
                                            A.
                                            <p class="ue" style="display: inline;">在工具栏中点击“workflow”标签</p>
                                        </label>
                                    </li>

                                    <li class="option">

                                        <input type="radio" class="radioOrCheck" name="answer1"
                                               id="0_answer_1_option_2" value="B" disabled
                                        />


                                        <label for="0_answer_1_option_2">
                                            B.
                                            <p class="ue" style="display: inline;">在缺陷单界面中点击“推进流程”按钮</p>
                                        </label>
                                    </li>

                                    <li class="option">

                                        <input type="radio" class="radioOrCheck" name="answer1"
                                               id="0_answer_1_option_3" value="C" checked
                                        />


                                        <label for="0_answer_1_option_3">
                                            C.
                                            <p class="ue right" style="display: inline;">在缺陷单界面中点击“提交”按钮</p>
                                        </label>
                                    </li>

                                    <li class="option">

                                        <input type="radio" class="radioOrCheck" name="answer1"
                                               id="0_answer_1_option_4" value="D" disabled
                                        />


                                        <label for="0_answer_1_option_4">
                                            D.
                                            <p class="ue" style="display: inline;">后台启动流程推进</p>
                                        </label>

                                        <label>
                                            <p class="ue">答案：C</p>
                                        </label>
                                    </li>

                                </ul>
                            </div>
                        </li>




                        <li id="qu_0_59">
                            <div class="test_content_nr_tt">
                                <i>60</i><span>(1分)</span><font>工作完成后需要进行的操作，下列说法正确的是（  ）</font><b class="icon iconfont">&#xe881;</b>
                            </div>

                            <div class="test_content_nr_main">
                                <ul>

                                    <li class="option">

                                        <input type="radio" class="radioOrCheck" name="r_answer60"
                                               id="0_answer_60_option_1" value="A"
                                        />


                                        <label for="0_answer_60_option_1">
                                            A.
                                            <p class="ue" style="display: inline;">工作完毕后交还操作工具，清理现场</p>
                                        </label>
                                    </li>

                                    <li class="option">

                                        <input type="radio" class="radioOrCheck" name="r_answer60"
                                               id="0_answer_60_option_2" value="B"
                                        />


                                        <label for="0_answer_60_option_2">
                                            B.
                                            <p class="ue" style="display: inline;">工作完毕后交还操作工具</p>
                                        </label>
                                    </li>

                                    <li class="option">

                                        <input type="radio" class="radioOrCheck" name="r_answer60"
                                               id="0_answer_60_option_3" value="C"
                                        />
                                        <label for="0_answer_60_option_3">
                                            C.
                                            <p class="ue" style="display: inline;">工作完毕后交还操作工具并无损坏，清理现场</p>
                                        </label>
                                    </li>

                                </ul>
                            </div>
                        </li>

                    </ul>
                </div>

                <div class="test_content">
                    <div class="test_content_title">
                        <h2>多选题</h2>
                        <p>
                            <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">30</i><span>分</span>
                        </p>
                    </div>
                </div>
                <div class="test_content_nr">
                    <ul>

                        <li id="qu_1_0">
                            <div class="test_content_nr_tt">
                                <i>1</i><span>(1分)</span><font>以下属于南方电网员工职业操守中明文规定的有()</font><b class="icon iconfont">&#xe881;</b>
                            </div>

                            <div class="test_content_nr_main">
                                <ul>
                                    <li class="option">
                                        <input type="checkbox" class="radioOrCheck" name="answer1"
                                               id="1_answer_1_option_1" value="A" checked disabled
                                        />

                                        <label for="1_answer_1_option_1">
                                            A.
                                            <p class="ue error" style="display: inline;">热爱祖国、热爱南网、热爱岗位</p>
                                        </label>
                                    </li>

                                    <li class="option">


                                        <input type="checkbox" class="radioOrCheck" name="answer1"
                                               id="1_answer_1_option_2" value="B" checked disabled
                                        />

                                        <label for="1_answer_1_option_2">
                                            B.
                                            <p class="ue right" style="display: inline;">遵纪守法、忠于职守、令行禁止</p>
                                        </label>
                                    </li>

                                    <li class="option">

                                        <input type="checkbox" class="radioOrCheck" name="answer1"
                                               id="1_answer_1_option_3" value="C" disabled
                                        />

                                        <label for="1_answer_1_option_3">
                                            C.
                                            <p class="ue miss" style="display: inline;">客户至上、诚实守信、优质服务</p>
                                        </label>
                                    </li>

                                    <li class="option">


                                        <input type="checkbox" class="radioOrCheck" name="answer1"
                                               id="1_answer_1_option_4" value="D" disabled
                                        />

                                        <label for="1_answer_1_option_4">
                                            D.
                                            <p class="ue" style="display: inline;">公平竞争、互相监督、服从监管</p>
                                        </label>

                                        <label>
                                            <p class="ue">答案：B、C</p>
                                        </label>
                                        <p class="dpn">解析:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
                                    </li>

                                </ul>
                            </div>
                        </li>


                        <li id="qu_1_29">
                            <div class="test_content_nr_tt">
                                <i>30</i><span>(1分)</span><font>以变压器容量计算基本电费的用户,其备用的变压器（含高压电动机）说法正确的是（  ）</font><b class="icon iconfont">&#xe881;</b>
                            </div>

                            <div class="test_content_nr_main">
                                <ul>

                                    <li class="option">


                                        <input type="checkbox" class="radioOrCheck" name="c_answer30"
                                               id="1_answer_30_option_1"
                                        />

                                        <label for="1_answer_30_option_1">
                                            A.
                                            <p class="ue" style="display: inline;">所有状态皆需缴纳基本电费</p>
                                        </label>
                                    </li>

                                    <li class="option">


                                        <input type="checkbox" class="radioOrCheck" name="c_answer30"
                                               id="1_answer_30_option_2"
                                        />

                                        <label for="1_answer_30_option_2">
                                            B.
                                            <p class="ue" style="display: inline;">所有状态皆不用缴纳基本电费</p>
                                        </label>
                                    </li>

                                    <li class="option">


                                        <input type="checkbox" class="radioOrCheck" name="c_answer30"
                                               id="1_answer_30_option_3"
                                        />

                                        <label for="1_answer_30_option_3">
                                            C.
                                            <p class="ue" style="display: inline;">属冷备用状态并经供电企业加封的，不用交基本电费，属热备用状态的或未经加封的，需缴纳基本电费</p>
                                        </label>
                                    </li>

                                    <li class="option">
                                        <input type="checkbox" class="radioOrCheck" name="c_answer30"
                                               id="1_answer_30_option_4"
                                        />

                                        <label for="1_answer_30_option_4">
                                            D.
                                            <p class="ue" style="display: inline;">属冷备用状态并经供电企业加封的，需缴纳基本电费，属热备用状态的或未经加封的，不用交基本电费</p>
                                        </label>
                                    </li>

                                </ul>
                            </div>
                        </li>

                    </ul>
                </div>

            </div>
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
        
        $('#submitBtn').click(function () {

        });

    </script>
</body>
</html>
