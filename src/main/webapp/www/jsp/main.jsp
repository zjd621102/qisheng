<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>岐盛卫浴</title>
		
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
			
			p {
				line-height: 22px;
			}
		</style>
	</head>

	<body>
		<div class="page_style">
			<jsp:include page="top.jsp"></jsp:include>
			
			<div class="lanmu_box_style1" id="lanmu_style1">
				<div class="lanmu_box_style1_left" id="lanmu_style1_left">
					<div id="Nav_13" class="nav_box" style="">
						<div class="nav_title" style="">
							<span class="nav_sign" style="">公司简介</span>
							<span class="nav_more" style="display: none;">
								<a href="">more</a>
							</span>
						</div>
						<div id="Nav_Conent_13" class="nav_content" style="height: 357px;">
							<p style="text-indent: 2em">
							 岐盛卫浴有限公司是一家集卫浴产品及配件研发、制造、销售和服务为一体的公司。孕育了一大批技术研发人员与营销管理团队，短短数年，成为了卫浴行业一颗闪亮的新星。</p>
							<p style="text-indent: 2em">
							  海纳百川，和谐共赢。 岐盛卫浴有限公司加快发展的步伐，整合行业资源，服务一条龙的营销服务体系。营销网络遍布大江南北，深入海内外。</p>
							<p style="text-indent: 2em">
							 简约而不简单，风尚引领时尚；健康彰显尊贵，实用诠释大方。</p>
						</div>
					</div>
				</div>
				<div class="lanmu_box_style1_right" id="lanmu_style1_right" style="float: left;">
					<div id="Template_25" class="template_box" style="width: 100%;">
						<div class="nav_title" style="border-bottom-width: 1px;">
							<span class="template_sign" style="">新品推荐</span>
							<span class="template_more" style="display: none;">
								<a href="" target="_self">more</a>
							</span>
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
				</div>
			</div>
			
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</body>
</html>