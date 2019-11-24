<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/20
  Time: 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>examHome</title>
    <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>
    <link href="/others/forExamHome/css/main.css" rel="stylesheet" media="all" />

    <script src="/others/forExamHome/js/fun.base.js" type="text/javascript"></script>

    <script src="/others/forExamHome/js/julying.gridmenu.js" type="text/javascript"></script>

    <script src="/others/forExamHome/js/julying.planettravel.js" type="text/javascript"></script>

    <script src="/others/forExamHome/js/home.js" type="text/javascript"></script>

    <%--头像--%>
    <style>
        .gridMenu .quick-body .me{ float:left; width: 200px; height:200px; background:url(/others/forExamHome/images/me.png) 10px 5px no-repeat;}
    </style>

    <div id="julyingGridMenu" class="gridMenu">

        <h1 class="logos"><a href="/index.jsp">examProjectByGroupFive</a></h1>

        <div class="position">

            <div id="quick" class="quick item">

                <div class="show">

                    <div class="thumb">01</div>

                    <div class="small-thumb"></div>

                    <div class="title">快报</div>

                    <div class="close"></div>

                </div>

            </div>



            <div class="quick-body body">

                <div class="show">

                    <div class="me"></div>

                    <div class="about">

                        <strong class="name">user.name</strong> user.group
                        <p>最近考试:</p>
                        <p>考试成绩：</p>
                        <p>将要进行的考试：</p>
                        <p>倒计时：</p>

                    </div><div class="clear"></div>



                    <div class="introduction">

                        <%--考试历史表--%>
                        <%--<p>这个网站是我的个人主页，里面都为原创内容。</p>

                        <p>我经常会分享一些好资源</p>

                        <p>欢迎和我一起讨论编程技术。

                            <a class="qq" target="_blank" href="javascript:void(0)" title="网站源码">QQ</a>

                            <a class="weibo tencent" target="_blank" href="javascript:void(0)" title="js特效">JS特效</a>

                        </p>--%>


                    </div>

                </div><!-- .show-->

                <div class="bg" child-num="20"></div>

            </div><!-- .about-me-body-->



            <div id="selectExam" class="selectExam item">

                <div class="show">

                    <div class="thumb">02</div>

                    <div class="small-thumb"></div>

                    <div class="title">选择考试</div>

                    <div class="close"></div>

                </div>

                <ul>
                    <li class="start-exam" data-src="/exam/selectExam"><a href="javascript:void(0)"  title="选择考试">选择考试</a><span><b>01</b><font>选择考试</font><i class="png"></i></span></li>
                </ul>
            </div>


            <div id="examHistory" class="examHistory item">

                <div class="show">

                    <div class="thumb">03</div>

                    <div class="small-thumb"></div>

                    <div class="title">考试历史</div>

                    <div class="close"></div>

                </div>

                <ul>
                    <li class="history-exam" data-src="/exam/examHistory"><a href="javascript:void(0)" title="考试历史">考试历史</a><span><b>01</b><font>考试历史</font><i class="png"></i></span></li>
                </ul>

            </div>

            <div id="studentManage" class="studentManage item">

                <div class="show">

                    <div class="thumb">05</div>

                    <div class="small-thumb"></div>

                    <div class="title">学生管理</div>

                    <div class="close"></div>

                </div>

                <ul>
                    <li class="apply-confirm"><a href="javascript:void(0)"  title="申请确认">申请确认</a><span><b>01</b><font>申请确认</font><i class="png"></i></span></li>

                    <li class="student-affair"><a href="javascript:void(0)"  title="学生事务">学生事务</a><span><b>02</b><font>学生事务</font><i class="png"></i></span></li>

                    <li class="student-score"><a href="javascript:void(0)"  title="学生成绩">学生成绩</a><span><b>03</b><font>学生成绩</font><i class="png"></i></span></li>
                </ul>

            </div>

            <div id="paperManage" class="paperManage item">

                <div class="show">

                    <div class="thumb">02</div>

                    <div class="small-thumb"></div>

                    <div class="title">试卷管理</div>

                    <div class="close"></div>

                </div>

                <ul>
                    <li class="apply-confirm"><a href="javascript:void(0)"  title="新增试卷">新增试卷</a><span><b>01</b><font>新增试卷</font><i class="png"></i></span></li>
                    <li class="student-affair"><a href="javascript:void(0)"  title="选择试卷">使用试卷</a><span><b>02</b><font>选择试卷</font><i class="png"></i></span></li>
                </ul>


            </div>

            <div id="questionManage" class="questionManage item">
                <div class="show">
                    <div class="thumb">02</div>

                    <div class="small-thumb"></div>

                    <div class="title">题库管理</div>

                    <div class="close"></div>

                </div>

                <ul>
                    <li class="add-question" data-src="/exam/addQuestion"><a href="/exam/addQuestion"  title="出题">出题</a><span><b>01</b><font>题库管理</font><i class="png"></i></span></li>
                    <li class="import-question"><a href="javascript:void(0)" title="导题">导题</a><span><b>02</b><font>从文件中导题</font><i class="png"></i></span></li>
                </ul>

            </div>


            <div id="contact-me" class="contact-me item">

                <div class="show">

                    <div class="thumb">04</div>

                    <div class="small-thumb"></div>

                    <div class="title">导航</div>

                    <div class="close"></div>

                </div>

            </div>

            <div class="contact-me-body body">

                <div class="show">

                    <div class="business-card">

                        &lt;card&gt;

                        <ul>

                            <li>&lt;name&gt;<strong>慕浟佳</strong><span>&lt;/name&gt;</span></li>

                            <li>&lt;qq&gt;	<strong name="replace" val="1415575933">loading...</strong><span>&lt;/qq&gt;</span></li>

                            <li>&lt;email&gt;<strong name="replace" val="1415575933@qq.com">loading...</strong><span>&lt;/email&gt;</span></li>

                            <li>&lt;link&gt;<strong>ayoujia.com</strong><span>&lt;/link&gt;</span></li>

                        </ul>

                        &lt;/card&gt;

                        <div class="expand"></div>

                    </div>

                </div>

                <div class="bg" child-num="0"></div>

            </div>



            <div class="cells"><li class="cell"></li></div>

        </div>

    </div><!-- #julyingGridMenu -->

    <div style="display: none" id="hiddenBtn"></div>



    <%@include file="/WEB-INF/flowerBg.txt"%>


    <script type="text/javascript">
        $(function ($) {

            $('.item li').on('click',function(){
                function getModLit(){
                    $('#modalCss').remove();
                    var css = new MODALit({
                        el: '#hiddenBtn',
                        width: 'large',
                        footer: false,
                        transition: 'zoom',
                        content:'<p style="text-align: center;font-size:40px"><i class="fa fa-spinner fa-pulse"></i></p>',
                    /*    position:'bottom'*/
                    });
                    css.modal.id = "modalCss";


                    $('#modalCss [data-modal-btn=dismiss]').one('click',function(){
                        $('#modalCss').remove();
                        window.location.href='/exam/index';
                    });

                    $('.modalit[aria-hidden=false]').one('click',function(){
                        window.location.href='/exam/index';
                    });

                    return '#modalCss .content';
                }

                 var selector=getModLit();


                load(selector,$(this).attr('data-src'));

                $('#hiddenBtn').click();
            });
        })
    </script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">">

</body>
</html>
