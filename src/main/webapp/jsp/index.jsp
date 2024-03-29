<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>

<link href="<%=path%>/themes/default/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=path%>/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=path%>/themes/css/print.css" rel="stylesheet" type="text/css" media="print" />
<link href="<%=path%>/themes/css/custom.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=path%>/css/public.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE]>
<link href="<%=path%>/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->
<script src="<%=path%>/js/speedup.js" type="text/javascript"></script>
<script src="<%=path%>/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/jquery.cookie.js" type="text/javascript"></script>
<script src="<%=path%>/js/jquery.validate.js" type="text/javascript"></script>
<script src="<%=path%>/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="<%=path%>/js/dwz.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="<%=path%>/js/public.js" type="text/javascript"></script>

<link rel="stylesheet" href="<%=path%>/js/uploadify/css/uploadify.css"></link>
<script src="<%=path%>/js/uploadify/scripts/jquery.uploadify.js"></script>

<script type="text/javascript">
	$(function() {
		DWZ.init("<%=path%>/resources/dwz.frag.xml", {
			loginTitle : "登录", // 弹出登录对话框
			loginUrl:"<%=path%>/loginDialog",	// 跳到登录页面
			statusCode : {
				ok : 200,
				error : 300,
				timeout : 301,
				forbidden: 403
			}, //【可选】
			pageInfo : {
				pageNum : "pageNum",
				numPerPage : "numPerPage",
				orderField : "orderField",
				orderDirection : "orderDirection"
			}, //【可选】
			debug : false, // 调试模式 【true|false】
			callback : function() {
				initEnv();
				$("#themeList").theme({
					themeBase : "themes"
				}); // themeBase 相对于index页面的主题base路径
			}
		});
	});
</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="<%=path%>/index">标志</a>
				<ul class="nav">
					<li>
						<a href="<%=path%>/index">主页</a>
					</li>
					<li>
						<a href="<%=path%>/user/changePasswd" target="dialog" width="600">修改密码</a>
					</li>
					<li>
						<a href="<%=path%>/logout">退出</a>
					</li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
			<!-- navMenu -->
		</div>
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>主菜单</h2>
					<div>收缩</div>
				</div>
				<div class="accordion" fillSpace="sidebar">
					<c:forEach var="level1" items="${menuSessionInfo}">
						<c:if test="${level1.map.parentid==1}">
							<div class="accordionHeader">
								<h2>
									<span>Folder</span>${level1.map.modulename}
								</h2>
							</div>
							<div class="accordionContent">
								<ul class="tree treeFolder">
									<c:forEach var="level2" items="${menuSessionInfo}">
										<c:if test="${level2.map.parentid==level1.map.moduleid}">
											<li>
												<a href="<%=path%>${level2.map.url}" target="navTab" rel="${level2.map.rel}">
													${level2.map.modulename}
												</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main">
								<a href="javascript:;">
									<span>
										<span class="home_icon">我的主页</span>
									</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<div class="right">

							</div>
							<p>
								<span>欢迎登录QS管理系统！</span>
							</p>
						</div>
					
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		Copyright &copy; 2012
		也棵呀小柏杨
		Tel：15060066759
	</div>
</body>
</html>