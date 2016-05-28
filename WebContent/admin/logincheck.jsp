
<%
	Object loginFlag = session.getAttribute("adminFlag");
	if(loginFlag == null || !"true".equals(loginFlag)){
		response.sendRedirect("login.jsp");
	}
%>
