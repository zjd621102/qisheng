<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/jsp/pub/include.jsp"%>
<c:if test="${act=='excel'}">
<%
	response.setContentType("application/vnd.ms-excel;charset=UTF-8");
	String excelname=new String("用户列表.xls".getBytes("UTF-8"),"iso8859-1");
	response.setHeader("Content-disposition","inline; filename="+excelname);
%>
<style type="text/css">
	td {
		border-right: thin solid #DADCDD;
		border-bottom: thin solid #DADCDD;
		mso-number-format:'\@';
	}
	
	table {
		border: thin hidden #DADCDD;
		text-align: center;
	}
</style>
</c:if>
<c:if test="${act!='excel'}">
	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);" action="<%=path%>/user/list" method="post" rel="pagerForm" id="fid">
			<input type="hidden" name="act" id="act" />
			<div class="searchBar">
				<table class="searchContent" style="width: 80%">
					<tr>
						<td>
							用户姓名：<input type="text" name="map[username]" value="${form.map.username}"/>
						</td>
					</tr>
				</table>
				<div class="subBar">
					<ul>
						<li>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">查询</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</c:if>
<div class="pageContent">
	<c:if test="${act!='excel'}">
		<div class="panelBar">
			<ul class="toolBar">
				<li>
					<a class="add" href="<%=path%>/user/add" target="dialog" rel="user_add">
						<span>新增用户</span>
					</a>
				</li>
				<li>
					<a class="edit" href="<%=path%>/user/edi/{s_userid}" target="dialog" rel="user_edi">
						<span>修改用户</span>
					</a>
				</li>
				<li>
					<a class="delete" href="<%=path%>/user/delete/{s_userid}" target="ajaxTodo" title="确定要删除吗?">
						<span>删除用户</span>
					</a>
				</li>
				<li>
					<a class="delete" href="<%=path%>/user/delete/0" target="selectedTodo" rel="ids"
				 	 title="确实要删除这些记录吗?">
				 		<span>批量删除用户</span>
				 	</a>
				</li>
				<li class="line">line</li>
				<li>
					<a class="icon" href="<%=path%>/user/list?act=excel" target="dwzExport" targetType="navTab"
				 		title="确实要导出这些记录吗?">
				 		<span>导出EXCEL</span>
				 	</a>
				</li>
			</ul>
		</div>
	</c:if>
	<table class="table" style="width: 100%;" layoutH="138">
		<thead>
			<tr style="width: 1000px;">
				<c:if test="${act!='excel'}">
					<th width="10%">
						<input type="checkbox" group="ids" class="checkboxCtrl">
					</th>
				</c:if>
				<th width="30%">序号</th>
				<th width="30%">用户名</th>
				<th width="30%">手机号码</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="bean" varStatus="vs">
			   	<tr target="s_userid" rel="${bean.map.userid}">
			   		<c:if test="${act!='excel'}">
			   			<td>
			   				<input name="ids" value="${bean.map.userid}" type="checkbox">
			   			</td>
			   		</c:if>
			   		<td>${vs.index+1}</td>
			   		<td>${bean.map.username}</td>
			   		<td>${bean.map.tele}</td> 
			   	</tr>
		   	</c:forEach>
	   	</tbody>
	</table>
	<c:if test="${act!='excel'}">
		<jsp:include page="../pub/paged.jsp"></jsp:include>
	</c:if>
</div>