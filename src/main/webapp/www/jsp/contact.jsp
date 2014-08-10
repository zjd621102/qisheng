<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String tab = request.getParameter("tab");
	request.setAttribute("tab", tab); // 标签
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>联系我们</title>
	</head>
	<body>
		<div class="page_style">
			<jsp:include page="top.jsp"></jsp:include>
			
			<div class="lanmu_box_style1" id="sublanmu_style1">
				<div class="lanmu_box_style1_left" id="sublanmu_style1_left">
					<div id="Nav_16" class="nav_box" style="">
						<div class="nav_title" style="">
							<span class="nav_sign" style="">联系我们</span>
						</div>
						<div id="Nav_Menu_16" class="nav_menu" style="">
							<ul>
								<li id="Nav_menulist_25" class="nav_menu_list" style="">
									<a href="<%=path%>/www/jsp/contact.jsp"
										class="nav_menu_href" target="_self"
										onclick="ShowItem('Nav_submenu_25','')">联系方式</a>
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
									<a href='<%=path%>/www/jsp/contact.jsp'>联系我们</a> &gt;
									<a href="<%=path%>/www/jsp/contact.jsp">联系方式</a>
								</li>
								<li class="uc_lanmu_site_2">
									联系方式
								</li>
							</ul>
						</div>
						<div class="uc_lanmu_content">
							<p>
								<img height="200" hspace="5" width="650" vspace="10" border="0" alt="" src="<%=path%>/www/images/Hztt_2009-01-03_12-02-54_609.gif" />
							</p>
							<table style="border: 1px solid rgb(221, 221, 221); width: 99%;" align="center" border="1" cellpadding="5" cellspacing="0">
   								<tbody>
							        <tr class="L15">
							            <td bgcolor="#e8e8e8" height="21" width="20%">
							            	<div align="center">公司名称：</div>
							            </td>
							            <td height="21" width="80%">岐盛卫浴</td>
							        </tr>
							        <tr class="L15">
							            <td bgcolor="#e8e8e8" height="21" width="20%">
							            	<div align="center">公司地址：</div>
							            </td>
							            <td height="21" width="80%">福建省南安市中国水暖城</td>
							        </tr>
							        <tr class="L15">
							            <td bgcolor="#e8e8e8" height="21" width="20%">
							            	<div align="center">邮政编码：</div>
							            </td>
							            <td height="21" width="80%">362300</td>
							        </tr>
							        <tr class="L15">
							            <td bgcolor="#e8e8e8" height="21" width="20%">
							            	<div align="center">联系电话：</div>
							            </td>
							            <td height="21" width="80%">0595-86211027</td>
							        </tr>
							        <tr class="L15">
							            <td bgcolor="#e8e8e8" height="21" width="20%">
							            	<div align="center">联&nbsp;系&nbsp;人：</div>
							            </td>
							            <td height="21" width="80%">周XX先生</td>
							        </tr>
							        <tr class="L15">
							            <td bgcolor="#e8e8e8" height="21" width="20%">
							            	<div align="center">公司QQ：</div>
							            </td>
							            <td height="21" width="80%">530512364</td>
							        </tr>
							        <tr class="L15">
							            <td bgcolor="#e8e8e8" height="21" width="20%">
							            	<div align="center">公司邮箱：</div>
							            </td>
							            <td height="21" width="80%">zjd621102@163.com</td>
							        </tr>
   								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="clear" id="sublanmu_style1_bottom"></div>
			</div>
			
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</body>
</html>