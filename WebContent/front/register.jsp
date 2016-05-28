<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>用户注册</title>

<link rel="stylesheet" type="text/css" href="front/css/register.css" />
<jsp:include page="/common/import.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		/* if("<s:fielderror> <s:param>username</s:param></s:fielderror>" != null ){
			$("input[name='user.username']").val("<s:property value='user.username'/>");
		} */
	});

	function register(){
		//alert("d");
		$("#register-form").submit();
		//alert("a");
	}
	
</script>

</head>
<body>
	
<div id="container">
	<div id="container1">
		<div class="register-header">
			<a class="logo" href="front/index.jsp"></a>
			<div class="logo-title">欢迎注册</div>
		</div> 
		
		<hr style="width:700px;" align="left">

		<div class="register-main">
			<div class="register-form">
				<form action="front/User-register" id="register-form" method="post">
					<div class="item">
						<label>用户名</label>
						<input class="item-itext" type="text" name="user.username" placeholder="用户名，2到10个字符" value="<s:property value='user.username'/>">
					</div>
					<div class="item-top">
						<label>
							<s:fielderror> 
								<s:param>username</s:param>
							</s:fielderror>
						</label>
					</div>
						
					<div class="item">
						<label>密码</label>
						<input class="item-itext" type="password" name="user.password" placeholder="密码,6到12个字符" value="<s:property value='user.password'/>">
					</div>
					<div class="item-top">
						<s:fielderror> 
								<s:param>password</s:param>
						</s:fielderror>
					</div>
					
					<div class="item">
						<label>密码确认</label>
						<input class="item-itext" type="password" name="password" placeholder="请再次输入密码" value="<s:property value='password'/>">
					</div>
					<div class="item-top">
						<s:fielderror> 
								<s:param>password2</s:param>
						</s:fielderror>
					</div>
					
					<div class="item">
						<label>性别</label>
						<div class="item-sex">
							<input type="radio" value="女" name="user.sex" /><span>女</span>
							<input type="radio" name="user.sex" value="男" checked="checked"><span>男</span>
						</div>
					</div>
					<div class="item-top"></div>
					
					<div class="item">
						<label>电话</label>
						<input class="item-itext" type="text" name="user.phone" placeholder="请输入常用的电话号码" value="<s:property value='user.phone'/>"/>
					</div>
					<div class="item-top">
						<s:fielderror> 
								<s:param>phone</s:param>
						</s:fielderror>
					</div>
					
					<div class="item">
						<label>地址</label>
						<input class="item-itext" type="text" name="user.addr" placeholder="请输入正确的地址" value="<s:property value='user.addr'/>"/>
					</div>
					<div class="item-top"></div>
					
					<div class="item">
						<a class="item-submit" href="javascript:;"  onclick="register()"><span>注&nbsp;&nbsp;册</span></a>
					</div>
					<div class="item-top"></div>
				</form>
			</div>
		</div>

	</div>
</div>



</body>
</html>