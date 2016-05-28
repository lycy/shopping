<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%
String mypath = request.getContextPath();
String mybasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+mypath+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=mybasePath%>">
<title>分类导航</title>

<link rel="stylesheet" type="text/css" href="front/css/menu.css" />
<%-- <jsp:include page="/common/import.jsp"></jsp:include> --%>

</head>
<body>

<script type="text/javascript">
	$(function(){
		$(".all-goods .item").hover(function(){
			$(this).css("background-color", "white");
			$(this).find(".product").css("color", "#c81623");
			$(this).find(".product-second").show();
		}, function(){
			$(this).find(".product").css("color", "#ffffff");
			$(this).css("background-color", "#c81623");
			$(this).find(".product-second").hide();
		});	
	});

</script>


<s:action var="categroy" name="Categroy-list" namespace="/front" executeResult="false"></s:action> 

<div id="menu">
	<div id="menu-top">
		<div class="goods">
			<div  class="goods-title"><h2>商品分类</h2></div>
			<div class="all-goods">
			
				<s:iterator value="#categroy.categroies" id="first">
				
					<div class="item">
						<div class="product">
							<h3> <s:property value="#first.name"/> </h3>
						</div>
						<div class="product-second">
							<div class="forep">
								<s:iterator value="#first.children" id="second">
								<ul class="fore">
									<li>
										<h3 class="second-name"><s:property value="#second.name"/></h3>
										<p>
											<s:iterator value="#second.children" id="third">
												<a href="front/Product-list?categroyId=<s:property value='#third.id'/>&page=1" target="_blank">
													<s:property value="#third.name"/>
												</a>
											</s:iterator>
										</p>
									</li>
								</ul>
								</s:iterator>
							</div>							
						</div>
					</div>
				</s:iterator>				
			</div>			
		</div>
		<div class="directory1">
	    		<div class="d-cart"></div> 
	    </div>
	</div>
</div>
</body>
</html>