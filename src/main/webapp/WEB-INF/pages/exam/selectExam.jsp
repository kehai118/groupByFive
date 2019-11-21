<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/20
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>selectExam</title>
    <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>
    <link  rel="stylesheet" href="/css/exam/selectBeautify.css">
    <script type="text/javascript" src="/js/exam/selectBeautify.js"></script>
    <style>

        #selectExam h2{
            margin:1.5em auto;
            text-align: center;
        }
        #selectExam p{
            margin: 0.8em auto;
            text-align: center;
        }

        #selectExam button{
            margin:3em auto;
            width: 120px;
            height: 40px;
        }

        #toStartExam .content h2{
            text-align: center;
            margin: 3em auto;
        }

        #toStartExam .content p{
            margin: 0.8em auto;
            text-align: center;
            font-family: 华文细黑;
        }

        #toStartExam footer {
            padding: 0;
        }

        #toStartExam footer button {
            width: 50%;
            float: left;
            height: 8%;
            margin: 0;
            border-radius: 0 0 0 .4em;
            background-color: #ff7878;
            color: #fff;
        }

        #toStartExam footer button[data-modal-btn="action"] {
            width: 50%;
            background-color: #5675c7;
            border-radius: 0 0 .4em 0;
        }
    </style>
    <div id="selectExam">
        <h2>请选择要进行的考试考试</h2>
        <p><select>
            <c:forEach var="item" items="${list}">
                <option>${item}</option>
            </c:forEach>
        </select></p>
        <button class="magicBtn round">确定</button>
    </div>

    <script type="text/javascript">

        $(function($){

            $.magicBtn('#selectExam',{
                buttonType: 'outline',
                rounded: true,
                fill: true
            });

            var selectBtn = 'true';

            var css = new MODALit({
                el: '#selectExam button',
                width: 'large',
                cancel:{
                    label:'确定',
                    fn:function(){
                        $('#selectExam button').startLoading({
                            loadindText: 'Loading...',
                            loadingIcon: true,
                        });
                        setTimeout(function () {
                            window.location.href='/exam/doExam?index='+$('#selectExam select').val();
                        },1000)
                    }
                },
                action:{
                    label:'返回',
                    fn:function(){this.hide();}
                },
                transition: 'flip',
                content:'<h2>考前须知<h2>' +
                    '<p>本次考试共n道题目，总分100分。答题时间为120分钟。</p>' +
                    '<p>答题过程中不准离开考试界面，否则视为自动提交。</p>' +
                    '<p>考试即将开始，请自觉遵守考场纪律，确定进入考试；取消返回选择</p>',
            });

            css.modal.id='toStartExam';

            var $myselect =$('#selectExam select');
            /**
             * 初始化插件
             */
            $myselect.goSelectInput({
                height: 40,
                width: 300
            });

        })



    </script>

</body>
</html>
