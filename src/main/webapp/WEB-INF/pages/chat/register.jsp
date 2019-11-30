<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>注册页面</title>
  <%@include file="/WEB-INF/commonRel.jsp"%>

</head>
<style>
    body{text-align: center;}
    .has-error{border: 1px solid red}
</style>
<body>
<link href="/others/forChatIndex/css/style.css" rel="stylesheet" type="text/css">
<div id="dst-1" >
<form action="/com/register" method="post">
    <table bgcolor="#deb887" style="margin:auto">
    用户名：<input type="text" name="users" id="users" placeholder="用户名"><br>
    密码：<input type="password" name="pass"  id="pass" placeholder="密码"><br>
    确认密码：<input type="password" name="password" id="password"  placeholder="确认密码"><br>
    性别：<input type="text" name="sex" placeholder="性别"><br>
    生日：<input type="date" name="birthday" placeholder="生日"><br>
    籍贯：<input type="text" name="nativeplace" placeholder="籍贯">
          <input type="submit" value="注册">
    </table>
</form>
</div>
<script type="text/javascript">
  $(function ($) {
      $("#users").blur(function () {
          var name = $(this).val();
          if (name == null || name == "") {

              $("#users").addClass("has-error");
              $(this).focus()//当前对象重新获得焦点
          } else {
              $.ajax({
                  url: "/com/account",
                  type: "post",
                  data: {"name": name},
                  success: function (result) {
                      if (result == "1") {
                          $("#users").attr("msg","用户名已存在");
                          $("#users").addClass("has-error");
                          $("#users").focus()
                      } else {
                          $("#users").remove().alert();
                          $("#users").removeClass("has-error")
                      }
                  }
              })
          }
      });
      $("#pass").blur(function () {
        var pass=$(this).val();
        var password=$("#password").val();
        if(pass!=password){
            $(this).addClass("has-error");
            $(this).alert("两次密码不一致");
            $(this).focus()
        }else{
            $(this).removeClass("has-error");
            $(this).remove().alert();
        }
      })
  })
</script>
</body>
</html>
