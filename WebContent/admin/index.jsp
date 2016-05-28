<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="logincheck.jsp" %>

<%
String mypath = request.getContextPath();
String mybasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+mypath+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width:100%;height:100%;">
<head>
<base href="<%=mybasePath%>">
<title>后台管理</title>

<jsp:include page="/common/import.jsp"></jsp:include>

<style type="text/css">

#north{
	height:80px;
	background-image: url(admin/admin_image/header.jpg);
	background-size:100% 100%;
}

#north .fl{
	float:left;
	margin-top: 17px;
	margin-left: 100px
}
.flfont{
	 font: 50px Arial, Verdana, "宋体";
}
#north .fr{
	float:right;
	margin-right: 40px;
	margin-top: 50px;
}
</style>


<script type="text/javascript">
	$(function(){
		
		$("#menu").tree({
			url:"admin/admin_image/menu-data.json",
			onClick:function(node){
				var src = node.attributes.url;
				var title = node.text;
				//alert(src);
				if($("#mytabs").tabs("exists", title)){
					$("#mytabs").tabs("select", title);
				}else{
					$("#mytabs").tabs("add", {
						title:title,
						content:"<iframe frameborder=0 style=width:100%;height:100% src="+ src + "></iframe>",
						closable:"true"
					});
				} 
			}
		});
	
	});
	
</script>

</head>
<body style="width:100%;height:100%;">
	<div id="layout" class="easyui-layout" fit="true" style="width:100%;height:100%;">
		<div id="north" region="north">
			<div class="fl"><font class="flfont">后台管理</font></div>
			<div class="fr">
				<font >用户名：<s:property value="#session.name"/></font>
			</div>
		</div>
		<div id="west" region="west" title="菜单列表" style="width:150px;">
			<ul id="menu"></ul>
		</div>
		
		<div id="center" region="center" style="">
			<div id="mytabs" class="easyui-tabs" fit="true">
				<div title="首页">
					
				</div>
			</div>
		</div>
		<div id="south" region="south" title="south" style="height:20px;"></div>
	</div>
</body>
</html>