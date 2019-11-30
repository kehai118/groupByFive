<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"  pageEncoding="UTF-8" contentType="text/html;UTF-8" isErrorPage="false" %>
<html>
<head>
<meta charset="utf-8">
<title>QQ首页</title>

</head>
<style>

  *::-webkit-scrollbar{

    width:0;

  }
</style>
<body>

<link href="/others/forChatIndex/css/style.css" rel="stylesheet" type="text/css">
<!--<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>-->
<%--<script src="http://cdn.bootcss.com/jquery/2.1.0/jquery.js"></script>--%>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/others/forChatIndex/js/index.js"></script>
<script src="/others/forChatIndex/js/superslide.2.1.js"></script>
<script src="/others/forChatIndex/js/nicescroll.js"></script>

<!--<div class="qq-exe"><img src="images/QQ-ICON.png"><input type="text.html" value="腾讯QQ" placeholder="腾讯QQ"></div>-->
<!--背景图片-->
<div class="win-bg"><img src="/others/forChatIndex/images/img/2.jpg"></div>

<div class="qq-login" id="drag">
  <div class="login-menu">
    <span></span><span></span><span class="login-close"></span>
  </div>
  <div class="login-ner">
    <div class="login-left">
      <div class="login-head"><img src="/others/forChatIndex/images/login/head.jpg"></div>
    </div>
  <%--<div class="login-on">
   &lt;%&ndash;     <div class="login-txt">
          <span style="color: red">${user}</span>
          <input type="text" placeholder="QQ号码" name="account" id="account">
          <input type="password" name="password" placeholder="密码" id="password">
        </div>
        <div class="login-xuan"><span class="fl"><input type="checkbox"><i>记住密码</i></span><span class="fr"><input type="checkbox"><i>自动登录</i></span></div>
        &lt;%&ndash;<div class="login-but dr">安全登录</div>&ndash;%&gt;
        <div><input type="submit"  value="安全登录" style="width:100%;height:30px;margin:13px 0;float:left;
        background:#09a3dc;color:#fff;text-align:center;line-height:30px;border-radius:4px;font-size:14px;
        cursor:context-menu">
        </div>&ndash;%&gt;
   </div>
    <div class="login-right">
      <a href="http://zc.qq.com/chs/index.html" target="_blank">注册账号</a><a href="https://aq.qq.com/cn2/findpsw/pc/pc_find_pwd_input_account?pw_type=0&aquin=" target="_blank">找回密码</a>
    </div>--%>
  </div>
</div>

<div class="qq" id="dst-qq">
  <div class="qq-top" >
    <div class="qq-top-icon">
      <i><img src="/others/forChatIndex/images/qq-top.png"></i>
      <span class="qq-top-02 close"><img src="/others/forChatIndex/images/qq-top-02.png"></span>
      <span class="qq-top-01 min"><img src="/others/forChatIndex/images/qq-top-01.png"></span>
    </div>
    <div class="qq-top-name">
      <span>${user.name}</span>
      <dl><dd><img src="/others/forChatIndex/images/zai.png"></dd><dt><img src="/others/forChatIndex/images/lv.png"></dt><dt><img src="/others/forChatIndex/images/svip.png"></dt></dl>
    </div>
    <div class="qq-top-shuo"><input type="text" value="这两天空间被各种婚礼刷屏了"></div>
    <div class="qq-top-menu">
      <ul>
        <li></li><li></li><li></li><li></li>
      </ul>
      <span class="qq-top-001"></span>
      <span class="qq-top-002"></span>
    </div>
    <div class="qq-serch"><input type="text" class="one"  placeholder="搜索：联系人、讨论组、群"></div>

  </div>
  <div class="qq-xuan">
    <ul>
      <li class="qq-xuan-li"><span></span><i></i></li>
      <li class="qq-xuan-li"><span id=""></span><i></i></li>
      <li class="qq-xuan-li"><span></span><i></i></li>
      <li><span></span><i></i></li>
    </ul>
  </div>
  <div class="qq-hui" style="display: none;">
    <div class="wc" style="overflow:hidden;">
    <div class="ys-1">>我的好友</div>
    <div class="zk-1">
      <ul>
        <c:forEach items="${relation}" var="relation" >
        <c:if test="${user==relation.users}">
        <li class="my" style="font-size:13px;font-weight:bold;width:300px;height:55px;border:1px solid rgb(230, 230, 230);">
          <input type='hidden' class='id-s' value="+result.id+">
          <div class="qq-hui-img" style='float: left;'><img src="/others/forChatIndex/images/head/01.jpg\"><i></i></div>
          <div class="qq-chat-my" style=' width: 120px;height:54px;float: left;'>
          <div >用户名："+result.name+"</div>
          <div>账号："+result.id+"</div>
          <div class="qq-chat-ner">地址："+result.address+"</div>
          </div>
          <div class="qq-chat-my" style=' width: 100px;height:39px;float: left;padding-top: 15px;'>
          <div><input type='button'  id='sc' value='删除'style="width: 40px;height:30px;background:rgb(250,129,129); -webkit-border-radius: 10rem;float: left;"></div>
          <div><input type='button'  id='hmd' value='黑名单'style="width: 40px;height:30px;float: left;margin-left: 10px;background:rgb(253,208,77); -webkit-border-radius: 10rem;"></div>
        </div >
        </li>
        </c:if>
        </c:forEach>
      </ul>
    </div>
    </div>
    <div class="wc" style="overflow:hidden;">
    <div class="ys-2">>黑名单</div>
    <div class="zk-2">
      <ul></ul>
    </div>
    </div>
    <div class="wc" style="overflow:hidden;">
    <div class="ys-3">>附近的人</div>
    <div class="zk-3"><ul></ul></div>
    </div>
  </div>
  <div class="qq-hui" id="user-id">
    <ul>
        <li>
        <input type="hidden" value="1">
        <div class="qq-hui-img"><img src="/others/forChatIndex/images/head/01.jpg"><i></i></div>
          <div class="qq-hui-name"><c:if test="${user.id==1}">${user.name}</c:if></div>
        <div class="qq-hui-txt" title="">下次我们去公园拍摄吧~[图片]</div>
        </li>
        <li>
        <input type="hidden" value="2" >
        <div class="qq-hui-img"><img src="/others/forChatIndex/images/head/02.jpg"><i></i></div>
        <div class="qq-hui-name"><c:if test="${user.id==2}">${user.name}</c:if></div>
        <div class="qq-hui-txt" title="">下次我们去公园拍摄吧</div>
      </li>
    </ul>
  </div>
  <div class="qq-bot">
    <div class="qq-menu">
      <ul>
        <li><img src="/others/forChatIndex/images/bot-menu/01.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/02.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/03.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/04.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/05.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/06.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/07.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/08.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/09.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/10.png"></li>
      </ul>
    </div>
    <div class="qq-bou-she">
      <ul>
        <li><img src="/others/forChatIndex/images/bot-menu/11.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/12.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/13.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/14.png"></li>
        <li><img src="/others/forChatIndex/images/bot-menu/15.png"></li>
        <li id="find"><img src="/others/forChatIndex/images/bot-menu/16.png">查找</li>
        <li><img src="/others/forChatIndex/images/bot-menu/05.png"><span>应用宝</span></li>
      </ul>
    </div>
  </div>
</div>
<div id="friend" style="width: 700px;margin:0 0 -255px -320px; ">
  <div class="qq-chat-win">
    <ul>
      <li class="she"></li><li class="min"></li><li class="max"></li><li class="close"></li>
    </ul>
  </div>
<div class="middle" style="width: 700px; height: 30px; border-bottom: 5px solid red;margin-top: 100px">
      <div style="font-size:15px;float:left;margin-left: 5px;">
        用户：<input type="text"  autocomplete="off" id="name"
                  placeholder="请输入用户名查找" style="height:30px;border:1px solid #000000;"><i></i>
      </div>
      <div style="font-size:15px;float:left;margin-left: 5px;">
        账号：<input type="text"  autocomplete="off" id="account" placeholder="请输入账号查找"
                  style="height:30px;border:1px solid #000000;"><i></i>
      </div>
      <div style="font-size:15px;float:left;margin-left: 5px;">
        性别：<input type="text"  autocomplete="off" id="sex" placeholder="请输入性别"
                  style="height:30px;border:1px solid #000000;"><i></i>
     </div>
  <input type="button" class="bts" value="查询" style=" width: 80px;height:30px;margin-left: 10px;background:rgb(51,202,187); -webkit-border-radius: 10rem;">

</div>
<div id="fors" style="width: 700px;height:475px;overflow: scroll;">
<ul>

</ul>
</div>
</div>
<div class="qq-chat" id="qq-chats">
  <div class="qq-chat-win">
    <ul>
      <li class="she"></li><li class="min"></li><li class="max"></li><li class="close"></li>
    </ul>
  </div>
  <div class="qq-chat-top">
    <div class="qq-chat-tops">
      <div class="qq-chat-t-head"><img src=""></div>
      <div class="qq-chat-t-name"></div>
      <div class="qq-chat-t-shuo">站在别人的雨季，淋湿自己空弹一出戏.....</div>
    </div>
    <div class="qq-chat-menu">
      <ul>
        <li><span><img src="/others/forChatIndex/images/chat/icon-01.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/icon-02.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/icon-03.png"></span><i></i></li>
        <li><span><img src="/others/forChatIndex/images/chat/icon-04.png"></span><i></i></li>
        <li><span><img src="/others/forChatIndex/images/chat/icon-05.png"></span><i></i></li>
        <li><span><img src="/others/forChatIndex/images/chat/icon-06.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/icon-07.png"></span><i></i></li>
      </ul>
    </div>
  </div>
  <div class="qq-chat-bot">
    <div class="qq-chat-txt" id="qq-chat-txt-1" >
      <ul>
        <li>
          <div class="qq-chat-you blue"><span></span><i></i></div>
          <div class="qq-chat-ner"></div>
        </li>
      </ul>
    </div>
    <div class="qq-chat-text">
      <ul>
        <li><span><img src="/others/forChatIndex/images/chat/menu-01.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/menu-02.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/menu-03.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/menu-04.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/menu-05.png"></span><i></i></li>
        <li><span><img src="/others/forChatIndex/images/chat/menu-06.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/menu-07.png"></span><i></i></li>
        <li><span><img src="/others/forChatIndex/images/chat/menu-08.png"></span></li>
        <li><span><img src="/others/forChatIndex/images/chat/menu-09.png"></span><i></i></li>
        <li class="fr" style="margin-right:5px;"><span><img src="/others/forChatIndex/images/chat/menu-10.png">
        </span><p>消息记录</p><i></i></li>
      </ul>
      <textarea id="qq-chat-text"></textarea>
      <div class="qq-chat-but">
        <span class="fasong">发送(S)</span>
        <span class="close-chat">关闭(C)</span>
      </div>
    </div>
  </div>
</div>
</body>
<script>
  var revid;
  var name;
  var otherName;
  var ner;
  var msg;
  var now;
  var t_div;
  $(function () {
   /* $('.dr').click(function () {
        if($('.login-txt').find('   input').val() == ''){
          alert('请输入账号或者密码')
        }else if($('login-txt input').val() != ''){
          var account=$("#account").val();
          var password=$("#password").val();
          $.ajax({
            url:"/com/select",
            type:"post",
            data:{"account":account,"password":password},
            success:function (result){
              if(result=="1"){
                alert("用户名不存在");
              }else if(result=="2"){
                alert("密码错误");
              }else{
                $('.qq').css('display', 'block').removeClass('mins')
                $('.qq-login').css('display', 'none')

              }
            }
          })
        }
      })*/
    var  websocket=null;
    if("WebSocket" in window){
      var url="ws://${pageContext.request.serverName}:"//服务器
              +"${pageContext.request.serverPort}"//端口号
              +"${pageContext.request.contextPath}"//项目访问路径
              +"/socket";
      websocket=new WebSocket(url);
    }else{
      alert("浏览器不支持websocket，请更换浏览器")
    }
  $('.qq-hui li').dblclick(function() {
    $('.qq-chat').css('display', 'block').removeClass('mins');
    $('.qq-chat-t-name').html($(this).find('span').html());
    $('.qq-chat-t-head img').attr('src', $(this).find('img').attr('src'));
    $('.qq-chat-you span').html($(this).find('span').html());
    // $('.qq-chat-you i').html($(this).find('.qq-hui-name i').html())
    $('.qq-chat-ner').html($(this).find('.qq-hui-txt').html());
    $("#qq-chat-text.html").trigger("focus");
    $('.my').remove();
     revid = $(this).find("input").eq(0).val();
    otherName=$(this).find('.qq-hui-name').html() ;
  });
    //3.绑定接收消息回到函数
    websocket.onmessage=function (event) {
      //event是返回消息对象 data其中的数据
      /*alert("接收到服务器端消息："+event.data)*/
      //将json字符串，转换成json对象
      var message = JSON.parse(event.data);//{revId:"",sendId:"",msg:""}
      //获取接收到的消息内容
      var msg = message.content;
      //将消息添加到消息框中
      if(message.targetId!=message.senderId&&message.senderId==revid) {
        /*$("#qq-chat-txt-1").append("<div>"+msg+"</div>");*/
        $('.qq-chat-txt ul').append('<li class="my"><div class="qq-chat-my"><span>' +message.targetName + '</span><i>' + message.time + '</i></div><div class="qq-chat-ner">' + msg + '</div></li>')
      }
    };
  //绑定回车事件
    $(document).keypress(function(e) {
      // 回车键事件
      if(e.which == 13) {
        $(".fasong").click();
      }
    });

    //发送按钮点击事件
    $(".fasong").click(function () {
      if($('#qq-chat-text').val()==''){
        alert("发送内容不能为空,请输入内容")
      }else if($('#qq-chat-text').val()!=''){
        name = $('.qq-top-name span').html();
        ner = $('#qq-chat-text').val();
        msg = ner.replace(/\n/g,'<br>');
        now=new Date();
        t_div = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+' '+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
        $('.qq-chat-txt ul').append('<li class="my"><div class="qq-chat-my"><span>'+name+'</span><i>'+t_div+'</i></div><div class="qq-chat-ner">'+msg+'</div></li>');
        $(".qq-chat-txt").scrollTop($(".qq-chat-txt")[0].scrollHeight);
        $('#qq-chat-text').val('').trigger("focus");
        //获取要发送的消息
        if(msg!=""){
          //获取消息接收者
          var revUser=revid;
          var sendId="${sessionScope.user.id }";
          var creatAt=Date.parse(t_div);
          //封装json对象
          var message={content:msg,targetId:revUser,senderId:sendId,craetAt:creatAt};
          //发送消息 json.stringify 将json对象转化成json字符
          websocket.send(JSON.stringify(message));
          //发送完消息，将消息添加到消息框中
          /* $("#qq-chat-txt-1").append("<div>"+msg+"</div>");*/
        }
      }

    });
    $(".bts").click(function () {
      var name=$("#name").val();
      var account=$("#account").val();
      var sex=$("#sex").val();
      $.ajax({
        url:"/com/selectUp",
        type:"post",
        data:{"name":name,"id":account,"sex":sex},
        dataType:"json",
        success:function (result) {
           if(result.length==0){
             var name="没有该用户！";
             var html="<li style='color:red;font-size:30px;'>"+name+"</li>";
             $("#fors ul").html(html);
           }else{
             var html="";
             var name="${user.name}";
             var relation="${relation.targer}";
             for (var i=0;i<result.length;i++){
               var rand = parseInt(Math.random()*8+1);
              if(name!=result[i].name&&result[i].id!=relation){
                html+="<li class=\"my\" style=\"font-size: 20px\">\n" +
                        " <input type='hidden' class='ids' value="+result[i].id+">\n" +
                        " <div class=\"qq-hui-img\"><img src=\"/others/forChatIndex/images/head/0"+rand+".jpg\"><i></i></div>\n" +
                        " <div class=\"qq-chat-my\">\n" +
                        " <span>用户名："+result[i].name+"</span>\n" +
                        "  <i>账号："+result[i].id+"</i>\n" +
                        "</div>\n" +
                        "<div class=\"qq-chat-ner\">地址："+result[i].address+"</div>\n" +
                        "<div id='sss'><input type='button'  class='adds' value='+添加好友'style=\" width: 100px;height:30px;margin-left: 10px;background:rgb(51,202,187); -webkit-border-radius: 10rem;\"></div>\n" +
                        "</li>"
             }else if(result[i].id==relation){
                html+="<li class=\"my\" style=\"font-size: 20px\">\n" +
                        " <input type='hidden' class='ids' value="+result[i].id+">\n" +
                        " <div class=\"qq-hui-img\"><img src=\"/others/forChatIndex/images/head/0"+rand+".jpg\"><i></i></div>\n" +
                        " <div class=\"qq-chat-my\">\n" +
                        " <span>用户名："+result[i].name+"</span>\n" +
                        "  <i>账号："+result[i].id+"</i>\n" +
                        "</div>\n" +
                        "<div class=\"qq-chat-ner\">地址："+result[i].address+"</div>\n" +
                        "<div id='sss'><input type='button'  class='sc' value='删除'style=\" width: 100px;height:30px;margin-left: 10px;background:rgb(51,202,187); -webkit-border-radius: 10rem;\"></div>\n" +
                        "<div id='sss'><input type='button'  class='hmd' value='黑名单'style=\" width: 100px;height:30px;margin-left: 10px;background:rgb(51,202,187); -webkit-border-radius: 10rem;\"></div>\n" +
                        "</li>"
              }
             }
              $("#fors ul").html(html);
           }
        }
      })
    });

    $("#fors ul").on("click",".adds" , function () {
      var id =$(this).parent().siblings("input").val();
      var ids="${user.id}";
      var status=1;
      $(this).parent().parent().remove();
      $.ajax({
        url:"/com/selectId",
        type:"post",
        data:{"users":ids,"target":id,"status":status},
        success:function(result) {
          var html="";
          var rand = parseInt(Math.random()*8+1);
          html+="<li class=\"my\" style=\"font-size:13px;font-weight: bold;width: 300px;height:55px;border:1px solid rgb(230, 230, 230) ;\">\n" +
                  " <input type='hidden' class='id-s' value="+result.id+">\n" +
                  " <div class=\"qq-hui-img\" style='float: left;'><img src=\"/others/forChatIndex/images/head/0"+rand+".jpg\"><i></i></div>\n" +
                  " <div class=\"qq-chat-my\" style=' width: 120px;height:54px;float: left;'>\n" +
                  " <div >用户名："+result.name+"</div>\n" +
                  " <div>账号："+result.id+"</div>\n" +
                  " <div class=\"qq-chat-ner\">地址："+result.address+"</div>\n" +
                  "</div>\n" +
                  " <div class=\"qq-chat-my\" style=' width: 100px;height:39px;float: left;padding-top: 15px;'>\n" +
                  "<div><input type='button'  class='sc' value='删除'style=\"width: 40px;height:30px;background:rgb(250,129,129); -webkit-border-radius: 10rem;float: left;\"></div>\n" +
                  "<div><input type='button'  class='hmd' value='拉黑'style=\"width: 40px;height:30px;float: left;margin-left: 10px;background:rgb(253,208,77); -webkit-border-radius: 10rem;\"></div>\n" +
                  " </div >\n" +
                  "</li>";
          $(".zk-1 ul").append(html)
      /*    dt(ids,id);*/
        }
      })
    });
    $(".zk-1 ul").on("dblclick",".my", function () {
      $('.qq-chat').css('display', 'block').removeClass('mins');
      $('.qq-chat-t-name').html($(this).find('span').html());
      $('.qq-chat-t-head img').attr('src', $(this).find('img').attr('src'));
      $('.qq-chat-you span').html($(this).find('span').html());
      // $('.qq-chat-you i').html($(this).find('.qq-hui-name i').html())
      $('.qq-chat-ner').html($(this).find('.qq-hui-txt').html());
      $("#qq-chat-text.html").trigger("focus");
      revid = $(this).find("input").eq(0).val();
      otherName=$(this).find('.qq-hui-name').html() ;
    });
    //删除
    $(".zk-1 ul").on("click",".sc", function () {
      $(this).closest('li').remove();
    });
    //拉入黑名单
    $(".zk-1 ul").on("click",".hmd",function () {
      var html="";
      $(this).val("恢复").css("background","rgb(51,202,187)");
      $(".zk-2 ul").append($(this).parent().parent().parent());
    });
    $(".zk-2 ul").on("click",".hmd",function(){
      $(this).val("拉黑");
      $(".zk-1 ul").append($(this).parent().parent().parent());
    })
    //
     /*  function dt(ids,id){
         var status=1;
        $.ajax({
          url:"/com/rel",
          type:"post",
          data:{"users":ids,"target":id,"status":status},
          success:function (result) {
            if(result=="1"){
              alert("插入成功")
            }else{
              alert("插入失败")
            }
          }
        })
       }*/
      /*$("#reduceheightkeley" + "i").on("click", function () {
      $("#keleyidiv").height($("#keleyidiv").height() - 50);
       });*/
  })

</script>

</html>
