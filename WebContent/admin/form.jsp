<%@ page language="java" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>用户注册</title>

<script type="text/javascript" src="easyui-1.3.6/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui-1.3.6/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyui-1.3.6/themes/icon.css" />
<script type="text/javascript" src="easyui-1.3.6/jquery.easyui.min.js"></script>

<script type="text/javascript" src="easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>

<script type="text/javascript">

	$(function(){
		$.extend($.fn.validatebox.defaults.rules, { 
			umidLength:{
				validator:function(value, param){
					return value.length >= param[0] && value.length <= param[1];
				},
				message:"用户名在2到5个字符之间"
			},
			
			pwdmidLength:{
				validator:function(value, param){
					return value.length >= param[0] && value.length <= param[1];
				},
				message:"密码在6到12个字符之间"
			},
			
			
			equal:{
				validator:function(value, param){
					return $(param[0]).val() == value;
				},
				message:"两次密码不匹配"
			}
			
		}); 
		
		 $("#btn").click(function(){
			 if( !$("#form").form("validate") ){
					$.messager.show({
						title:"提示信息",
						msg:"请填入正确的注册信息！"
					});
					return false;
			}
				$.ajax({
					type:"post",
					url: getFlag(flag),   //flag == "add"?"User-register":"User-update",
					cache:false,   //是否清空缓存	
					data:$("#form").serialize(),  //发送的表单数据
					dataType:"text",  //服务器返回时接收的数据类型
					
					//提交成功时
					success:function(result){
						$.messager.alert("提示", "修改成功！");
						$("#User-list").datagrid("reload");
						$("#dialog").dialog("close");
					},  
					//提交失败时
					error:function(result){
						$.messager.alert("提示", "修改失败！");
					}
				});
			});
	});
</script>
	


	<form id="form" action="" method="post" name="myform"> 
		<table  align="center">
			<p></p>
			<input type="hidden" name="user.id" value=""/>
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
</body>
</html>