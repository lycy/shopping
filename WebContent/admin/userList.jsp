<%@ page language="java" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width:100%;heigth:100%;">
<head>
<base href="<%=basePath%>">
<title>用户列表</title>

<jsp:include page="/common/import.jsp"></jsp:include>
<script type="text/javascript" src="admin/admin_image/userList.js"></script>

</head>
<body style="width:100%;heigth:100%;">
	<div id="layout" class="easyui-layout" fit="true" style="width:100%;heigth:100%;">
		<div id="center" region="center">
			<table id="User-list" fit="true"></table>
		</div>
	</div>
	
	<!-- <div id="dialog" class="easyui-dialog" modal="true" closed="true">
		<form id="form" action="" method="post" name="myform"> 
		<table  align="center">
			<p></p>
			<tr><td><input type="hidden" name="user.id" value=""/></td></tr>
			<tr><td><input type="hidden" name="user.rdate" value=""/></td></tr>
			<tr><td><input type="hidden" name="user.sex" value=""/></td></tr>
			<tr>
				<td >用户名:</td>
				<td ><input type="text" name="user.username"  style="width:155px" class="easyui-validatebox" validType="umidLength[2,5]"
						required=true missingMessage="用户名必填"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr>
				<td >密码:</td>
				<td><input id="pwd" type="password" name="user.password" style="width:155px" class="easyui-validatebox" validType="pwdmidLength[6,12]"  
						required=true missingMessage="密码必填"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr>
				<td >密码确认:</td>
				<td><input id="pwd2" type="password" name="user.password2" style="width:155px" class="easyui-validatebox" validType="equal['#pwd']"
						required=true missingMessage="密码必填"/></td>
			</tr>
			<tr><td><p></p></td></tr>
			
			<tr>
				<td >电话：</td>
				<td><input id="phone" type="text" name="user.phone" style="width:155px" /></td>
			</tr>
			<tr><td><p></p></td></tr>
			
			<tr>
				<td>送货地址：</td>
				<td><input type="text" name="user.addr" style="width:155px" /></td>
			</tr>
			<tr><td><p></p></td></tr>
			
			<tr>
				<td>兴趣爱好：</td>
				<td>
					<select class="easyui-combobox" name="user.interests" style="width:155px" multiple="true">
						<option value="图书">图书</option>
						<option value="运动">运动</option>
						<option value="食品">食品</option>
						<option value="家用电器">家用电器</option>
						<option value="手机/数码">手机/数码</option>
					</select>
				</td>
			</tr>
			<tr><td><p></p></td></tr>
			<tr align="center">
				<td colspan="2"><a id="btn" class="easyui-linkbutton">提交</a></td>
			</tr>
		</table>
	</form>
	</div> -->
</body>
</html>