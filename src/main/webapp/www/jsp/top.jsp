<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>岐盛卫浴</title>
		
		<link rel="stylesheet" href="<%=path%>/www/css/lanmu.css" type="text/css"></link>
		
		<script type="text/javascript" src="<%=path%>/www/js/jquery-1.11.0.min.js"></script>
		
		<style type="text/css">
			body {
				text-align: center;
			}
			.new_bc {
				background-color:#008BE8;
			}
			.change_bc {
				background-color:#0061A0;
			}
		</style>
		<script type="text/javascript">
			function change_bc(obj) {
				$('.menu_box_style1_2 ul li a').removeClass('menu_current_1');
				$('.menu_box_style1_2 ul li a').addClass('menu_1');
				$(obj).children('a').addClass('menu_current_1');
			}
		</script>
	</head>
	<body>
		<div class="page_style">
			<div class="menu_box">
				<div class="menu_box_style1_1">
					<ul>
						<li class="menu_box_style1_1_1">
							<img id="ctl00_Logo_image" src="<%=path%>/www/images/logo.png" style="border-width: 0px;" border="0">
						</li>
						<li class="menu_box_style1_1_2"></li>
						<li class="clear"></li>
					</ul>
				</div>

				<div class="menu_box_style1_2" id="MainMenu">
					<ul>
						<li class="menu_style_1">
							<a href="<%=path%>/www/main" class="${empty tab? 'menu_current_1' : 'menu_1'}" id="Menu_19">首页</a>
						</li>
						<%-- 
						<li class="menu_style_1">
							<a href="<%=path%>/www/jsp/about.jsp" class="menu_1" id="Menu_24">关于我们</a>
						</li>
						--%>
						<li class="menu_style_1">
							<a href="<%=path%>/www/product?tab=product" class="${'product' == tab? 'menu_current_1' : 'menu_1'}" id="Menu_21">产品中心</a>
						</li>
						<%-- 
						<li class="menu_style_1">
							<a href="<%=path%>/www/jsp/news.jsp" class="menu_1" id="Menu_38">新闻资讯</a>
						</li>
						--%>
						<li class="menu_style_1">
							<a href="<%=path%>/www/jsp/contact.jsp?tab=contact" class="${'contact' == tab? 'menu_current_1' : 'menu_1'}" id="Menu_38">联系我们</a>
						</li>
						<%-- 
						<li class="menu_style_1">
							<a href="<%=path%>/login" class="menu_1" id="Menu_23" target="_blank">后台管理</a>
						</li>
						--%>
					</ul>
				</div>
				<div>
					<img height="100" width="1000" border="0" style="margin: 0; padding: 0;" src="<%=path%>/www/images/top.jpg" />
				</div>
			</div>
		</div>
	</body>
</html>