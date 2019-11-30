<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
   <%@include file="/WEB-INF/commonRel.jsp"%>
    <link style="">
</head>
<body>
请选择聊天对象：
<select id="user">
    <option value="1">张三</option>
    <option value="2">小玲</option>
</select>
<div id="message-1" style="width:500px;height: 300px;border:solid 1px red "></div>
<input type="text" id="message" value="">
<input type="button" id="send" value="发送">
<script type="text/javascript">
    //1.创建websocket对象
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
    //3.绑定接收消息回到函数
    websocket.onmessage=function (event) {
        //event是返回消息对象 data其中的数据
        alert("接收到服务器端消息："+event.data);
        //将json字符串，转换成json对象
        var message = JSON.parse(event.data);//{revId:"",sendId:"",msg:""}
        //获取接收到的消息内容
        var msg = message.content;
        //将消息添加到消息框中
        $("#message-1").append("<div>"+msg+"</div>");

    };
     $(function () {
       //发送按钮点击事件
       $("#send").click(function () {
           //获取要发送的消息
           var msg=$("#message").val();
           if(msg!=""){
               //获取消息接收者
               var revUser=$("#user").val();
               var sendId="${sessionScope.user.id}";
               //封装json对象
               var message={content:msg,targetId:revUser,senderId:sendId};
               //发送消息 json.stringify 将json对象转化成json字符
               websocket.send(JSON.stringify(message));
               //发送完消息，将消息添加到消息框中
               $("#message-1").append("<div>"+msg+"</div>");

         }
       })

     })

</script>
</body>
</html>
