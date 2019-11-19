<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/19
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
    <title>Home</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>
    <%@include file="/WEB-INF/commonRel.jsp"%>
</head>

<body>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="/css/user/lr-style.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link rel="stylesheet" href="https://www.jq22.com/jquery/font-awesome.4.7.0.css">

    <link rel="stylesheet" href="/css/user/loginAndRegister.css">

<!-- bg effect -->
<div id="bg">
    <canvas></canvas>
    <canvas></canvas>
    <canvas></canvas>
</div>
<!-- //bg effect -->
<!-- title -->
<h1 id="rltitle">登录</h1>
<!-- //title -->

<!-- content -->
    <div id="wrapper" class="login-page">
        <div id="login_form" class="form">
            <form class="register-form">
                <input type="text" placeholder="用户名" id="r_user_name"/>
                <input type="password" placeholder="密码" id="r_password" />
                <input type="text" placeholder="电子邮件" id="r_emial"/>
                <button id="create">创建账户</button>
                <p class="message">已经有了一个账户? <a href="#">立刻登录</a></p>
            </form>
            <form class="login-form">
                <input type="text" placeholder="用户名" id="user_name"/>
                <input type="password" placeholder="密码" id="password"/>
                <button id="login">登　录</button>
                <p class="message">还没有账户? <a href="#">立刻创建</a></p>
            </form>
        </div>
    </div>

    <!-- //content -->




<!-- copyright -->
<div class="footer">
    <p>Copyright &copy; 2019.lbb yyq fyw dst All rights reserved.</p>
</div>
<!-- //copyright -->


<!-- effect js -->
<script src="/js/user/canva_moving_effect.js"></script>
<!-- //effect js -->
<script src="/js/user/loginAndRegister.js"></script>
<script type="text/javascript">
    $(function ($){
        $("#create").click(function(){
            check_register();
            return false;
        });
        $("#login").click(function(){
            check_login();
            return false;
        });
        $('.message a').click(function () {
            $('form').animate({
                height: 'toggle',
                opacity: 'toggle'
            }, 'slow');


            if($('#rltitle').text()=="登录"){
                $('#rltitle').text("注册");
            }else {
                $("#rltitle").text("登录");
            }
        });
    })
</script>


</body>


</html>