<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>新闻资讯</title>
	</head>
	<body>
		<div class="page_style">
			<jsp:include page="top.jsp"></jsp:include>
			
			<div class="lanmu_box_style1" id="sublanmu_style1">
				<div class="lanmu_box_style1_left" id="sublanmu_style1_left">
					<div id="Nav_16" class="nav_box" style="">
						<div class="nav_title" style="">
							<span class="nav_sign" style="">新闻资讯</span>
						</div>
						<div id="Nav_Menu_16" class="nav_menu" style="">
							<ul>
								<li id="Nav_menulist_25" class="nav_menu_list" style="">
									<a href="<%=path%>/www/jsp/news.jsp"
										class="nav_menu_href" target="_self"
										onclick="ShowItem('Nav_submenu_25','')">新闻资讯</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="lanmu_box_style1_right" id="sublanmu_style1_right" style="float: left;">
					<div class="uc_lanmu_box">
						<div class="uc_lanmu_site">
							<ul>
								<li class="uc_lanmu_site_1">
									<a href="<%=path%>/www/main">首页</a> &gt;
									<a href='<%=path%>/www/jsp/news.jsp'>新闻资讯</a> &gt;
									<a href="<%=path%>/www/jsp/news.jsp">新闻资讯</a>
								</li>
								<li class="uc_lanmu_site_2">
									新闻资讯
								</li>
							</ul>
						</div>
						<div class="uc_lanmu_content" style="height: 364px;">
							暂无新闻！
						</div>
					</div>
				</div>
				<div class="clear" id="sublanmu_style1_bottom"></div>
			</div>
			
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</body>
</html>