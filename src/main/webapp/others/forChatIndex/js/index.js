$(document).ready(function(){
  $('.qq-xuan li').click(function(){
    $(this).addClass('qq-xuan-li').siblings().removeClass('qq-xuan-li')
  });
  $('.qq-hui-txt').hover(function(){
    var aa = $(this).html();
    $('.qq-hui-txt').attr('title',aa)
  });
  $('.login-close').click(function(){
     $(this).parent().parent().css('display','none')
  });

/*  $('.qq-exe img').dblclick(function(){
    $('.qq-login').css('display','block').removeClass('mins')
  })*/
    $('.qq-login').css('display','block').removeClass('mins');

    $('.qq').css('display', 'block').removeClass('mins');
    $('.qq-login').css('display', 'none');

  $('.login-txt input').keydown(function(e){
    if(e.keyCode == 13){
      if($('.login-txt').find('input').val() == ''){
	  alert('请输入账号或者密码')
	}else if($('login-txt input').val() != ''){
      $('.qq').css('display','block').removeClass('mins');
	  $('.qq-login').css('display','none')
	}
    }
  });
  $('.close').click(function(){
    $(this).parent().parent().parent().css('display','none')
  });
    //最下化窗口
  $('.min').click(function(){
    $(this).parent().parent().parent().addClass('mins')
  });
  $('.qq .close').click(function(){
    $('.qq-chat').css('display','none')
  });
  $('#qq-chat-text.html').keydown(function(e){
    if(e.keyCode == 27){
	  $('.qq-chat').css('display','none')
    }
  });
  /*  $('.fasong').click(function(){
        if($('#qq-chat-text').val()==''){
            alert("发送内容不能为空,请输入内容")
        }else if($('#qq-chat-text').val()!=''){
            var name = $('.qq-top-name span').html()
            var ner = $('#qq-chat-text').val()
            var ners = ner.replace(/\n/g,'<br>')
            var now=new Date()
            var t_div = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+' '+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
            $('.qq-chat-txt ul').append('<li class="my"><div class="qq-chat-my"><span>'+name+'</span><i>'+t_div+'</i></div><div class="qq-chat-ner">'+ners+'</div></li>')
            $(".qq-chat-txt").scrollTop($(".qq-chat-txt")[0].scrollHeight);
            $('#qq-chat-text').val('').trigger("focus")
        }
    })*/
  $('.close-chat').click(function(){
    $('.qq-chat').css('display','none')
  });
  $(".qq-hui").niceScroll({
    touchbehavior:false,cursorcolor:"#ccc",cursoropacitymax:1,cursorwidth:6,horizrailenabled:true,cursorborderradius:3,autohidemode:true,background:'none',cursorborder:'none'
  });
    //验证窗口移动
    drag(".qq-login","#drag");
    function drag(selector,targetSelector) {

        targetSelector=targetSelector?targetSelector:selector;
        //保存开始拖动时鼠标相对对象位置
        var x,y;
        $("body").on("mousedown",selector,start);
        function start() {
            $("body").bind("mousemove",move);
            $("body").bind("mouseup",stop);
            x=event.pageX-parseInt($(targetSelector).css("left"));
            y=event.pageY-parseInt($(targetSelector).css("top"));
        }
        function move() {
            $(targetSelector).css({
                left: event.pageX - x,
                top: event.pageY - y
            })
        }
        function stop() {
            $("body").unbind("mousemove",move);
            $("body").unbind("mouseup",stop);
        }
    }

    //QQ页面移动
    /**
     *  拖动效果
     * @param selector  可拖动区域
     * @param targetSelector   拖动移动目标(默认与可拖动区域相同)
     * @requires  targetSelector 是 selector 的 父级对象
     */

    drag(".qq-top","#dst-qq");
    function drag(selector,targetSelector) {

        targetSelector=targetSelector?targetSelector:selector;
        //保存开始拖动时鼠标相对对象位置
        var x,y;
        $("body").on("mousedown",selector,start);
        function start() {
            $("body").bind("mousemove",move);
            $("body").bind("mouseup",stop);
            x=event.pageX-parseInt($(targetSelector).css("left"));
            y=event.pageY-parseInt($(targetSelector).css("top"));
        }
        function move() {
            $(targetSelector).css({
                left: event.pageX - x,
                top: event.pageY - y
            })
        }
        function stop() {
            $("body").unbind("mousemove",move);
            $("body").unbind("mouseup",stop);
        }
    }
    drag(".qq-chat-top","#qq-chats");
    function drag(selector,targetSelector) {

        targetSelector=targetSelector?targetSelector:selector;
        //保存开始拖动时鼠标相对对象位置
        var x,y;
        $("body").on("mousedown",selector,start);
        function start() {
            $("body").bind("mousemove",move);
            $("body").bind("mouseup",stop);
            x=event.pageX-parseInt($(targetSelector).css("left"));
            y=event.pageY-parseInt($(targetSelector).css("top"));
        }
        function move() {
            $(targetSelector).css({
                left: event.pageX - x,
                top: event.pageY - y
            })
        }
        function stop() {
            $("body").unbind("mousemove",move);
            $("body").unbind("mouseup",stop);
        }
    }


//窗口最大最小化
    /*$("#").createDialog({
        autoOpen: false,
        zIndex: 3999,
        width: 680,
        height: 600,
        buttons:{
            "保存" : function() {
                $("#monthPlanForm").submit();
                $("#monthlyPlanGrid").trigger("reloadGrid");
            },
            "取消" : function() {
                $(this).dialog("close");
            }
        },

        open: function (event, ui) {
            var $dialog = $(this);
            var atext = $(".ui-dialog-titlebar-close").replaceWith(
                '<p class="ui-xlgwr"> '+
                '<span class="ui-icon ui-icon-maxthick" title="最大化">max</span>'+
                '<span class="ui-icon ui-icon-resetthick" title="还原">reset</span>'+
                '<span class="ui-icon ui-icon-closethick" title="关闭">close</span>'+
                '</p>'
            );
            var myw = document.body.clientWidth;   //定义一个myw，接受到当前全屏的宽
            var myh = document.body.clientHeight;  //定义一个myw，接受到当前全屏的高
            var initwidth = $dialog[0].parentNode.clientWidth;
            var initheight = $dialog[0].parentNode.clientHeight;
            var initTop = $dialog[0].parentNode.style.top;
            var initLeft =  $dialog[0].parentNode.style.left;
            $(".ui-xlgwr>span")["1"].style.display = "none";
            $(".ui-xlgwr>span").click(function () {
                var spantext = $(this).text();
                if (spantext == "max") {  //最大化
                    $dialog.dialog({
                        position: ['left', 'top'],
                        width: myw,
                        height: myh
                    });
                    $(".ui-xlgwr>span")["0"].style.display = "none";
                    $(".ui-xlgwr>span")["1"].style.display = "block";
                } else if (spantext == "reset") {
                    $dialog.dialog({
                        width: initwidth,
                        height: initheight
                    });
                    $dialog[0].parentNode.style.top = initTop;
                    $dialog[0].parentNode.style.left = initLeft;
                    $(".ui-xlgwr>span")["0"].style.display = "block";
                    $(".ui-xlgwr>span")["1"].style.display = "none";
                } else if (spantext == "close") {
                    $dialog.dialog("close");
                } else {
                    alert("请选择正确的图标,谢谢.");
                }
            });
        },
        close: function () {
            $(".loadmessage").hide();
        }

    });
*/
    $("#find").click(function () {
        $("#friend").toggle()
    });
    $(".qq-xuan-li").click(function () {
        $(".qq-hui").toggle();
    });
    $(".ys-1").click(function () {
        $(".zk-1").toggle();
    });
    $(".ys-2").click(function () {
        $(".zk-2").toggle();
    });
    $(".ys-3").click(function () {
        $(".zk-3").toggle();
    })

});


