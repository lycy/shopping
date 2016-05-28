<%@ page language="java" pageEncoding="utf-8"%>

<%-- <%@ include file="loginCheck.jsp" %> --%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>商城主页</title>




</head>
<body>
	
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="main.jsp"></jsp:include>
	
	

</body>
</html>