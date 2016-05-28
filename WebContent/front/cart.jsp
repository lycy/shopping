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
<title>我的购物车</title>

<link rel="stylesheet" type="text/css" href="front/css/cart.css" />
<jsp:include page="/common/import.jsp"></jsp:include>

<script type="text/javascript">
	
	$(function(){
		
		$(".goods .all-goods").hide();
		$("#menu").css("background-color", "#ffffff");
		
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
		
		
		//footer 高度
		if("<s:property value='#session.cartDtos.size()-1' />" > 0){  //购物车不为空
			var pos = $(".cart-main").height();
			//alert(pos);
			$(".footer").css("top", pos);
		}else{ //购物车为空
			var pos = $(".cart-info").height();
			//alert(pos);
			$(".footer").css("top", pos);
		} 
		
	});
	
	function reduceNumber(id){
		var num = "#buy-num" + id;
		var value = $(num).val();
		value--;
		if(value <= 1 ){
			value = 1;
		}
		$(num).val(value);
		//alert(value);
		ajaxNum(id, value);
		
		
	    
	}
	
	function addNumber(id, number){
		var num = "#buy-num" + id;
		var value = $(num).val();
		value++;
		if(value > number){
			
			$.messager.alert("提示", "该商品还剩" + number + "件");
			value = number;
		}
		
		$(num).val(value);
		
		ajaxNum(id, value);
	}
	
	function ajaxNum(id, value){
		$.post(
			"front/Cart-cartNumberChange",
			{
				"id":id,
				"cartNumber":value
			},
			function(result){
				var num = "#sum" + id;
				$(num).text(result.sum + ".0");
				$(".end-info em").text("￥" + result.totals + ".0");
			}
		);
		
	}
	
	//删除表项
	function removeItem(id){
		//alert("remove");
		$.messager.confirm("提示", "确认删除？", function(r){
			if(r){
				$.post(
					"front/Cart-delete",
					{
						"id":id,
					},
					function(result){
						/* alert("dsf");
						var result = $.parseJSON(data); */
						//alert(data);
						var td =  "tr[id=" +id + "]";
						$(td).remove();
						
						if(result.size > 0){
							//alert(result.totals);
							$("#info-title").text("已有" + result.size + "种商品加入购物车");
							$(".end-info span").text("共" + result.size + "种商品，总价格：");
							$(".end-info em").text("￥" + result.totals + ".0");
						}else{
							//alert(result.totals);
							$("#info-title").text("已有" + result.size + "种商品加入购物车");
							$(".end-info span").text("共" + result.size + "种商品，总价格：");
							$(".end-info em").text("￥" + result.totals + ".0");
							$("div[class='cart-main']").hide();
							
							var text = '<div class="cart-info"><h3 id="info-title">您的购物车还是空的！<a href="front/index_text/index.jsp">立即购买</a></h3></div>';
							$("#cart-info1").after(text);
						}
						
						
					}
				);
			}else{
				//alert("aa");
				return;
			}
		});
	}
	
	//结算
	function statement(){
		var flag = "<s:property value='#session.loginFlag'/>";
		if(flag == "true"){
			$(".end-btn1").attr("href", "front/Cart-statement");
			//return true;
		}else{
			//$.messager.alert("提示", "请先登录！");
			$("#login-window").window({
				closed:false,
			});
			//return false;
		}
	}
	
</script>



</head>
<body>
<%-- <s:debug></s:debug> --%>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="container">
		<div id="container1">
			<div id="cart-info1" class="cart-info1"><h3 id="info-title">已有 <s:property value="#session.cartDtos.size()-1" default="0"/>种商品加入购物车</h3></div>
			
			<s:set name="size" value="#session.cartDtos.size()-1"></s:set>
			<s:if test="#size<=0">
				<div class="cart-info"><h3 id="info-title">您的购物车还是空的！<a href="front/index_text/index.jsp">立即购买</a></h3></div>
			</s:if>
			<s:else>
			<div class="cart-main">
				<div class="cart-title">
					<span class="cart-title1">购物车中的商品</span>
					<span class="cart-title2">单价</span>
					<span class="cart-title3">数 量</span>
					<span class="cart-title4">商品合计 </span>
					<span class="cart-title5">操 作</span>
				</div>
				<table class="cart-list">
					<tbody>
						<s:subset source="#session.cartDtos" start="1">
						<s:iterator id="p">
						<tr id="<s:property value="#p.id"/>">
							<td width="80px">
								<%-- <img src="<s:property value="#p.url"/>"> --%>
								<a href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
									<img src='<s:property value="#p.url"/>'>
								</a>
							</td>
							<td width="480px">
								<%-- <s:property value="#p.descr"/> --%>
								<a href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
									<em><s:property value="#p.descr"/></em>
								</a>
							</td>
							<td width="100px"><s:property value="#p.marketprice"/></td>
							<td width="110px">
								<%-- <s:property value="#p.cartNumber"/> --%>
								<div class="spinner">
			    					<a class="btn-add" href="javascript:;" onclick="addNumber(<s:property value="#p.id"/>, <s:property value="#p.number"/>)">+</a>
			    					<a class="btn-reduce" href="javascript:;" onclick="reduceNumber(<s:property value="#p.id"/>)">-</a>
			    					<input id="buy-num<s:property value='#p.id'/>" disabled="disabled" value="<s:property value="#p.cartNumber"/>" onkeyup="value=value.replace(/[^\d]/g,'')"  autocomplete="off"/>
	    						</div>
							</td>
							<td width="130px" >
								<p id="sum<s:property value="#p.id"/>"> 
									<s:property value="#p.sum"/>
								 </p>
							</td>
							<td >
								<a href="javascript:;" onclick="removeItem(<s:property value="#p.id"/>)">删除</a>
							</td>
						</tr>
						</s:iterator>
						</s:subset>
						
					</tbody>
				</table>
				<div class="cart-end">
					<div class="end-btn">
						<a class="end-btn1" href="javascript:;"  onclick="statement()"><span>结算</span></a>
					</div>
					<div class="end-info"><span>共<s:property value="#session.cartDtos.size()-1"/>种商品，总价格：</span><em>￥<s:property value="#session.cartDtos.get(0).getTotals()"/></em></div>
					
				</div>
			
			</div>
		</s:else>
			
			
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>