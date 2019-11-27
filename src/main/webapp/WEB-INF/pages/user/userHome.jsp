<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/12
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
  <head>
    <title>userHome</title>
    <meta charset="UTF-8" />
  <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>
    <style>
        .main-banner {
            background: url("${user.background}") no-repeat center;
        }
    </style>
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link rel="stylesheet" href="/css/userHome/bootstrap.css">
    <link rel="stylesheet" href="/css/userHome/userHome.css" type="text/css" CHARSET="UTF-8">
    <link href="/css/userHome/font-awesome.css" rel="stylesheet">
    <link href="/css/cutPhoto/cutPhoto.css">
    <div id="home_left" next="0" now="-25%"></div>
    <img src="/images/userHome/left_button.png" id="home_left_buttom" draggable="false">
    
    <!-- mian-content -->
    <div class="main-banner" id="home" tid="${user.id}">
        <!--/banner-->
        <div class="banner-info">
            <div class="w3pvt-logo text-center">
                <h1><a href="#" onclick="return false;">${user.name}的主页</a></h1>
            </div>
            <div class="middile-inner-con">
                <div class="tab-main mx-auto">
                    <input id="tab1" type="radio" name="tabs" class="w3layouts-sm" checked>
                    <label for="tab1"><span class="fa fa-home" aria-hidden="true"></span>主页</label>
                    <input id="tab2" type="radio" class="w3layouts-sm" name="tabs">
                    <label for="tab2"><span class="fa fa-users" aria-hidden="true"></span> 关于</label>
                    <input id="tab3" type="radio" class="w3layouts-sm" name="tabs">
                    <label for="tab3"><span class="fa fa-files-o" aria-hidden="true"></span>贴子</label>
                    <input id="tab4" type="radio" class="w3layouts-sm" name="tabs">
                    <label for="tab4"><span class="fa fa-envelope" aria-hidden="true"></span> 笔记</label>
                    <section id="content1" class="inner-w3layouts-wrap">
                            <div class="admin"  style="background-image: url('${user.head}');"
                                     data-toggle="tooltip" data-title="双击更换头像" data-size="medium"
                                ></div>
                            <input type="file" accept="image/*" style="visibility: hidden;position: absolute;" id="imgInput">
                            <h4 ct="greet" contenteditable="true" data-toggle="tooltip" data-title="点击编辑">${user.greet}</h4>
                        <h2 ct="tagIntroduction" 
                            contenteditable="true" data-toggle="tooltip" data-title="点击编辑"
                        >${user.tagintroduction}</h2>
                        <p ct="introduction" contenteditable="true"
                            data-toggle="tooltip" data-title="点击编辑" >${user.introduction}</p>
                    </section>
                    <section id="content2" class="inner-w3layouts-wrap">
                        <h3 class="head-w3ls" ct="tagAbout" contenteditable="true"
                            data-toggle="tooltip" data-title="点击编辑"
                        >${user.tagabout}</h3>
                        <p ct="about" contenteditable="true"
                            data-toggle="tooltip" data-title="点击编辑"
                        >${user.about}</p>
                    </section>
                    <section id="content3" class="inner-w3layouts-wrap">
                        <h3 class="head-w3ls">See My Latest Works.</h3>
                        <div class="row news-grids text-center">
                            <div class="col-4 gal-img">
                                <%--todo--%>
                                <a href="#gal1"><img src="/images/userHome/default/g1.jpg" alt="news image" class="img-fluid"></a>
                                <a href="#gal2"><img src="/images/userHome/default/g3.jpg" alt="news image" class="img-fluid"></a>
                            </div>
                            <div class="col-4 gal-img">
                                <a href="#gal3"><img src="/images/userHome/default/g2.jpg" alt="news image" class="img-fluid"></a>
                                <a href="#gal4"><img src="/images/userHome/default/g4.jpg" alt="news image" class="img-fluid"></a>
                            </div>
                            <div class="col-4 gal-img">
                                <a href="#gal5"><img src="/images/userHome/default/g5.jpg" alt="news image" class="img-fluid"></a>
                                <a href="#gal6"><img src="/images/userHome/default/g6.jpg" alt="news image" class="img-fluid"></a>
                            </div>
                            <!-- popup-->
                        </div>
                    </section>
                    <section id="content4" class="inner-w3layouts-wrap">
                        <h3 class="head-w3ls"> Get In Touch</h3>
                        <form name="contact-form" class="contact-form" method="post" action="#">
                            <div class="row">
                                <div class="col-6 con-gd">
                                    <div class="form-group">
                                        <p>Name *</p>
                                        <input type="text" class="form-control" id="name" placeholder="" name="name" required="">
                                    </div>
                                    <div class="form-group">
                                        <p>Email *</p>
                                        <input type="email" class="form-control" id="email" placeholder="" name="email" required="">
                                    </div>
                                </div>
                                <div class="col-6 con-gd">
                                    <div class="form-group">
                                        <p>Send a Message *</p>
                                        <textarea name="Message" placeholder="" required=""></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </form>
                        <ul class="w3pvt_social_list list-unstyled mt-4">
                            <li>
                                <a href="#" class="w3layouts-icon">
                                    <span class="fa fa-facebook-f"></span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="w3layouts-icon">
                                    <span class="fa fa-twitter"></span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="w3layouts-icon">
                                    <span class="fa fa-dribbble"></span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="w3layouts-icon">
                                    <span class="fa fa-google-plus"></span>
                                </a>
                            </li>
                        </ul>
                    </section>

                </div>
                <!--// banner-inner -->
            </div>
        </div>
        <div class="copy-w3layouts-right text-center pb-3">
            <p>Copyright &copy; 2019.Lbb Yyq Fyw Dst All rights reserved.</p>
        </div>
    </div>
  <script type="text/javascript" src="/js/cutPhoto/cropbox.js"></script>
  <script type="text/javascript">
        $(function ($) {
            //hover提示
            $('[data-toggle="tooltip"]').jTippy({
                trigger:"hover",
                theme:"blue",
                size:"small"
            });

            //侧栏按钮
            $("#home_left_buttom").click(function(){
                if($("#home_left").is(":animated"))
                    return;
                var temp=$("#home_left").attr("next");
                $("#home_left").attr("next",$("#home_left").attr("now"));
                $("#home_left").attr("now",temp);
                $("#home_left").animate({
                    "left":temp
                },200);
            });

            //侧栏加载
            load($("#home_left"),"/admin/homeLeft","GET",true);
            //图片操作
            var cropper;
            if(true){
                $(".admin").addClass("waitEdit");
                $("#content1").on("dblclick",".waitEdit",inputImg);
                $("#content1").on("dblclick",".endEdit",subImg);
            }
            function inputImg(){
                $("#imgInput").click();
            }
            function subImg(){
                $(".admin").removeClass("endEdit");
                $(".admin").addClass("waitEdit");
                var src=cropper.getDataURL();
                cropper.ok();
                $(".admin").css('background-image','url(' + src+ ')');
                $.post("/admin/update",{
                    id:$(".main-banner").attr("tid"),
                    type:"head",
                    context:src
                });
            }
            $('#content1 input[type=file]').on('change', function(){
                var reader = new FileReader();
                reader.onload = function(e) {
                    var imgSrc = e.target.result;
                    cropper = $cropbox($('.admin'),imgSrc);
                };
                reader.readAsDataURL(this.files[0]);
                $(this).val("");
                $(".admin").removeClass("waitEdit");
                $(".admin").addClass("endEdit");
            });

            //main-banner  contenteditable="true"
            {
                var ob=[];
                var isOpen=function(type){
                     for (var i=0;i<ob.length;i++){
                         if(ob[i].attr("ct")==type)
                             return true;
                     }
                     return false;
                };
                var close=function(type){
                    for (var i=0;i<ob.length;i++){
                        if(ob[i].attr("ct")==type){
                            ob[i]=ob[ob.length-1];
                            ob.length-=1;
                            return;
                        }
                    }
                };

                $(".main-banner").on("input","[contenteditable=true]",function () {
                    var $user=$(this);
                    if(isOpen($user.attr("ct"))) return;
                    ob.push($user);
                    setTimeout(function () {
                        $.post("/admin/update",{
                            id:$(".main-banner").attr("tid"),
                            type:$user.attr("ct"),
                            context:$user.html()
                        });
                        close($user.attr("ct"));
                    },3000)
                })
            }
            $(window).bind("unload",function () {
                $(ob).each(function () {
                    $.post("/admin/update",{
                        id:$(".main-banner").attr("tid"),
                        type:this.attr("ct"),
                        context:this.html()
                    });
                })
            })
        });
    </script>
</body>
</html>