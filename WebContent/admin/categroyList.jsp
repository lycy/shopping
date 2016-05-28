<%@ page language="java" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width:100%;heigth:100%;">
<head>
<base href="<%=basePath%>">
<title>分类列表</title>

<jsp:include page="/common/import.jsp"></jsp:include>
<script type="text/javascript" src="admin/admin_image/categroyList.js"></script>

</head>
<body style="width:100%;heigth:100%;">
	<div id="layout" class="easyui-layout" fit="true" style="width:100%;heigth:100%;">
		<div id="center" region="center">
			<table id="Categroy-list" fit="true"></table>
		</div>
	</div>
	
	<div id="menu" class="easyui-menu" style="width:120px">
		<div onclick="add()">添加商品类别</div>
		<div onclick="update()">修改商品类别</div>
		<div onclick="Remove()">删除商品类别</div>
	</div>
	
	
	<div id="dialog" class="easyui-dialog" modal="true" closed="true" title="添加商品类别" draggable="false">
		<form id="form" action="" method="post" name="myform"> 
		<table  align="center">
			<p></p>
			<tr><td><input type="hidden" name="categroyDto.parent_id" value=""/></td></tr>
			<tr><td><input type="hidden" name="categroyDto.id" value=""/></td></tr>
			<tr>
				<td >商品类别名称:</td>
				<td ><input type="text" name="categroyDto.name"  style="width:155px"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr>
				<td >描述:</td>
				<td><textarea name="categroyDto.descr" cols="30" rows="4"></textarea></td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr align="center">
				<td colspan="2">
	  				<a id="btn1" class="easyui-linkbutton">确定</a>
	  				<a id="btn2" class="easyui-linkbutton">取消</a>
  				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
</body>
</html>