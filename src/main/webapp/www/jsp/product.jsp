<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="/WEB-INF/pageTag.tld" %>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>产品中心</title>
		
		<script type="text/javascript" src="<%=path%>/www/js/jquery-1.11.0.min.js"></script>
		
		<link rel="stylesheet" href="<%=path%>/www/js/lightbox/css/lightbox.css" type="text/css"></link>
		<script type="text/javascript" src="<%=path%>/www/js/lightbox/js/lightbox.min.js"></script>
		
		<style type="text/css">
			#gallery {
				padding: 10px;
				width: 100%;
			}
			#gallery ul { list-style: none; }
			#gallery ul li { display: inline; }
			#gallery ul img {
				border: 1px solid #DEDEDE;
				border-width: 1px 1px 1px;
			}
			#gallery ul a:hover img {
				border: 1px solid #88C110;
				border-width: 1px 1px 1px;
				color: #fff;
			}
			#gallery ul a:hover { color: #fff; }
		</style>
	</head>
	<body>
		<div class="page_style">
			<jsp:include page="top.jsp"></jsp:include>
			
			<div class="lanmu_box_style1" id="sublanmu_style1">
				<div class="lanmu_box_style1_left" id="sublanmu_style1_left">
					<div id="Nav_7" class="nav_box" style="">
						<div class="nav_title" style="">
							<span class="nav_sign" style="">产品中心</span>
						</div>
						<div id="Nav_Menu_7" class="nav_menu" style="">
							<ul>
								<c:forEach items="${productTypeList}" var="productType">
		    						<c:if test="${productType.map.parent==1}">
				        				<li id="Nav_menulist_6" class="nav_menu_list" style="">
				        					<a href="<%=path%>/www/product?map[producttype]=${productType.map.producttype}"
				        						class="nav_submenu_href">${productType.map.producttypename}</a>
				        					<ul id="Nav_submenu_6" style="">
						        				<c:forEach items="${productTypeList}" var="productType2">
						        					<c:if test="${productType2.map.parent==productType.map.producttype}">
						        						 <li class="nav_submenu_list">
						        							<a href="<%=path%>/www/product?map[producttype]=${productType2.map.producttype}"
						        								class="nav_submenu_href">${productType2.map.producttypename}</a>
						        						</li>
						        					</c:if>
						        				</c:forEach>
						        			</ul>
				        				</li>
				        			</c:if>
				        		</c:forEach>
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
									<a href='<%=path%>/www/product'>产品中心</a> &gt;
									<a href="<%=path%>/www/product">产品列表</a>
								</li>
								<li class="uc_lanmu_site_2">
									产品列表
								</li>
							</ul>
						</div>
						<div class="uc_lanmu_content" id="gallery">
							<ul>
								<c:forEach items="${productList}" var="product">
									<li>
										<a href="<%=path%>/resources/picture/${product.map.picturename}" data-lightbox="example-set" data-title="${product.map.productname}">
											<img src="<%=path%>/resources/picture/${product.map.picturename}"
												border="0" width="160px" height="113px"></img>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<page:page pageNum="${pageNum}" rscount="${rscount}" action="/www/product" className="text"></page:page>
				</div>
				<div class="clear" id="sublanmu_style1_bottom"></div>
			</div>
			
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</body>
</html>