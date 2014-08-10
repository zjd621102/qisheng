<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/jsp/pub/include.jsp"%>

<div class="pageContent">
	<form method="post" action="<%=path%>/product/add" class="required-validate pageForm"
	 onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<dl>
				<dt>产品编码：</dt>
				<dd>
					<input type="text" name="map[productno]" class="required" size="30" maxlength="17"
						value="${form.map.productno}" readonly="readonly"/>
				</dd>
			</dl>
			<dl>
				<dt>产品名称：</dt>
				<dd>
					<input type="text" name="map[productname]" class="required" size="30" maxlength="32"
						value="${form.map.productname}"/>
				</dd>
			</dl>
			<dl>
				<dt>产品类型：</dt>
				<dd>
					<input type="hidden" name="map[producttype]" value="${form.map.producttype}"/>
					<input type="text" name="map[producttypename]" size="30" value="${form.map.producttypename}"
						 readonly="readonly"/>
				</dd>
			</dl>
			<dl>
				<dt>计量单位：</dt>
				<dd>
					<select name="map[unit]" style="width: 184px;" class="required">
						<option value=""></option>
						<c:forEach items="${unitList}" var="unit">
							<option value="${unit.map.unitid}"
								${unit.map.unitid==form.map.unit?"selected":""}
							>
								${unit.map.unitname}
							</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>实际单价：</dt>
				<dd>
					<input type="text" name="map[realprice]" class="required number" size="30" maxlength="12"
						value="0.00"/>
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<input type="text" name="map[remark]" size="30" maxlength="256"
						value="${form.map.remark}"/>
				</dd>
			</dl>
		</div>
		
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>