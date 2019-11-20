
/**
 *  拖动效果
 * @param selector  可拖动区域
 * @param targetSelector   拖动移动目标(默认与可拖动区域相同)
 * @requires  targetSelector 是 selector 的 父级对象
 */
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


/**
 * 局部加载ajax请求界面,默认异步方式，需要同步传递第三个参数
 * @param selector
 * @param url
 */
function load(selector,url){
   if(arguments.length<2) return;
   if(arguments.length==2){
       $(selector).load(url+" div:first",function(response,status,xhr){
           if(status=='success')
               $(selector).html(response.substring(response.indexOf("<body"),response.indexOf("</body>")+7));
       })
   }else {
       var response=$.ajax({
           type:'GET',
           url:url,
           async: false,
       }).responseText;
       $(selector).html(response.substring(response.indexOf("<body"),response.indexOf("</body>")+7))
   }
}



/**
 *  文本化json对象
 * @param serializeArray  $("form").serializeArray()
 * @returns {string}     可以被  Java中ObjectMapper对象读取
 */

function serializeObj(serializeArray) {
    var serializeObj={};
    $(serializeArray).each(function(){
        if(serializeObj[this.name]){
            if($.isArray(serializeObj[this.name])){
                serializeObj[this.name].push(this.value);
            }else{
                serializeObj[this.name]=[serializeObj[this.name],this.value];
            }
        }else{
            serializeObj[this.name]=this.value;
        }
    });
    return JSON.stringify(serializeObj);
}

/**
 * 获取当前页面服务器项目地址
 * @return {string} 不包括协议，主机地址(域名)：端口号[/项目名]
 * @constructor
 */

function LocalhostPath() {
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPath=curWwwPath.substring(0,pos).substring(5);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return localhostPath;
}

/**
 * webSocket 单例模式
 * @returns {{removeSocketHandle: registerSocketHandle, registerSocketHandle: registerSocketHandle, sendMessage: send}}
 * @return removeSocketHandle  移除监听服务器事件  @param  事件类型
 * @return registerSocketHandle 添加监听服务器事件 @param type 时间类型 fn 对应执行函数
 * @return send 向服务器发送文本信息  @param text 文本内容 type 附加标识
 */

var  webSocket=function (){
    var url="ws:"+LocalhostPath()+"/socket";
    var instance=new WebSocket(url);

    var events={};

    $("body").on("unload","#cat",function () {
        instance.close();
    });

    instance.onmessage =function (ev) {
        if(events[ev.data])
            events[ev.data]();
        console.log(ev);
    };

    instance.onclose=function (ev) { console.log(ev); };

    instance.onerror=function (ev) {
        console.log(ev);
        //instance=new WebSocket(url);
    };


    //toKeep
    setTimeout(function () {
        send("keep","");
    },2000);

    function registerSocketHandle(type,fn){
        events[type]=fn;
    }

    function send(type,text) {
        if(!type || !text) return;

        switch (instance.readyState) {
            case 3:
                instance=new WebSocket(url);
            case 0:
                setTimeout(function () {
                    send(type,text)
                },200);
                break;
            default:
                instance.send(type+"---------webSend---------"+text);
        }
    }

    function removeSocketHandle(type) {
        delete events[type];
    }

    var obj={
        registerSocketHandle:registerSocketHandle,
        sendMessage:send,
        removeSocketHandle:registerSocketHandle
    };

    webSocket=function () {
        return obj;
    };

    return obj;
};
