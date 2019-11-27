<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>userLeft</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body >
    <style>
        #userLeft_head{
            text-align: center;
            padding-top:20px;
            background-image:url(${user.tinyBackground});
            background-size: 100% 100%;
            position: relative;
        }
        #userLeft_head>img{
            width:150px;
            height:150px;
            border-radius: 50%;
        }
        #userLeft_head>p,#userLeft_head~div>p{
            font-family: 华文琥珀;
            font-size: 1.5em;
            font-weight: bold;
            margin:2px;
        }
        #userLeft_head~div>p{
            margin: 0px 0px 4px 0px;
            padding:8px 0px;
            border-bottom:2px ghostwhite outset;
            border-radius: 10%;
            cursor: pointer;
        }

        #userLeft ul{
            background-color:rgb(205, 231, 230) ;
            display: none;
            overflow:auto;
            padding:0;
            margin:0;
            list-style: none;
        }

        #userLeft ul>li{
            padding:10px 0 10px 7.5%;
            min-width: 42.5%;
            float: left;
            overflow: hidden;
            font-family: 华文楷体;
            font-size: 1.5em;
        }
        *::-webkit-scrollbar{
            width:0;
        }
        #userLeft ul>li>span{
            font-weight: bold;
            margin-left:10px;
        }
        #userLeft a{
            text-align: center;
            display: inline-block;
            float: left;
            height: 40px;
            margin:20px 10%;
            width: 30%;
            text-decoration: none;
            line-height:40px;
            padding:0 5%;
            border-radius: 10%;
            background-color: #1297F4;
            font-size: 0.8em;
            font-family: 宋体;
            color:white;
        }
        #userLeft a:active{
            color:red;
        }
        
    
    
    </style>
    <div id="userLeft">
        <div id="userLeft_head" style="background: ${user.tinyBackground}">
            <img src="${user.head}" draggable="false">
            <p>${user.name}</p>
        </div>
        <div>
            <p align="center">基本信息</p>
            <ul style="display: block;" id="message">
                <li>姓名:<span id="real">${user.realname}</span></li>
                <li>性别:<span>${user.sex}</span></li>
                <li>生日:<span id="bir"><fmt:formatDate value="${user.birthday}" pattern="yyyy/MM/dd"></fmt:formatDate></span></li>
                <li>星座:<span>${user.constellation}</span></li>
                <li>联系电话:<span id="phone">${user.phone}</span></li>
                <li>联系地址:<span id="adr">${user.address}</span></li>
            </ul>
        </div>
        <div>
            <p align="center">论坛帖子</p>
            <ul></ul>
        </div>
        <div>
            <p align="center">学习记录</p>
            <ul></ul>
        </div>
        <div style="overflow: hidden;">
            <a href="javascript:void(0)" id="updateAdmin">修改信息</a>
            <a href="javascript:void(0)">更换背景</a>
        </div>
    </div>

    <script>
        $('#userLeft_head~div>p').click(function(){
            var $this=$(this).next();
            if($(this).next().is(":hidden")){
                $("#userLeft_head~div>ul").not($this).hide();
                $this.slideDown(20);
            }
        });

        $('#updateAdmin').click(function (){
            if($(this).html()=='修改信息') {
                $('#message span').attr('contenteditable', true);
                $(this).html("提交修改")
            }else {
                var tag=true;
                $('#message span').each(function () {
                    if($(this).html().trim().lenght==0)
                        tag=false;
                });
                var realname=$('#real').html().trim();
                var birthday=new Date($('#bir').html().trim()).Format("yyyy-MM-dd");
                var phone=$('#phone').html().trim();
                var address=$('#adr').html().trim();
                if(!IsDate(birthday) || !IsPhone(phone)) tag=false;
                if(tag) {
                    $.post('/admin/alter', {
                        phone: phone,
                        realname: realname,
                        address: address
                    });

                    $.post("/admin/update", {
                        id: $(".main-banner").attr("tid"),
                        type: 'birthday',
                        context: birthday
                    })
                }
                $(this).html('修改信息');
            }
        });

        Date.prototype.Format = function(fmt) { //fmt:yyyy-MM-dd hh:mm:ss（实参）
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if(/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for(var k in o)
                if(new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        };

        function IsDate(num){
            var regexp = /^([1][7-9][0-9][0-9]|[2][0][0-9][0-9])(\-)([0][1-9]|[1][0-2])(\-)([0-2][1-9]|[3][0-1])$/g;
            /// 日期范围：1700/01/01 ----2099-01-01 　
            return regexp.test(num);
        }

        function IsPhone(val){
            var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;//手机号码
            var isMob= /^0?1[3|4|5|8][0-9]\d{8}$/;// 座机格式
            if(isMob.test(val)||isPhone.test(val)){
                return true;
            }
            else{
                return false;
            }
        }

    
    </script>
</body>
</html>