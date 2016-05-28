<%@ page language="java" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
</head>
<body>
	<br><br>
	<p align="center">用户登录</p>
	<hr width="230">
	<form action="admin/Admin-login"  method="post">
		<table align="center" width="230" border="0"> 
			<tr height="30">
				<td>账号：</td>
				<td>
					<input type="text" name="adminNamer" >
				</td>
			</tr>
			<tr height="30">
				<td>密码：</td>
				<td>
					<input type="password" name="adminPwd" >
				</td>
			</tr>
			<!-- <tr height="30" align="center">
				<td colspan="2">
					<input type="checkbox" name="choose" value="true">自动登录
				</td>
			</tr> -->
			<tr height="40">
				<td colspan="2" align="center"> 
					<input type="submit" name="submit" value="登录">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>