<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/24
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>New Test Paper</title>
    <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>
<link rel="stylesheet" type="text/css" href="/css/exam/newPaper/styles.css">
<link href="/css/exam/doExam/iconfont.css" rel="stylesheet" type="text/css" />
<link href="/css/exam/doExam/test.css" rel="stylesheet" type="text/css" />

<%--<link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/q_styles.css" />--%>
<link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/style.css"/>
<link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/bootstrap.min.css" />
<script src="/js/exam/addQuestion/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/exam/addQuestion/bootbox.min.js"></script>
<%@include file="/Menu.jsp"%>
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

    #header{
        position: relative;
        overflow: hidden;
    }

    #clock{
        position:absolute;
        right: 5%;
        top:50%;
        transform: translateY(-50%);
    }
    html>body #footer {
        margin-left: 0px;
        margin-right: 0px;
    }

    .q_del{
        margin-right: -50px;
        float: right;
        font-size: 0.75em;
    }
</style>
<div id="doc3" class="yui-t7">
    <div id="hd">
        <div id="header">
            <h1 id="h1">新增试卷</h1>
            <div id='clock'></div>
            <a href="#" style="visibility: hidden;position: absolute;" id="toJump"></a>
        </div>
    </div>
    <div id="bd">
        <div id="yui-main">
            <div class="yui-b">
                <div class="content">
                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>单选题</h2>
                            <p>
                                <span>共</span><i class="content_lit" id="total_radio"></i><span>题，</span><span>合计</span><i class="content_fs" id="total_radio_score"></i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr" type="radio">
                        <ul>
                            <li id="h_radio" class="question" style="display: none">
                                <div class="test_content_nr_tt">
                                    <i class="index">1</i><span>(<span class="score">1</span>分)</span><font class="qb">在生产管理信息系统中，下列操作步骤能正确将工单推进流程的是（  ）</font><a href="#" class="q_del">删除</a>
                                </div>

                                <div class="test_content_nr_main">
                                    <ul>
                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="answer1"
                                                   id="0_answer_1_option_1" value="A" disabled
                                            />

                                            <label for="0_answer_1_option_1" class="option_title">
                                                A.
                                                <p class="ue" style="display: inline;">在工具栏中点击“workflow”标签</p>
                                            </label>
                                        </li>
                                        <label>
                                            <p class="ue answer">答案：B</p>
                                        </label>
                                        <p  class="explain">解析:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>多选题</h2>
                            <p>
                                <span>共</span><i class="content_lit" id="total_checkBox"></i><span>题，</span><span>合计</span><i class="content_fs" id="total_checkBox_score"></i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr" type="checkBox">
                        <ul>
                            <li id="h_check" class="question" style="display: none">
                                <div class="test_content_nr_tt">
                                    <i class="index">1</i><span>(<span class="score">1</span>分)</span><font class="qb">以下属于南方电网员工职业操守中明文规定的有()</font><a href="#" class="q_del">删除</a>
                                </div>

                                <div class="test_content_nr_main">
                                    <ul>
                                        <li class="option">
                                            <input type="checkbox" class="radioOrCheck" name="answer1"
                                                   id="1_answer_1_option_1" value="A" disabled
                                            />

                                            <label for="1_answer_1_option_1"  class="option_title">
                                                A.
                                                <p class="ue error" style="display: inline;">热爱祖国、热爱南网、热爱岗位</p>
                                            </label>
                                        </li>
                                        <label>
                                            <p class="ue answer">答案：BC</p>
                                        </label>
                                        <p  class="explain">解析:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>

                                    </ul>
                                </div>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <div class="yui-b">
            <div id="secondary"><div class="content">
                <!--搜索输入框及查询、重置按钮-->
                <div class="container content_width">
                    <div class="person_search">
                        <div class="search_input">
                            <div class="input-group mb-3">
                                <span>搜索：</span>
                                <select id="Ktype">
                                    <option value="0">全部</option>
                                    <option value="1">题型</option>
                                    <option value="2">题类</option>
                                    <option value="3">分值</option>
                                    <option value="4">内容</option>
                                </select>
                                <input id="Ktext" type="text" class="form-control" placeholder="不能为空">
                            </div>
                        </div>
                        <div class="search_input">
                            <button class="btn btn-primary search_btn" type="button" id="search_btn">查询</button>
                            <button class="btn btn-primary search_btn" type="button" id="back_btn">重置</button>
                        </div>
                    </div>
                    <div class="line"></div>
                </div>
                <!--表格列表-->
                <table id="tb" class="table">
                    <thead>
                    <tr>
                        <th>题型</th>
                        <th>题类</th>
                        <th>题名</th>
                        <th>分值</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="show_tbody">
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
                    </tbody>
                </table>
                <!--添加按钮及bootstrap的模态框-->
                <div class="export" style="float: right">
                    <button id="reset" type="button" class="btn btn-primary btn-sm" >
                        <span>清空</span>
                    </button>
                    <button id="submit" type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                            data-target="#newPaper">
                        <span>确定</span>
                    </button>
                    <div class="modal fade" id="newPaper">
                        <div class="modal-dialog modal-lg modal_position">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" style="font-family: 隶书;">确定新建试卷</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <input class="paper_name" type="text" placeholder="请输入试卷名称" style="margin:0 auto;display:block;">
                                        <button type="button" class="btn btn-secondary" style="float: right; margin-right: 20px;" id="newPaperSubmit">确定</button>
                                    </div>
                                </div>
                                <%--<div class="modal-footer">

                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="clear"> </div></div>
        </div>
    </div>
    <div id="ft" ><div id="footer" style="text-align: center;line-height: 50px;">Copyright &copy; - LBB YYQ FYW DST</div></div>
</div>
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

    })
</script>
<script type="text/javascript" src="/js/exam/addPaper/addPaper.js"></script>
</body>
</html>

