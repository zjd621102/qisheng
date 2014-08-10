<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/jsp/pub/include.jsp"%>

<script type="text/javascript">
	// 上传成功
	function uploadifySuccess(file, data, response) {
		if(response == true) {
			$.pdialog.reload("<%=path%>/product/edi/${form.map.productid}", {data:{}, dialogId:"product_edi", callback:null});
		} else {
			
		}
	}
	
	// 上传完成
	function uploadifyQueueComplete(file) {
		
	}
</script>

<div class="pageContent">
	<form method="post" action="<%=path%>/product/edi" class="required-validate pageForm"
	 onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="map[productid]" value="${form.map.productid}"/>
		<div class="pageFormContent">
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
						value="${form.map.realprice}"/>
				</dd>
			</dl>
			<dl>
				<dt>新增日期：</dt>
				<dd>
					<input type="text" name="map[createdate]" class="required" size="30" maxlength="19"
						value="${form.map.createdate}" readonly="readonly"/>
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<input type="text" name="map[remark]" size="30" maxlength="256"
						value="${form.map.remark}"/>
				</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd></dd>
			</dl>
		</div>
		<div class="pageFormContent" layoutH="201">
			<table>
				<tr>
					<td>
						<input id="testFileInput" type="file" name="image" 
							uploaderOption="{
								swf:'<%=path%>/js/uploadify/scripts/uploadify.swf',
								uploader:'<%=path%>/product/upload',
								formData:{productid:${form.map.productid}},
								buttonText:'请选择文件',
								fileSizeLimit:'200KB',
								fileTypeDesc:'*.jpg;*.jpeg;*.gif;*.png;',
								fileTypeExts:'*.jpg;*.jpeg;*.gif;*.png;',
								auto:true,
								multi:true,
								onUploadSuccess:uploadifySuccess,
								onQueueComplete:uploadifyQueueComplete
							}"
						/>
					</td>
					<td>
						<c:if test="${not empty form.map.picturename}">
							<img alt="" src="<%=path%>/resources/picture/${form.map.picturename}"
								style="width: 200px; height: 200px;" />
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>