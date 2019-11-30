<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/28
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css'>
<style>
    .top_left {
        position: absolute;
        margin: auto;
        top: 5%;
        right:5%;
    }

    .menu {
        width: 40px;
        height: 40px;
    }

    .item {
        position: absolute;
        left: 0px;
        top: 0px;
        width: 40px;
        height: 32px;
        background-color: white;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        border-radius: 50%;
        cursor: pointer;
        text-align: center;
        margin: 0 auto;
        padding-top: 8px;
    }

    i {
        font-size: 24px;
        color: #222222;
    }
</style>

<div class="top_left menu">
    <div id="myMenu"></div>
</div>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/anime.js"></script>
<script src="/js/index.js"></script>
<script>
    setTimeout(function () {
        $('.item:eq(2)').click(function () {
            window.location.href='/com/index';
        });
        $('.item:eq(0)').click(function () {
            window.location.href='/note/toEdit';
        });
        $('.item:eq(1)').click(function () {
            window.location.href='/exam/index';
        });
        $('.item:eq(3)').click(function () {
            window.location.href='/blog/index';
        });

        $('.item:eq(4)').click(function () {
            window.location.href='/admin/index';
        });
        $('.item:eq(5)').dblclick(function () {
            window.location.href='/index.jsp';
        })
    },2000);

</script>
