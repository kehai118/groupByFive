<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>新增文档</title>
<link rel="icon" href="../../favicon.ico" type="image/ico">
<meta name="keywords" content="yyq">
<meta name="description" content="yyq">
<meta name="author" content="yyq">
<%@include file="common.jsp"%>
<!--标签插件-->
<link rel="stylesheet" href="/others/forlearn/js/jquery-tags-input/jquery.tagsinput.min.css">
<link href="/others/forlearn/css/style.min.css">
</head>
  
<body>
<div class="container-fluid p-t-15">
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          
          <form action="note/add.jsp" method="get" class="row">
            <div class="form-group col-md-12">
              <label for="title">笔记标题</label>
              <input type="text" class="form-control" id="title" name="title" value="" placeholder="请输入笔记标题...." />
            </div>
            <div class="form-group col-md-12">
              <label for="article">编辑笔记</label>
              <textarea class="form-control" id="article" name="article" rows="5" value="" placeholder="请输入要编辑的笔记....">${Login.name}</textarea>
            </div>

            <div class="form-group col-md-12">
              <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">添加</button>
              <button type="button" class="btn btn-default" onclick="history.back(-1);return false;">返 回</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    
  </div>
  
</div>

<script type="text/javascript" src="/others/forlearn/js/jquery.min.js"></script>
<script type="text/javascript" src="/others/forlearn/js/jquery.bootstrap.wizard.min.js"></script>
<!--标签插件-->
<script src="/others/forlearn/js/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="/others/forlearn/js/main.min.js"></script>
</body>
</html>