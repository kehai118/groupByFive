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
  <h3>姓名:lbb  成绩:79  总分:120</h3>
</div>
<!--//end #header//-->
<div id="centerColumn" class="clearfix">
  <div id="rightColumn">

  </div>
  <!--//end #rightColumn//-->
  <%--<h2>centerColumn</h2>
  <p>Augur et fulgente decorus arcu Phoebus acceptusque novem Camenis, qui salutari levat arte fessos corporis artus, si Palatinas videt aequos aras remque Romanam Latiumque felix alterum in lustrum meliusque semper prorogat aevom, quaeque Aventinum tenet Algidumque, quindecim Diana preces virorum curat et votis puerorum amicas adplicat auris.</p>
  <h2>Header 2</h2>
  <p><a href="#">Link Item</a></p>
  <ul>
    <li>List Item</li>
    <li>List Item</li>
    <li>List Item
      <ul>
        <li>List Item</li>
        <li>List Item</li>
      </ul>
    </li>
  </ul>--%>
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
<!--//end #centerColumn//-->
<div id="footer">Copyright &copy; - LBB YYQ FYW DST</div>
<!--//end #footer//-->

<script type="text/javascript">
   $('.test_content_nr_main').hover(function () {
      $('#rightColumn').html($(this).find('.dpn').text());
   },function () {
      $('#rightColumn').html("");
   })
</script>
</body>
</html>
