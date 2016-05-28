<%@ page language="java" pageEncoding="utf-8"%>

<%
String mypath = request.getContextPath();
String mybasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+mypath+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=mybasePath%>">
<title>产品列表</title>

<jsp:include page="/common/import.jsp"></jsp:include>
<script type="text/javascript" src="admin/admin_image/productList.js"></script>

<style type="text/css">
.search-product{
	border: 1px solid #99BBE8;
	background-color: #EFEFEF;
}

.search-area{
	display: none;
	margin-left: 15%;
}

#openOrClose{

	
	display: block; 
	cursor: pointer;
	background: url(admin/admin_image/open.jpg) 0 0 no-repeat;
    margin: 0px auto;
	padding: 0px;
	width: 50px;
	height: 5px;

}

</style>


</head>
<body class="easyui-layout">

<div id="body" region="center">
	<div class="search-product">
		<div class="search-area">
			商品类别：
			<select id="search-Category1" class="easyui-combobox" style="width:100px"></select>
			<select id="search-Category2" class="easyui-combobox" style="width:100px"></select>
			<select id="search-Category3" class="easyui-combobox" name="productDTO.pid" style="width:100px"></select>
			<a id="search-btn1" class="easyui-linkbutton" style="width:50px;">查询</a>
			<a id="search-btn2" class="easyui-linkbutton" style="width:80px;">全部商品</a>
		</div>
		<span id="openOrClose" ></span> 	
	</div>
	
	<table id="Product-list" ></table>
	
	
	<div id="dialog" class="easyui-dialog" modal="true" closed="true" style="width:450px" draggable="false">
		<form id="form" action="" method="post"> 
		<table  align="center">
			<tr><td><input type="hidden" name="productDTO.id" value=""/></td></tr>
			<tr><td><input type="hidden" name="productDTO.pdate" value=""/></td></tr>
			<tr>
				<td >商品名:</td>
				<td ><input type="text" name="productDTO.name"  style="width:155px"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr>
				<td >商品数量:</td>
				<td><input type="text" name="productDTO.number" style="width:155px" class="easyui-numberbox"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr>
				<td >商品价格:</td>
				<td><input type="text" name="productDTO.marketprice" style="width:155px" class="easyui-numberbox"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr>
				<td >是否推广:</td>
				<td><input type="text" name="productDTO.promote" style="width:155px"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr>
				<td>所属类别：</td>
				<td>
					<select id="Category1" class="easyui-combobox" style="width:100px"></select>
					<select id="Category2" class="easyui-combobox" style="width:100px"></select>
					<select id="Category3" class="easyui-combobox" name="productDTO.pid" style="width:100px"></select>
				</td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr>
				<td >商品图片路径:</td>
				<td ><input type="text" name="productDTO.url"  style="width:260px"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			
			<tr>
				<td >商品描述：</td>
				<td><textarea name="productDTO.descr" cols="30" rows="2"></textarea></td>
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

</div>
</body>
</html>