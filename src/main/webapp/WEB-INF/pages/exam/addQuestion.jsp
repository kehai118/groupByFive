<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/22
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>addQuestion</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>

<link rel="stylesheet" type="text/css" href="/css/exam/chcekExam/style.css" media="screen" />
<%--<link href="/css/exam/doExam/main.css" rel="stylesheet" type="text/css" />--%>
<link href="/css/exam/doExam/iconfont.css" rel="stylesheet" type="text/css" />
<link href="/css/exam/doExam/test.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/q_styles.css" />
<link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/style.css"/>
<link rel="stylesheet" type="text/css" href="/css/exam/addQuestion/bootstrap.min.css" />
<script src="/js/exam/addQuestion/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/exam/addQuestion/bootbox.min.js"></script>

<style>
    #header h1{
        text-align: center;
        margin: 2em auto;
        font-family: 方正粗黑宋简体;
    }

    h3{
        text-align: center;
        margin: .3em auto;
        font-family: 隶书;
    }

    #header{
        position: relative;
    }

    #clock{
        position:absolute;
        right: 5%;
        top:50%;
        transform: translateY(-50%);
    }


    td{
        white-space:nowrap;
        text-overflow:ellipsis;
        max-width: 140px;
        overflow: hidden;
    }

    html>body #footer {
        margin-left: 0px;
        margin-right: 0px;
    }

    .option{
        background-color: inherit;
    }
</style>

<!-- Begin Wrapper -->
<div id="wrapper">
    <!-- Begin Header -->
    <div id="header">
        <h1 id="h1">新增试题</h1>
        <div id='clock'></div>
    </div>
    <!-- End Header -->
    <!-- Begin Faux Columns -->
    <div id="faux">
        <!-- Begin Left Column -->
        <div id="leftcolumn">
            <div class="content">
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
                <!--添加按钮及bootstrap的模态框-->
                <div class="export">
                    <button id="new_add" type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                            data-target="#renyuan">
                        <img src="/images/exam/addQuestion/add_two.png" />
                        <span>添加</span>
                    </button>
                    <div class="modal fade" id="renyuan">
                        <div class="modal-dialog modal-lg modal_position">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">添加</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <table id="xztb" class="table">
                                        <!--新修改弹窗的样式-->
                                        <tbody>
                                        <tr>
                                            <td class="tb_bg">
                                                <label >
                                                    题型
                                                </label>
                                            </td>
                                            <td>
                                                <select class="form-control select_down type"
                                                        style="font-size: 13px; color: #666;">
                                                    <option selected value="单选题">单选题</option>
                                                    <option value="多选题">多选题</option>
                                                </select>
                                            </td>
                                            <td class="tb_bg"><label >
                                                <font style="font-size: 14px; color: red;">*</font>题类
                                            </label>
                                            </td>
                                            <td><input class="kind" type="text" placeholder="请输入题目类型"></td>
                                        </tr>
                                        <tr>
                                            <td class="tb_bg"><label >
                                                <font style="font-size: 14px; color: red;">*</font>题名
                                            </label>
                                            </td>
                                            <td><input class="question" type="text" placeholder="请输入问题" /></td>
                                            <td class="tb_bg">
                                                <label >
                                                    <font style="font-size: 14px; color: red;">*</font>答案
                                                </label></td>
                                            <td><input type="text" class="answer" placeholder="请输入答案" /></td>
                                        </tr>
                                        <tr>
                                            <td class="tb_bg">
                                                <label >解析</label>
                                            </td>
                                            <td><input placeholder="输入解析" class="analyzing" value="无"></td>
                                            <td class="tb_bg"><label >分值</label></td>
                                            <td>
                                                <select class="form-control select_down score"
                                                        style="font-size: 13px; color: #666;">
                                                    <option selected value="1分">1分</option>
                                                    <option value="1.5分">1.5分</option>
                                                    <option value="2分">2分</option>
                                                    <option value="3分">5分</option>
                                                    <option value="4分">10分</option>
                                                </select>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tb_bg"><label >选项</label></td>
                                            <td class="select">
                                                <select class="form-control select_down"
                                                        style="font-size: 13px; color: #666;">
                                                </select>
                                            </td>
                                            <td><a href="#" class="o_reset">重置</a></td>
                                            <td><input placeholder="输入要添加的选项内容" type="text" class='o_new'></td>
                                            <td><a href="#" class="o_add">添加</a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                    <button id="add_btn" type="button" class="btn btn-secondary">确定</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--表格列表-->
                <table id="tb" class="table">
                    <thead>
                    <tr>
                        <th>题型</th>
                        <th>题类</th>
                        <th>题名</th>
                        <th>选项</th>
                        <th>答案</th>
                        <th>解析</th>
                        <th>分值</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="show_tbody">
                    <tr>
                        <td>单选题</td>
                        <td>CSS</td>
                        <td>下列哪些不属于img标签的属性</td>
                        <td><select class="form-control select_down" style="font-size: 13px; color: #666;">
                            <option>A.alt</option>
                            <option>B.title</option>
                            <option>C.src</option>
                            <option>D.href</option>
                        </select>
                        </td>
                        <td>D</td>
                        <td>无</td>
                        <td>1分</td>
                        <td>
                            <a href="#" class="edit">编辑</a>
                            <a href="#" class="del">删除</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="clear"> </div>
        </div>
        <!-- End Left Column -->
        <!-- Begin Right Column -->
        <div id="rightcolumn">
            <div class="test_content_nr_tt">
                <font><span id="v_question"></span><span id="v_score"></span></font>
            </div>

            <div class="test_content_nr_main">
                <ul id="v_option">
                </ul>
            </div>
                <p style="font-size: 12px;font-family: 方正粗黑宋简体;padding-left:8px;"><span id="v_answer"></span></p>
                <p style="font-size: 12px;font-family: 隶书;padding-left:8px;"><span id="v_analyze"></span></p>
            <div class="clear"> </div>
        </div>
        <!-- End Right Column -->
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

    })
</script>
</body>
</html>
