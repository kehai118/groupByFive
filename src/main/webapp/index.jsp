<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--
COPYRIGHT by HighHay/Mivfx
Before using this theme, you should accept themeforest licenses terms.
http://themeforest.net/licenses
-->

<html class="no-js" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">

    <!-- Page Title Here -->
    <title>在线考试系统</title>

    <!-- Page Description Here -->
    <meta name="description" content="A responsive coming soon template, un template HTML pour une page en cours de construction">

    <!-- Disable screen scaling-->
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, user-scalable=0">

    <!-- Place favicon.ico and apple-touch-icon(s) in the root directory -->

    <!-- Initializer -->
    <link rel="stylesheet" href="/others/forIndexHome/css/normalize.css">

    <!-- Web fonts and Web Icons -->
    <link rel="stylesheet" href="/others/forIndexHome/css/pageloader.css">
    <link rel="stylesheet" href="/others/forIndexHome/fonts/opensans/stylesheet.css">
    <link rel="stylesheet" href="/others/forIndexHome/fonts/asap/stylesheet.css">
    <link rel="stylesheet" href=" https://cdn.bootcss.com/ionicons/1.5.2/css/ionicons.min.css">

    <!-- Vendor CSS style -->
    <link rel="stylesheet" href="/others/forIndexHome/css/foundation.min.css">
    <link rel="stylesheet" href="/others/forIndexHome/js/vendor/jquery.fullPage.css">
    <link rel="stylesheet" href="/others/forIndexHome/js/vegas/vegas.min.css">

    <!-- Main CSS files -->
    <link rel="stylesheet" href="/others/forIndexHome/css/main.css">
    <link rel="stylesheet" href="/others/forIndexHome/css/main_responsive.css">
    <link rel="stylesheet" href="/others/forIndexHome/css/style-font1.css">

    <script src="/others/forIndexHome/js/vendor/modernizr-2.7.1.min.js"></script>
</head>
<body id="menu" class="alt-bg">
<!--[if lt IE 8]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Site config : put launching date here
     data-date="01/31/2015 23:00:00"        Launching date
     data-date-timezone="+0"                Lanching date time zone
-->



<!-- Page Loader -->
<div class="page-loader" id="page-loader">
    <div><i class="ion ion-loading-d"></i><p>loading</p></div>
</div>

<!-- BEGIN OF site header Menu -->
<!-- Add "material" class for a material design style -->
<header class="header-top">
    <!--		<header class="header-top material">-->
    <div class="logo">
        <a href="#home">
            <img src="/others/forIndexHome/img/logo_large.png" alt="Logo Brand">
        </a>
    </div>
    <div class="menu clearfix">
        <a href="#about-us">about</a>
        <!-- Add other menu similar to "about" here -->
        <a href="#contact">contact</a>
    </div>
</header>
<!-- END OF site header Menu-->

<!-- BEGIN OF Quick nav icons at left -->
<nav class="quick-link count-6 nav-left">
    <ul id="qmenu">
        <li data-menuanchor="home">
            <a href="/admin/index" class=""><i class="icon ion ion-home"></i>
            </a>
            <span class="title">个人主页</span>
        </li>
        <li data-menuanchor="when">
            <a href="/exam/index" class=""><i class="icon ion ion-android-alarm"></i>
            </a>
            <span class="title">考试</span>
        </li>
        <li data-menuanchor="register">
            <a href="/note/toEdit"><i class="icon ion-document-text ion"></i>
            </a>
            <span class="title">笔记</span>
        </li>
        <li data-menuanchor="about-us">
            <a href="/com/index"><i class="icon ion ion-chatboxes"></i></a>
            <span class="title">聊天</span>
        </li>
        <li data-menuanchor="contact">
            <a href="/bolg/index"><i class="icon ion-beer ion"></i>
            </a>
            <span class="title">论坛</span>
        </li>
        <li data-menuanchor="contact">
            <a href="/admin/managerLogin"><i class="icon social-foursquare ion"></i>
            </a>
            <span class="title">管理员登录</span>
        </li>
    </ul>
</nav>
<!-- END OF Quick nav icons at left -->



<!-- BEGIN OF site cover -->
<div class="page-cover" id="home">
    <!-- Cover Background -->
    <div class="cover-bg pos-abs full-size bg-img" data-image-src="/others/forIndexHome/img/bg-default.jpg"></div>

    <!-- BEGIN OF Slideshow Background -->
    <div class="cover-bg pos-abs full-size slide-show">
        <i class='img' data-src='/others/forIndexHome/img/bg-slide1.jpg'></i>
        <i class='img' data-src='/others/forIndexHome/img/bg-slide2.jpg'></i>
        <i class='img' data-src='/others/forIndexHome/img/bg-slide3.jpg'></i>
        <i class='img' data-src='/others/forIndexHome/img/bg-slide4.jpg'></i>
    </div>
    <!-- END OF Slideshow Background -->

    <!--BEGIN OF Static video bg  - uncomment below to use Video as Background-->
    <!--<div id="container" class="video-container show-for-medium-up">
        <video autoplay="autoplay" loop="loop" autobuffer="autobuffer" muted="muted"
               width="640" height="360">
            <source src="vid/flower_loop.mp4" type="video/mp4">
        </video>
    </div>-->
    <!--END OF Static video bg-->

    <!-- Solid color as filter or as background -->
    <div class="cover-bg pos-abs full-size bg-color" data-bgcolor="rgba(51, 2, 48, 0.12)"></div>

</div>
<!--END OF site Cover -->

<!-- BEGIN OF site main content content here -->
<main class="page-main" id="mainpage">

    <!-- Begin of home page -->
    <div class="section page-home page page-cent" id="s-home">
        <!-- Logo -->
        <div class="logo-container">
            <img class="h-logo" src="/others/forIndexHome/img/logo_only.png" alt="Logo">
        </div>
        <!-- Content -->
        <section class="content">

            <header class="header">
                <div class="h-left">
                    <h2> 在线 <strong>考试系统</strong></h2>
                </div>
                <div class="h-right">
                    <h3>LBB<br>YYQ<br>FYW<br>DST</h3>
                    <h4 class="subhead"><a href="#when">第二阶段项目</a></h4>
                </div>
            </header>
        </section>

        <!-- Scroll down button -->
        <footer class="p-footer p-scrolldown">
            <a href="#when">
                <div class="arrow-d">
                    <div class="before">主页</div>
                    <div class="after">考试</div>
                    <div class="circle"></div>
                </div>
            </a>
        </footer>
    </div>
    <!-- End of home page -->

    <!-- Begin of timer page -->
    <div class="section page-when page page-cent" id="s-when">
        <section class="content">
            <div class="clock clock-countdown">
                <div class="site-config"
                     data-date="29/11/2019 8:00:00"
                     data-date-timezone="+0"
                ></div>
                <header class="header">
                    考试 <strong>到计时</strong>
                </header>
                <div class="elem-left">
                    <div class="digit minutes">00</div>
                    <div class="text">分</div>
                </div>
                <div class="elem-center">
                    <!-- Optional text at top or image logo -->
                    <!--<span class="text top">here in</span>-->
                    <!-- Optional logo at top -->
                    <span class="text top"><img class="img" alt="Logo" src="/others/forIndexHome/img/logo_large.png"></span>
                    <div class="digit hours">000</div>
                    <div class="text">时间</div>
                </div>
                <div class=" elem-right">
                    <div class="digit seconds">00</div>
                    <div class="text">秒</div>
                </div>

                <!-- second knob here -->
                <div class="second">
                    <input class="knob container"
                           id="second-knob"
                           data-width="400"
                           data-height="400"
                           data-displayInput=false
                           data-fgColor="#fff"
                           data-bgColor="rgba(255,255,255,0)"
                           data-thickness=".07"
                           value="0"
                           data-displayPrevious=true
                           data-max="6000"
                    />
                </div>
            </div>

        </section>
        <footer class="p-footer p-scrolldown">
            <a href="#register">
                <div class="arrow-d">
                    <div class="before">考试</div>
                    <div class="after">笔记</div>
                    <div class="circle"></div>
                </div>
            </a>
        </footer>
    </div>
    <!-- End of timer page -->

    <!-- Begin of register page -->
    <div class="section page-register page page-cent " id="s-register">
        <section class="content">
            <header class="p-title">
                <h3>笔记 <i class="ion ion-compose"></i></h3>
            </header>
            <div>
                <form id="mail-subscription" class="form magic send_email_form" method="get" action="ajaxserver/serverfile.php">
                    <p class="invite center">记录每时每刻的学习：</p>
                    <div class="fields clearfix">
                        <div class="input">
                            <label for="reg-email">笔记 </label>
                            <input id="reg-email" class="email_f"  name="email" type="text" required placeholder="e=mc2" data-validation-type="text"></div>
                        <div class="buttons">
                            <button id="submit-email" class="button email_b" name="submit_email" onclick="window.location.href='/note/edit'">保存</button>
                        </div>
                    </div>

                    <p class="email-ok invisible"><strong>笔记</strong>保存成功.</p>
                </form>
            </div>
        </section>
        <footer class="p-footer p-scrolldown">
            <a href="#about-us">
                <div class="arrow-d">
                    <div class="before">笔记</div>
                    <div class="after">交友</div>
                    <div class="circle"></div>
                </div>
            </a>
        </footer>
    </div>
    <!-- End of register page -->

    <!-- Begin of about us page -->
    <div class="section page-about page page-cent" id="s-about-us">
        <section class="content">
            <header class="p-title">
                <h3>交友<i class="ion ion-android-information">
                </i>
                </h3>
                <h2>在线<span class="bold">交友</span><span class="bold">学习</span></h2>
            </header>
            <article class="text">
                <p>一个人学习效率低，这里不会那里不会？</p>
                <p>在线求助好友！！！</p>
            </article>
        </section>
        <footer class="p-footer p-scrolldown">
            <a href="#contact">
                <div class="arrow-d">
                    <div class="before">Contact</div>
                    <div class="after">Message</div>
                    <div class="circle"></div>
                </div>
            </a>
        </footer>
    </div>
    <!-- End of about us page -->

    <!-- Begin of Contact page   -->
    <div class="section page-contact page page-cent  bg-color" data-bgcolor="rgba(95, 25, 208, 0.88)s" id="s-contact">
        <!-- Begin of contact information -->
        <div class="slide" id="information" data-anchor="information">
            <section class="content">
                <header class="p-title">
                    <h3>Contact<i class="ion ion-location">
                    </i>
                    </h3>
                    <ul class="buttons">
                        <li class="show-for-medium-up">
                            <a title="About" href="#about-us" ><i class="ion ion-android-information"></i></a>
                        </li>
                        <!--<li>
                            <a title="Contact" href="#contact/information"><i class="ion ion-location"></i></a>
                        </li>-->
                        <li>
                            <a title="Message" href="#contact/message"><i class="ion ion-email"></i></a>
                        </li>
                    </ul>
                </header>
                <!-- Begin Of Page SubSction -->
                <div class="contact">
                    <div class="row">
                        <div class="medium-6 columns left">
                            <ul>
                                <li>
                                    <h4>Email</h4>
                                    <p><a href="mailto://contact@mail.com">contactemail@mail.com</a></p>
                                </li>
                                <li>
                                    <h4>Address</h4>
                                    <p>99 Location Street
                                        <br>Antartica SP</p>
                                </li>
                                <li>
                                    <h4>Phone</h4>
                                    <p>+999 123 456 89</p>
                                </li>
                            </ul>
                        </div>
                        <div class="medium-6 columns social-links right">
                            <ul>

                                <!-- legal notice -->
                                <li class="show-for-medium-up">
                                    <h4>Website</h4>
                                    <p><a href="http://www.jq22.com">www.jq22.com</a></p>
                                </li>
                                <li  class="show-for-medium-up">
                                    <h4>Find us on</h4>
                                    <!-- Begin of Social links -->
                                    <div class="socialnet">
                                        <a href="#"><i class="ion ion-social-facebook"></i></a>
                                        <a href="#"><i class="ion ion-social-instagram"></i></a>
                                        <a href="#"><i class="ion ion-social-twitter"></i></a>
                                        <a href="#"><i class="ion ion-social-pinterest"></i></a>
                                        <a href="#"><i class="ion ion-social-tumblr"></i></a>
                                    </div>
                                    <!-- End of Social links -->
                                </li>
                                <li>
                                    <p><img src="/others/forIndexHome/img/logo_large.png" alt="Logo" class="logo"></p>
                                    <p class="small">Bientot by <strong><a href="http://highhay.com">Brand</a></strong>. All right reserved 2015</p>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>
                <!-- End of page SubSection -->
            </section>
        </div>
        <!-- end of contact information -->

        <!-- begin of contact message -->
        <div class="slide" id="message" data-anchor="message">
            <section class="content">
                <header class="p-title">
                    <h3>Write to us<i class="ion ion-email">
                    </i>
                    </h3>
                    <ul class="buttons">
                        <li class="show-for-medium-up">
                            <a title="About" href="#about-us"><i class="ion ion-android-information"></i></a>
                        </li>
                        <li>
                            <a title="Contact" href="#contact/information"><i class="ion ion-location"></i></a>
                        </li>
                        <!--<li>
                            <a title="Message" href="#contact/message"><i class="ion ion-email"></i></a>
                        </li>-->
                    </ul>
                </header>
                <!-- Begin Of Page SubSction -->

                <div class="page-block c-right v-zoomIn">
                    <div class="wrapper">
                        <div>
                            <form class="message form send_message_form" method="get" action="ajaxserver/serverfile.php">
                                <div class="fields clearfix">
                                    <div class="input">
                                        <label for="mes-name">Name </label>
                                        <input id="mes-name" name="name" type="text" placeholder="Your Name" required></div>
                                    <div class="buttons">
                                        <button id="submit-message" class="button email_b" name="submit_message">Ok</button>
                                    </div>
                                </div>
                                <div class="fields clearfix">
                                    <div class="input">
                                        <label for="mes-email">Email </label>
                                        <input id="mes-email" type="email" placeholder="Email Address" name="email" required>
                                    </div>
                                </div>
                                <div class="fields clearfix no-border">
                                    <label for="mes-text">Message </label>
                                    <textarea id="mes-text" placeholder="Message ..." name="message" required></textarea>

                                    <div>
                                        <p class="message-ok invisible">Your message has been sent, thank you.</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- End Of Page SubSction -->
            </section>

        </div>
        <!-- End of contact message -->
    </div>
    <!-- End of Contact page  -->

</main>

<!-- END OF site main content content here -->

<!-- Begin of site footer -->
<footer class="page-footer">
			<span>Find us on
				<a href="#" ><i class="ion icon ion-social-facebook"></i></a>
				<a href="#" ><i class="ion icon ion-social-instagram"></i></a>
				<a href="#" ><i class="ion icon ion-social-twitter"></i></a>
			</span>
</footer>
<!-- End of site footer -->


<!--        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->

<!-- All Javascript plugins goes here -->
<script src="/others/forIndexHome/js/vendor/jquery-1.11.2.min.js"></script>
<!-- All vendor scripts -->
<script src="/others/forIndexHome/js/vendor/all.js"></script>

<!-- Detailed vendor scripts -->
<!--<script src="/others/forIndexHome/js/vendor/jquery.fullPage.min.js"></script>
<script src="/others/forIndexHome/js/vendor/jquery.slimscroll.min.js"></script>
<script src="/others/forIndexHome/js/vendor/jquery.knob.min.js"></script>
<script src="/others/forIndexHome/js/vegas/vegas.min.js"></script>
<script src="/others/forIndexHome/js/jquery.maximage.js"></script>
<script src="/others/forIndexHome/js/okvideo.min.js"></script>-->

<!-- Downcount JS -->
<script src="/others/forIndexHome/js/jquery.downCount.js"></script>

<!-- Form script -->
<script src="/others/forIndexHome/js/form_script.js"></script>

<!-- Javascript main files -->
<script src="/others/forIndexHome/js/main.js"></script>


<!-- Google Analytics: Uncomment and change UA-XXXXX-X to be your site"s ID. -->
<!--<script>
    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
    function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
    e=o.createElement(i);r=o.getElementsByTagName(i)[0];
    e.src="//www.google-analytics.com/analytics.js";
    r.parentNode.insertBefore(e,r)}(window,document,"script","ga"));
    ga("create","UA-XXXXX-X");ga("send","pageview");
</script>-->
</body>
</html>
