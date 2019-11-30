<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>我的笔记</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="x-pjax-version" content="v173">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/others/forlearn/ico/favico-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/others/forlearn/ico/favico-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/others/forlearn/ico/favico-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/others/forlearn/ico/favico-57-precomposed.png">
        <link rel="shortcut icon" href="/others/forlearn/ico/favico.png">
        <link rel="shortcut icon" href="/others/forlearn/ico/favicon.ico">
        <link rel="stylesheet" href="/others/forlearn/styles/icon.css"/>
        <link rel="stylesheet" href="/others/forlearn/styles/main.css"/>
		<!-- Google-Code代码高亮CSS -->
        <link rel="stylesheet" href="/others/forlearn/styles/prettify.css"/>
		<!-- Ueditor编辑器CSS -->
		<link href="/others/forlearn/styles/umeditor.min.css" type="text/css" rel="stylesheet">
		<!--对话框-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/others/forlearn/js/jconfirm/jquery-confirm.min.css">
        <%@include file="/WEB-INF/commonRel.jsp"%>
    </head>
    <body class="animated fadeIn">
        <header class="header">
            <div class="header-brand">
                <a data-pjax=".content-body" href="/note/toEdit">
                    <img class="brand-logo" src="/others/forlearn/images/dummy/8986f28e.stilearn-logo.png" alt="Stilearn Admin Sample Logo">
                </a>
            </div>
            <div class="header-profile">
                <div class="profile-nav">
                    <span class="profile-username"></span>
                    <a  class="dropdown-toggle" data-toggle="dropdown">
                        <span class="fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu animated flipInX pull-right" role="menu">
                        <li><a href="/admin/index"><i class="fa fa-user"></i> 修改密码</a></li>
                        <li class="divider"></li>
                        <li><a id="logout" href="/admin/logout" ><i class="fa fa-sign-out"></i> 退出登录</a></li>
                    </ul>
                </div>
            </div>
<%--			模糊查询--%>
            <form action="/note/selectByLike" class="form-inline">
                <button type="button" class="btn btn-default btn-expand-search"><i class="fa fa-search"></i></button>
                <div class="toggle-search">
                    <input type="text" name="title" class="form-control" placeholder="搜索笔记" id='search_note'/>
                    <button type="button" class="btn btn-default btn-collapse-search"><i class="fa fa-times"></i></button>
                </div>
            </form>
            <ul class="hidden-xs header-menu pull-right">
                <li>
                    <a href="activity.html" target='_blank' title="笔记活动">活动</a>
                </li>
            </ul>
        </header>
		<div class="row" style='padding:0;' id='center'>
			<!-- alert_background-->
			<div class="opacity_bg" style='display:none'></div>
			<!-- alert_notebook -->
			<div id="can"></div>
			<div class="col-xs-2" style='padding:0;' id='pc_part_1'>
            <!-- side-right -->
            <div class="pc_top_first">
                <h3>全部笔记本</h3>
                <button type="button" class="btn btn-default btn-xs btn_plus" id='add_notebook'><i class="fa fa-plus"></i></button>
            </div>
            <aside class="side-right" id='first_side_right'>
                <div class="module" data-toggle="niceScroll">
                <div class="chat-contact">
                    <div class="contact-body">+
                        <ul class="contacts-list">
                            <li class="online">
                                <a  class='checked'>
                                    <i class="fa fa-book" title="online" rel="tooltip-bottom">
                                    </i> 默认笔记本</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            </aside>
            <div class="row clear_margin">
                <div class="col-xs-4 click" id='rollback_button' title='回收站'><i class='fa fa-trash-o' style='font-size:20px;line-height:31px;'></i></div>
                <div class="col-xs-4 click" id='like_button' title='收藏笔记本'><i class='fa fa-star' style='font-size:20px;line-height:31px;'></i></div>
                <div class="col-xs-4 click" id='action_button' title='参加活动笔记'><i class='fa fa-users' style='font-size:20px;line-height:30px;'></i></div>
            </div>
        </div>
			<!-- 全部笔记本 -->
			<!-- 全部笔记 -->
			<div class="col-xs-3" style='padding:0;' id='pc_part_2'>
				<div class="pc_top_second" id='notebookId'>
					<h3>全部笔记</h3>
					<button type="button" class="btn btn-default btn-xs btn_plus" id='add_note'><i class="fa fa-plus"></i></button>
				</div>
				<aside class="side-right" id='second_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
<!--								c:foreach-->
								<ul class="contacts-list">
									<c:forEach items="${tArticles}" var="tArticle">
									<li class="online">
										<a href="#" class='checked ntoe_val' tArticleTitle="${tArticle.title}" tArticleId="${tArticle.id}" tArticleArticle="${tArticle.article}">
											<i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i>${tArticle.title}<a href="/note/delete?id=${tArticle.id}">删除</a>
<%--											<button type="button" class="btn btn-default btn-xs btn_position btn_slide_down"><i class="fa fa-chevron-down"></i></button>--%>
										</a>
<%--										<div class="note_menu" tabindex='-1'>--%>
<%--											<dl>--%>
<%--												<dt><button type="button" class="btn btn-default btn-xs btn_move" title='移动至...'><i class="fa fa-random"></i></button></dt>--%>
<%--												<dt><button type="button" class="btn btn-default btn-xs btn_share" title='分享'><i class="fa fa-sitemap"></i></button></dt>--%>
<%--												<dt><button type="button" class="btn btn-default btn-xs btn_delete" title='删除'><i class="fa fa-times"></i></button></dt>--%>
<%--											</dl>--%>
<%--										</div>--%>
									</li>
									</c:forEach>
								</ul>
<!--								/c-->
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 全部笔记 -->
			<!-- 回收站笔记 -->
			<div class="col-xs-3" style='padding:0;display:none;' id='pc_part_4'>
				<div class="pc_top_second">
					<h3>回收站笔记</h3>
				</div>
				<aside class="side-right" id='four_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
									<li class="disable"><a ><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> 虚假回收站笔记<button type="button" class="btn btn-default btn-xs btn_position btn_delete"><i class="fa fa-times"></i></button><button type="button" class="btn btn-default btn-xs btn_position_2 btn_replay"><i class="fa fa-reply"></i></button></a></li>
								</ul>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 回收站笔记 -->
			<!-- 搜索笔记列表 -->
			<div class="col-xs-3" style='padding:0;display:none;' id='pc_part_6'>
				<div class="pc_top_second">
					<h3>搜索结果</h3>
				</div>
				<aside class="side-right" id='sixth_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
								</ul>
							</div>
						</div>
						<div id='more_note'>更多...</div>
					</div>
				</aside>
			</div>
			<!-- 搜索笔记列表 -->
			<!-- 收藏笔记列表 -->
			<div class="col-xs-3" style='padding:0;display:none;' id='pc_part_7'>
				<div class="pc_top_second">
					<h3>已收藏笔记</h3>
				</div>
				<aside class="side-right" id='seventh_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
									<!--li class="idle"><a ><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> switch多分支结构<button type="button" class="btn btn-default btn-xs btn_position btn_delete"><i class="fa fa-times"></i></button></a></li-->
								</ul>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 收藏笔记列表 -->
			<!-- 参加活动的笔记列表 -->
			<div class="col-xs-3" style='padding:0;display:none;' id='pc_part_8'>
				<div class="pc_top_second">
					<h3>参加活动的笔记</h3>
				</div>
				<aside class="side-right" id='eighth_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
									<!--li class="offline"><a ><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> 样式用例（点击无效）</a></li-->
								</ul>
							</div>
						</div>[
					</div>
				</aside>
			</div>
			<!-- 参加活动的笔记列表 -->
			<!-- 编辑笔记 -->
			<form action="/note/insert" method="post" id="noteForm">
			<div class="col-sm-7" id='pc_part_3'>
				<!-- side-right -->
				<div class="pc_top_third">
					<div class="row">
						<div class="col-xs-9">
							<h3>编辑笔记</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="btn btn-block btn-sm btn-primary" id='save_note'>保存笔记
							</button>
						</div>
					</div>
				</div>
				<aside class="side-right" id='third_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body clear_margin">
								<!--- 笔记标题 --->
								<div class="row" >
									<div class="col-xs-8">
										<input type="text" class="form-control" id="input_note_title" placeholder='笔记标题...' name="title">
                                        <%--编辑的笔记的id值--%>
                                        <input type="hidden" id="editNoteId" name="id" >
                                        <input type="hidden" id="authorId" name="authorId" value="1" >
									</div>
								</div>
								<!--- 笔记标题 --->
								<div class="row">
									<div class="col-sm-12">
										<!--- 输入框 --->
										<script type="text/plain" name="article" id="myEditor" style="width:100%;height:400px;">

										</script>

										<!--- 输入框 --->
									</div>
								</div>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 编辑笔记 -->

			</form>
			<!-- 预览笔记 -->
			<div class="col-sm-7" id='pc_part_5' style='display:none;' >
				<div class="pc_top_third">
					<div class="row">
						<div class="col-xs-9">
							<h3>预览笔记</h3>
						</div>
					</div>
				</div>
				<aside class="side-right" id='fifth_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body clear_margin">
								<h4 id="noput_note_title"></h4>
								<p>
								</p>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 预览笔记 -->
		</div>
        <footer>
            <p style="text-align: center">&copy;2019 LBB YYQ FYW DST</p>
			<div style='position:absolute;top:5PX;height:30px;right:20px;line-height:26px;border:1px solid #0E7D76;display:none;background:#fff'>
				<strong style='color:#0E7D76;margin:0 10px;'></strong>
			</div>
        </footer>
		<script type="text/javascript">
			//加载DOM之后处理页面高度
			function get_dom(e){
				return document.getElementById(e);
			}
			function set_height(){
				var pc_height=window.innerHeight;
				pc_height=pc_height-132;
				get_dom('first_side_right').style.height=(pc_height-31)+'px';
				get_dom('second_side_right').style.height=pc_height+'px';
				get_dom('four_side_right').style.height=pc_height+'px';
				get_dom('sixth_side_right').style.height=pc_height+'px';
				get_dom('seventh_side_right').style.height=pc_height+'px';
				get_dom('eighth_side_right').style.height=pc_height+'px';
				get_dom('third_side_right').style.height=(pc_height-15)+'px';
				get_dom('fifth_side_right').style.height=(pc_height-15)+'px';
			}
			function myEditorWidth(){
				var dom=get_dom('third_side_right');
				var style=dom.currentStyle||window.getComputedStyle(dom, null);
				get_dom('myEditor').style.width=style.width;
			}
			set_height();
			//改变窗口大小时调整页面尺寸
			window.onresize=function(){
				set_height();
				var width=$('#third_side_right').width()-35;
				$('.edui-container,.edui-editor-body').width(width);
				$('#myEditor').width(width-20);
			};
		</script>
        <script type="text/javascript" src="/others/forlearn/js/jquery.min.js"></script>

		<!-- Bootstrap框架JS -->
        <script src="/others/forlearn/scripts/bootstrap.min.js"></script>
        <script src="/others/forlearn/scripts/js-prototype.js"></script>
        <script src="/others/forlearn/scripts/theme-setup.js"></script>
		<!-- Google-Code代码高亮JS -->
        <script class="re-execute" src="/others/forlearn/scripts/run_prettify.js"></script>
		<!-- Ueditor编辑器JS -->
		<script type="text/javascript" charset="utf-8" src="/others/forlearn/scripts/ue/umeditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="/others/forlearn/scripts/ue/umeditor.min.js"></script>
		<script type="text/javascript" src="/others/forlearn/scripts/ue/lang/zh-cn.js"></script>
		<%--对话框js--%>
		<script src="${pageContext.request.contextPath}/others/forlearn/js/jconfirm/jquery-confirm.min.js"></script>

		<script type="text/javascript">

			//实例化Ueditor编辑器
			var um = UM.getEditor('myEditor');
                //新建笔记按钮点击事件，弹出新增笔记的窗口

                    // Media
                    // new MODALit({
                    //     el: '#add_note',
                    //     footer: false,
                    //     transition: 'zoom',
                    //     src:"/note/loadPage?pageSrc=alert_note"
                    // });
                $("#add_note").click(function () {
                    //清空标题
                    $("#input_note_title").val("");
                    //清空富文本编辑器
                    um.execCommand('cleardoc');
                    //清空编辑的笔记ID
                    $("#editNoteId").val("");

                    window.location.reload();
                });


                $("#save_note").click(function () {
                		var title = $("#input_note_title").val();
                		if(!title){
							errorTips("标题不能为空");
							return false;
						}
                		//获取富文本内容
					var contentTxt = um.getContentTxt();
                		if(!contentTxt){
							errorTips("笔记内容不能为空");
                			return false;
						}
						$("#noteForm").submit();
                });

			function errorTips(tip) {
				$.confirm({
					title: '错误提示',
					content: tip,
					type: 'red',
					typeAnimated: true,
					buttons: {
						close: {
							text: '关闭'
						}
					}
				});
			}

			$(".checked").click(function () {

				//获取笔记对象的id 并传入
				var tArticleId = $(this).attr("tArticleId");
				$("#editNoteId").val(tArticleId);

				//获取当前ID的属性值，并且将属性值的结果放在表单中
				um = UM.getEditor('myEditor');
				var tArticleArticle = $(this).attr("tArticleArticle");
				//$("#myEditor").val(tArticleArticle);
				um.focus();
				um.execCommand('forecolor','#000');
				um.setContent(tArticleArticle,false);
				//获取笔记头
				var tArticleTitle = $(this).attr("tArticleTitle");
				$("#input_note_title").val(tArticleTitle);
			});

        </script>
		</body>		
</html>