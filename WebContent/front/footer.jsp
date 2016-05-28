<%@ page language="java" pageEncoding="utf-8"%>

<%
String mypath = request.getContextPath();
String mybasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+mypath+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=mybasePath%>">
<title>尾部</title>

<link rel="stylesheet" type="text/css" href="front/css/footer.css" />


</head>
<body>
<div id="container">
         <div id="container1">
         	<!-- <hr width="1050px;"> -->
         	<div class="footer">
         		<hr width="1050px;">
         		<div class="info">网上商城  &nbsp;&nbsp;&nbsp;V1.0</div>
         	</div>
         </div>
</div>

<!-- <div class="footer">adddddddddddd</div> -->
</body>
</html>