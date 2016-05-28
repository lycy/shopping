
<%
	Object loginFlag = session.getAttribute("loginFlag");
	if(loginFlag == null || !"true".equals(loginFlag)){
		response.sendRedirect("login.jsp");
	}
%>
