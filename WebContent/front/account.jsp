<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%--  <%@ include file="loginCheck.jsp" %>  --%>

<%--  <%
	Object loginFlag = session.getAttribute("loginFlag");
	if(loginFlag == null || !"true".equals(loginFlag)){
		response.sendRedirect("login.jsp");
	}
%> --%>

<%
String mypath = request.getContextPath();
String mybasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+mypath+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=mybasePath%>">
<title>我的账户</title>

<s:action var="userOrder" name="User-loadOrderByUserId" namespace="/front" executeResult="false"></s:action> 

<link rel="stylesheet" type="text/css" href="front/css/account.css" />
<script type="text/javascript" src="easyui-1.4.5/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		$("#menu").css("background-color", "#F1F1F1"); //菜单行背景色
		
		
		$("a[name]").click(function(){
			var src = $(this).attr("name");
			//alert(src);
			$("iframe[name='main']").attr("src", src);
		});
		
		
		$(".goods .all-goods").hide();
		
		$(".goods").hover(function(){
			$(this).find(".all-goods").show();
		},function(){
			$(this).find(".all-goods").hide();
		});
		
		$(".p-list .wrap").hover(function(){
			$(this).css("border", "1px solid #dfdfdf");
		},function(){
			$(this).css("border", "1px solid #ffffff");
		});
		
		
		
		var choose = getUrlParam("choose");
		//alert(choose);
		if(choose == "order"){
			showOrder();	
		}else{
			showUserInfo();
		}
		
		
		
		
	});
	
	//取超链接参数值
	function getUrlParam(name){   
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg);  //匹配目标参数
		if (r!=null) return unescape(r[2]); return null; //返回参数值
	} 
	
	
	
	
	function showUserInfo(){
		$(".showUserInfo").show();
		$(".showUserInfo").siblings().hide();
		
		$(".info a").css("color", "#666666");
		$("#showUserInfo").css("color", "#c81623");
		
		
		//footer位置
		var pos = $(".account-main").height();
		//alert(pos);
		$(".footer").css("top", pos);
		
		//menu 高度
		var pos = $(".account-main").height();
		$(".account-menu").css("height", pos);
		
	}
	/* function changeUserInfo(){
		$(".changeUserInfo").show();
		$(".changeUserInfo").siblings().hide();
		
		$(".info a").css("color", "#666666");
		$("#changeUserInfo").css("color", "#c81623");
	} */
	
	function showOrder(){
		$(".showOrder").show();
		$(".showOrder").siblings().hide();
		
		$(".info a").css("color", "#666666");
		$("#showOrder").css("color", "#c81623");
		
		
		//footer 高度
		var size = "<s:property value='#userOrder.salesOrders.size()'/>";
		//alert(size);
		if("<s:property value='#userOrder.salesOrders.size()' default='0'/>" > 0){  //有订单
			//footer位置  menu高度
			var pos = $(".showOrder").height();
			
			if(pos < 400){
				$(".footer").css("top", 400); 
				$(".account-menu").css("height", 400);
			}else{
				$(".footer").css("top", pos); 
				
				//menu 高度
				$(".account-menu").css("height", pos);
			}
			
		
		}else{ //无订单
			//footer位置
			var pos = $(".account-main").height();
			$(".footer").css("top", pos);
			
			//menu 高度
			//var pos = $(".account-main").height();
			$(".account-menu").css("height", pos);
		} 
		
	}
</script>

</head>
<body>
<%-- <s:debug></s:debug> --%>
<%-- <s:action var="userOrder" name="User-loadOrderByUserId" namespace="/front" executeResult="false"></s:action>  --%>

<!-- <div id="container">  -->
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="account">
		<div class="account1">
			<div class="account-main">
			
				<div class="account-menu">
					<div class="item">
						<div class="title"><h3>个人设置</h3></div>
						<ul class="info">
							<li><a id="showUserInfo" href="javascript:;" onclick="showUserInfo()">显示个人信息</a></li>
							<!-- <li><a id="changeUserInfo" href="javascript:;" onclick="changeUserInfo()">修改个人信息</a></li> -->
						</ul>
					</div>
					<div class="item">
						<div class="title"><h3>订单中心</h3></div>
						<ul class="info">
							<li><a id="showOrder" href="javascript:;" onclick="showOrder()">查看订单</a></li>
			
						</ul>
					</div>
				
				</div>
			
				<div class="main-info">
					<div class="showUserInfo">
						<div class="title">个人基本信息</div>
						<div class="item">
							<span>用户名：</span>
							<div class="fl"><s:property value="#session.loginUser.username"/></div>
						</div>
						<div class="item">
							<span>性别：</span>
							<div class="fl"><s:property value="#session.loginUser.sex"/></div>
						</div>
						<div class="item">
							<span>电话：</span>
							<div class="fl"> <s:property value="#session.loginUser.phone"/></div>
						</div>
						<div class="item">
							<span>地址：</span>
							<div class="fl"> <s:property value="#session.loginUser.addr"/></div>
						</div>
						<%-- <div class="item">
							<span>兴趣、爱好：</span>
							<div class="fl"> <s:property value="#session.loginUser.interests"/></div>
						</div> --%>
						<div class="item">
							<span>注册时间：</span>
							<div class="fl"> <s:property value="#session.loginUser.rdate"/></div>
						</div>
					</div>
					
					<%-- <div class="changeUserInfo">
						<div class="title">修改个人信息</div>
						<div class="change-form">
							<form action="front/User-register" id="register-form" method="post">
							
								<input type="hidden" name="user.id" value="<s:property value='#session.loginUser.id'/>">
								<input type="hidden" name="user.password" value="<s:property value='#session.loginUser.password'/>">
								<input type="hidden" name="user.sex" value="<s:property value='#session.loginUser.sex'/>">
								<input type="hidden" name="user.rdate" value="<s:property value='#session.loginUser.rdate'/>">
								<div class="item">
									<label>用户名</label>
									<input class="item-itext" type="text" name="user.username" placeholder="用户名，2到10个字符" value="<s:property value='#session.loginUser.username'/>">
								</div>
								<div class="item-top">
									<label>
										<s:fielderror> 
											<s:param>username</s:param>
										</s:fielderror>
									</label>
								</div>
								
								<div class="item">
									<label>电话</label>
									<input class="item-itext" type="text" name="user.phone" placeholder="请输入常用的电话号码" value="<s:property value='#session.loginUser.phone'/>"/>
								</div>
								<div class="item-top">
									<s:fielderror> 
										<s:param>phone</s:param>
									</s:fielderror>
								</div>
								<div class="item">
									<label>地址</label>
									<input class="item-itext" type="text" name="user.addr" placeholder="请输入正确的地址" value="<s:property value='#session.loginUser.addr'/>"/>
								</div>
								<div class="item-top"></div>
								
								<!-- <div class="item"> -->
									<a class="item-submit" href="javascript:;"  onclick="register()"><span>确&nbsp;&nbsp;定</span></a>
								<!-- </div> -->
								<input type="submit" value="确定"/>
								<div class="item-top"></div>
								
							</form>
						
						</div>
					</div> --%>
					
					<div class="showOrder">
					
						<s:if test="#userOrder.salesOrders.size() > 0">
						<s:iterator value="#userOrder.salesOrders" id="order">

						<div class="order-title">
							<!-- <h3> -->订单
							&nbsp;&nbsp;&nbsp;&nbsp;总价：<em>￥<s:property value="#order.getTotals()"/></em>
							&nbsp;&nbsp;&nbsp;&nbsp;下单时间：<s:property value="#order.odate"/>
							&nbsp;&nbsp;&nbsp;&nbsp;处理状态：<s:property value="#order.status"/>
							<!-- </h3> --> 
						</div>
						<div class="order-info">
							<div class="info-title">
								<span class="info-title1">商品</span>
								<span class="info-title2">单价</span>
								<span class="info-title3">数 量</span>
								<%-- <span class="info-title4">操作</span> --%>
							</div>
						</div>
						<table class="info-list">
							<tbody>
								<s:iterator value="#order.getSalesItems()" id="salesitem">
								<s:set name="p" value="#salesitem.getProduct()"></s:set>
								<tr >
									<td width="80px">				
										<a href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
											<img style="width:80px;height:80px;" src='<s:property value="#p.url"/>'>
										</a>
									</td>
									<td width="380px">
										<a href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
											<em><s:property value="#p.descr"/></em>
										</a>
									</td>
									<td width="90px"><s:property value="#p.marketprice"/></td>
									<td ><s:property value="#salesitem.pnumber"/></td>
									<!-- <td>取消该商品</td> -->
								</tr>
								</s:iterator>
							</tbody>
						</table>
						
						</s:iterator>
						</s:if>
						<s:else>
							<div style="margin-left: 300px;margin-top: 70px;"><h3>您近期无订单！</h3></div>
						</s:else>
					</div>
				</div>
			</div>
			
		</div>
	</div>
<!-- </div> -->
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>