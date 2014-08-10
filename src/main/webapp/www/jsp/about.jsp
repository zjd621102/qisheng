<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>关于我们</title>
	</head>
	<body>
		<div class="page_style">
			<jsp:include page="top.jsp"></jsp:include>
			
			<div class="lanmu_box_style1" id="sublanmu_style1">
				<div class="lanmu_box_style1_left" id="sublanmu_style1_left">
					<div id="Nav_16" class="nav_box" style="">
						<div class="nav_title" style="">
							<span class="nav_sign" style="">关于我们</span>
						</div>
						<div id="Nav_Menu_16" class="nav_menu" style="">
							<ul>
								<li id="Nav_menulist_25" class="nav_menu_list" style="">
									<a href="<%=path%>/www/jsp/about.jsp"
										class="nav_menu_href" target="_self"
										onclick="ShowItem('Nav_submenu_25','')">公司简介</a>
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
									<a href="<%=path%>/www/struts/main_index.action">首页</a> &gt;
									<a href='<%=path%>/www/about.jsp'>关于我们</a> &gt;
									<a href="<%=path%>/www/about.jsp">公司简介</a>
								</li>
								<li class="uc_lanmu_site_2">
									公司简介
								</li>
							</ul>
						</div>
						<div class="uc_lanmu_content" style="height: 364px;">
							<p>
								<img hspace="5" align="right" vspace="5" border="0" alt="" src="<%=path%>/www/images/Hztt_2009-01-03_11-25-57_000.jpg"/>
								
							</p>
						</div>
					</div>
				</div>
				<div class="clear" id="sublanmu_style1_bottom"></div>
			</div>
			
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</body>
</html>