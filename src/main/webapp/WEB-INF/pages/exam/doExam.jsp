<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<div action="/exam/submitExam" method="post">
					<div class="test_title">
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">${exam.totalTime}</b>
						</p>
						<font><input type="button" name="test_jiaojuan" value="交卷" id="submitAnswer"></font>
					</div>
					<div id="question">
					</div>
						<script>
							$(function ($) {
								load("#question","/exam/loadPaper?id=${paper.id}&type=1")
							})
						</script>
				</div>
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
							<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">${exam.totalTime}</b>
						</p>
					</div>
					
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">${paper.radioLength}</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<c:forEach items="${paper.radioQuestion}" var="it" varStatus="vs">
										<li><a href="#${it.id}">${vs.count}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>多选题</h2>
								<p>
									<span>共</span><i class="content_lit">${paper.checkBoxLength}</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<c:forEach items="${paper.checkBoxQuestion}" var="it" varStatus="vs">
										<li><a href="#${it.id}">${vs.count}</a></li>
									</c:forEach>
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
		
		$('time').countDown({
			with_separators : false
		});
		$('.alt-1').countDown({
			css_class : 'countdown-alt-1'
		}).one('finish.countdown',submitAnswer);

		window.onbeforeunload =submitAnswer;

		$('.alt-2').countDown({
			css_class : 'countdown-alt-2'
		});
		
	});

	var down=4;

    function submitAnswer(){
        var answer=[];
        $(".test_content_nr>ul>li").each(function () {
            var ans="";
            $(this).find('input:checked').each(function () {
                ans+=$(this).val();
            });
            answer.push(ans);
        });

		var result='('+answer.join(",")+')';
		$('#modalCss').remove();
		var css=new MODALit({
			el:"#hiddenBtn",
			content:'<p style="text-align: center;font-size:40px;font-family: 华文楷体">提交中<i class="fa fa-spinner fa-pulse"></i></p>',
			width: 'large',
			footer: false,
			transition: 'flip'
		});
		css.modal.id = "modalCss";

		$('#hiddenBtn').click();

        $.post("/exam/submitExam",{
			examId:${exam.id},
			answer:result
		},function (e) {
			if(e>-1){
				submitAnswer=function () {};
				setTimeout(function () {
					window.location.href='/exam/checkExam?examId='+e;
				},2000)
			}
		})
    }
	
	
	$(function() {
        $('#submitAnswer').click(submitAnswer);

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

			if(!cardLi.hasClass('hasBeenAnswer')){
				cardLi.addClass('hasBeenAnswer');
			}
		});
	});
</script>
<div id="hiddenBtn" style="display: none"></div>
</body>
</html>
