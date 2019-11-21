<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/20
  Time: 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>doExam</title>
	<%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>
<link href="/css/exam/doExam/main.css" rel="stylesheet" type="text/css" />
<link href="/css/exam/doExam/iconfont.css" rel="stylesheet" type="text/css" />
<link href="/css/exam/doExam/test.css" rel="stylesheet" type="text/css" />
<style>
	.hasBeenAnswer {
		background: #5d9cec;
		color:#fff;
	}

	.miss{
		background: red;
		color:#fff;
	}

</style>


<div class="main">
	<!--nr start-->
	<div class="test_main">
		<div class="nr_left">
			<div class="test">
				<form action="/exam/submitExam" method="post">
					<div class="test_title">
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
						</p>
						<font><input type="button" name="test_jiaojuan" value="交卷"></font>
					</div>

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
																id="0_answer_1_option_1" value="A"
															/>
														
														
														<label for="0_answer_1_option_1">
															A.
															<p class="ue" style="display: inline;">在工具栏中点击“workflow”标签</p>
														</label>
													</li>
												
													<li class="option">
														
															<input type="radio" class="radioOrCheck" name="answer1"
																id="0_answer_1_option_2" value="B"
															/>
														
														
														<label for="0_answer_1_option_2">
															B.
															<p class="ue" style="display: inline;">在缺陷单界面中点击“推进流程”按钮</p>
														</label>
													</li>
												
													<li class="option">
														
															<input type="radio" class="radioOrCheck" name="answer1"
																id="0_answer_1_option_3" value="C"
															/>
														
														
														<label for="0_answer_1_option_3">
															C.
															<p class="ue" style="display: inline;">在缺陷单界面中点击“提交”按钮</p>
														</label>
													</li>
												
													<li class="option">
														
															<input type="radio" class="radioOrCheck" name="answer1"
																id="0_answer_1_option_4" value="D"
															/>
														
														
														<label for="0_answer_1_option_4">
															D.
															<p class="ue" style="display: inline;">后台启动流程推进</p>
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
																id="1_answer_1_option_1" value="A"
															/>
														
														<label for="1_answer_1_option_1">
															A.
															<p class="ue" style="display: inline;">热爱祖国、热爱南网、热爱岗位</p>
														</label>
													</li>
												
													<li class="option">
														
														
															<input type="checkbox" class="radioOrCheck" name="answer1"
																id="1_answer_1_option_2" value="B"
															/>
														
														<label for="1_answer_1_option_2">
															B.
															<p class="ue" style="display: inline;">遵纪守法、忠于职守、令行禁止</p>
														</label>
													</li>
												
													<li class="option">
														
														
															<input type="checkbox" class="radioOrCheck" name="answer1"
																id="1_answer_1_option_3" value="C"
															/>
														
														<label for="1_answer_1_option_3">
															C.
															<p class="ue" style="display: inline;">客户至上、诚实守信、优质服务</p>
														</label>
													</li>
												
													<li class="option">
														
														
															<input type="checkbox" class="radioOrCheck" name="answer1"
																id="1_answer_1_option_4" value="D"
															/>
														
														<label for="1_answer_1_option_4">
															D.
															<p class="ue" style="display: inline;">公平竞争、互相监督、服从监管</p>
														</label>
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
					
				</form>
			</div>

		</div>
		<div class="nr_right">
			<div class="nr_rt_main">
				<div class="rt_nr1">
					<div class="rt_nr1_title">
						<h1>
							<i class="icon iconfont">&#xe692;</i>答题卡
						</h1>
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
						</p>
					</div>
					
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">60</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									
										<li><a href="#qu_0_0">1</a></li>
									
										<li><a href="#qu_0_1">2</a></li>
									
										<li><a href="#qu_0_2">3</a></li>
									
										<li><a href="#qu_0_3">4</a></li>
									
										<li><a href="#qu_0_4">5</a></li>
									
										<li><a href="#qu_0_5">6</a></li>
									
										<li><a href="#qu_0_6">7</a></li>
									
										<li><a href="#qu_0_7">8</a></li>
									
										<li><a href="#qu_0_8">9</a></li>
									
										<li><a href="#qu_0_9">10</a></li>
									
										<li><a href="#qu_0_10">11</a></li>
									
										<li><a href="#qu_0_11">12</a></li>
									
										<li><a href="#qu_0_12">13</a></li>
									
										<li><a href="#qu_0_13">14</a></li>
									
										<li><a href="#qu_0_14">15</a></li>
									
										<li><a href="#qu_0_15">16</a></li>
									
										<li><a href="#qu_0_16">17</a></li>
									
										<li><a href="#qu_0_17">18</a></li>
									
										<li><a href="#qu_0_18">19</a></li>
									
										<li><a href="#qu_0_19">20</a></li>
									
										<li><a href="#qu_0_20">21</a></li>
									
										<li><a href="#qu_0_21">22</a></li>
									
										<li><a href="#qu_0_22">23</a></li>
									
										<li><a href="#qu_0_23">24</a></li>
									
										<li><a href="#qu_0_24">25</a></li>
									
										<li><a href="#qu_0_25">26</a></li>
									
										<li><a href="#qu_0_26">27</a></li>
									
										<li><a href="#qu_0_27">28</a></li>
									
										<li><a href="#qu_0_28">29</a></li>
									
										<li><a href="#qu_0_29">30</a></li>
									
										<li><a href="#qu_0_30">31</a></li>
									
										<li><a href="#qu_0_31">32</a></li>
									
										<li><a href="#qu_0_32">33</a></li>
									
										<li><a href="#qu_0_33">34</a></li>
									
										<li><a href="#qu_0_34">35</a></li>
									
										<li><a href="#qu_0_35">36</a></li>
									
										<li><a href="#qu_0_36">37</a></li>
									
										<li><a href="#qu_0_37">38</a></li>
									
										<li><a href="#qu_0_38">39</a></li>
									
										<li><a href="#qu_0_39">40</a></li>
									
										<li><a href="#qu_0_40">41</a></li>
									
										<li><a href="#qu_0_41">42</a></li>
									
										<li><a href="#qu_0_42">43</a></li>
									
										<li><a href="#qu_0_43">44</a></li>
									
										<li><a href="#qu_0_44">45</a></li>
									
										<li><a href="#qu_0_45">46</a></li>
									
										<li><a href="#qu_0_46">47</a></li>
									
										<li><a href="#qu_0_47">48</a></li>
									
										<li><a href="#qu_0_48">49</a></li>
									
										<li><a href="#qu_0_49">50</a></li>
									
										<li><a href="#qu_0_50">51</a></li>
									
										<li><a href="#qu_0_51">52</a></li>
									
										<li><a href="#qu_0_52">53</a></li>
									
										<li><a href="#qu_0_53">54</a></li>
									
										<li><a href="#qu_0_54">55</a></li>
									
										<li><a href="#qu_0_55">56</a></li>
									
										<li><a href="#qu_0_56">57</a></li>
									
										<li><a href="#qu_0_57">58</a></li>
									
										<li><a href="#qu_0_58">59</a></li>
									
										<li><a href="#qu_0_59">60</a></li>
									
								</ul>
							</div>
						</div>
					
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>多选题</h2>
								<p>
									<span>共</span><i class="content_lit">30</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									
										<li><a href="#qu_1_0">1</a></li>
									
										<li><a href="#qu_1_1">2</a></li>
									
										<li><a href="#qu_1_2">3</a></li>
									
										<li><a href="#qu_1_3">4</a></li>
									
										<li><a href="#qu_1_4">5</a></li>
									
										<li><a href="#qu_1_5">6</a></li>
									
										<li><a href="#qu_1_6">7</a></li>
									
										<li><a href="#qu_1_7">8</a></li>
									
										<li><a href="#qu_1_8">9</a></li>
									
										<li><a href="#qu_1_9">10</a></li>
									
										<li><a href="#qu_1_10">11</a></li>
									
										<li><a href="#qu_1_11">12</a></li>
									
										<li><a href="#qu_1_12">13</a></li>
									
										<li><a href="#qu_1_13">14</a></li>
									
										<li><a href="#qu_1_14">15</a></li>
									
										<li><a href="#qu_1_15">16</a></li>
									
										<li><a href="#qu_1_16">17</a></li>
									
										<li><a href="#qu_1_17">18</a></li>
									
										<li><a href="#qu_1_18">19</a></li>
									
										<li><a href="#qu_1_19">20</a></li>
									
										<li><a href="#qu_1_20">21</a></li>
									
										<li><a href="#qu_1_21">22</a></li>
									
										<li><a href="#qu_1_22">23</a></li>
									
										<li><a href="#qu_1_23">24</a></li>
									
										<li><a href="#qu_1_24">25</a></li>
									
										<li><a href="#qu_1_25">26</a></li>
									
										<li><a href="#qu_1_26">27</a></li>
									
										<li><a href="#qu_1_27">28</a></li>
									
										<li><a href="#qu_1_28">29</a></li>
									
										<li><a href="#qu_1_29">30</a></li>
									
								</ul>
							</div>
						</div>
					
				</div>

			</div>
		</div>
	</div>
	<!--nr end-->
	<div class="foot"></div>
</div>

<%--<script src="/js/jquery-1.11.3.min.js"></script>--%>
<script src="/js/exam/doExam/jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="/js/exam/doExam/jquery.countdown.js"></script>
<script>
	window.jQuery(function($) {
		"use strict";
		
		$('time').countDown({
			with_separators : false
		});
		$('.alt-1').countDown({
			css_class : 'countdown-alt-1'
		});
		$('.alt-2').countDown({
			css_class : 'countdown-alt-2'
		});
		
	});
	
	
	$(function() {
		$('li.option label').click(function() {

			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a').filter(function () {
				if($(this).attr('href')=='#'+examId) return true;
				return  false;
			}); // 根据题目ID找到对应答题卡
			// 设置已答题

			// console.log($('#'+$(this).attr("for")).val());

			var examInput=$('#'+$(this).attr("for"));
			var type=examInput.attr('type');
			var name=examInput.attr('name');
			var input=$("input[name="+name+"][type="+type+"]");

			$(this).find('p').addClass('error');


			console.log(input.filter(':checked').val());

			if(!cardLi.hasClass('hasBeenAnswer')){
				cardLi.addClass('hasBeenAnswer');
			}

			$('input[type=button][name=test_jiaojuan]').click(function () {
				console.log($('form').serialize());
				$('form').submit();
			});
			
		});
	});
</script>

</body>
</html>
