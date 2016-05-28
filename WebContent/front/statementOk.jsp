<%@ page language="java" pageEncoding="utf-8"%>

<%
String mypath = request.getContextPath();
String mybasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+mypath+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=mybasePath%>">
<title>订单结算页</title>
</head>
<body>
结算成功！<a href="front/index.jsp">返回主页面</a>
</body>
</html>