<%@ page language="java" pageEncoding="utf-8" import="com.shopping.model.User"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%-- <%@include file="/common/import.jsp" %> --%>
<%
String mypath = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+mypath+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>header-top</title>

<link rel="stylesheet" type="text/css" href="front/css/top.css" />
<jsp:include page="/common/import.jsp"></jsp:include>
</head>
<body>

<script type="text/javascript">
	$(function(){
		
		var flag = "<s:property value='#session.loginFlag'/>";
		if(flag == "true"){
			$("a[name='login']").show();
			$("a[name='quit']").hide();
			$("#account").attr("href", "front/account.jsp");
			$("#account").attr("target", "_blank");
			$("#order").attr("href", "front/account.jsp?choose=order");
			$("#order").attr("target", "_blank");
			
		}else{
			$("a[name='login']").hide();
			$("a[name='quit']").show();
		}
		
		
		/* easyloader.load(['window','messager'],function(){
			
		}); */
		$("#login-window").window({
			closed:true,
			title:"登录",
			cls:"c5",
			width:350,
			height:300,
			border:"thin",
			draggable:false,
			resizable:false,
			/* shadow:false, */	
			modal:true,
			collapsible: false,
			minimizable: false,
			maximizable: false,
			
			
		});
		
		$("#search-btn").click(function(){
			
			var search = $("#search-input").val();
			//search = search.replace("[\\p{Punct}\\p{Space}]+", "");
			//alert(search);
			if(search != null){
				var path = "<%=mypath%>" + "/";
				var url = path + "front/Product-frontSearch?search=" + search + "&page=" + 1;
				url = encodeURI(url);
				url = encodeURI(url);
				//alert(url);
				window.location.assign(url);
			}
		});
		
		
	})
	
	
	
	
	
	function openWindows(){
		var flag = "<s:property value='#session.loginFlag'/>";
		if(flag != "true"){
			$("#login-form")[0].reset();
			$(".form-item-error").hide();
			$("#login-window").window({
				closed:false,
			});
			
		}
		
	}
	
	function login(){
		var username = $("#username").val();
		var userpwd = $("#userpassword").val();
		//alert(username);
		//alert(userpwd);
		if(username == "" || userpwd == ""){
			$(".form-item-error").text("请输入用户名与密码！");
			$(".form-item-error").show();
			//return false;
		}else{
			$.post(
				"front/User-login",
				{
					"user.username":$("#username").val(),
					"user.password":$("#userpassword").val()
				},
				function(result){
					//alert(result.flag);
					if(result.flag == "ok"){
						var url = window.location.href;
						//alert(url);
						window.location.assign(url);
					}else if(result.flag == "repeat"){
						$(".form-item-error").show();
						$(".form-item-error").text("您已经登录！");
					}else{
						$(".form-item-error").show();
						$(".form-item-error").text("用户名或密码错误！");
					}
				}
			);
			//$("#login-form").submit();
			
			
			//return true;
		}
		
	}
	
</script>



<div id="header">
<div class="header-top">
	<div class="header-title"><font color="color:#666666px;">您好，欢迎光临！</font></div>
	<div class="header-menu">
		<ul class="menu-list">
			
			<li><a name="quit" href="javascript:;" onclick="openWindows()">请登录</a></li>
			<li><a name="quit" href="front/register.jsp" target="_blank">免费注册</a></li>
			<li><a  name="login" href="front/account.jsp" target="_blank"><s:property value="#session.loginUser.username"/></a></li>
			<li><a name="login" href="front/User-quit">退出</a></li>
			<li><a id="account" href="javascript:;" onclick="openWindows()">我的账户</a></li>
			<li><a id="order" href="javascript:;" onclick="openWindows()">订单查询</a></li>
			<li><a id="cart" href="front/cart.jsp" target="_blank">购物车</a></li>
		</ul>
	</div>
	
</div>
</div>

<div class="index-search">
	<div class="w">
		<a class="logo" href="front/index.jsp"></a>
		<div class="search">
			<input id="search-input" type="text" class="text" />
			<button id="search-btn" class="button">搜索</button>
		</div>
	</div>
</div>
	<hr color="#c81623" style="margin: 1px;">
	

<!-- <div id="login" class="easyui-window">
	sg sdg
</div> -->


<!-- 登录窗口 -->
<div  id="login-window">
	<form id="login-form" action="front/User-login"  method="post">
		<input id="url" name="url" type="hidden" value=""/>
		<div class="login-form">
			<div class="form-item-error">s</div>
			<div class="form-item">
				<div class="form-item-name"></div>
				<input id="username" class="form-item-itxt" type="text" name="user.username" placeholder="用户名" autocomplete="off">
			</div>
			<div class="form-item">
				<div class="form-item-pwd"><!-- <img style="width:40;height:38;" src="front/front_image/name-icons.png"> --></div>
				<input id="userpassword" class="form-item-itxt" type="password"  name="user.password" placeholder="密码" autocomplete="off">
			</div>
			<div class="form-item">
				<a class="form-item-submit" href="javascript:;"  onclick="login()"><span>登&nbsp;&nbsp;录</span></a>

			</div>
		</div>
	</form>
</div>
	
	
</body>
</html>