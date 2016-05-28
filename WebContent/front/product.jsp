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
<title><s:property value="product.name"/></title>

<link rel="stylesheet" type="text/css" href="front/css/product.css" />
<jsp:include page="/common/import.jsp"></jsp:include>

<script type="text/javascript">
	
	$(function(){
		$("#menu").css("background-color", "#F1F1F1");
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
		
		
		//footer 高度
		var pos = $(".p-main").height();
		//alert(pos);
		$(".footer").css("top", pos);
		
		
	});
	

	function addNumber(){
		var value = $("#buy-num").val();
		var num = "<s:property value='product.number'/>";
		value++;
		if(value >= num){
			value = num;
		}
		$("#buy-num").val(value);
	}
	
	function reduceNumber(){
		var value = $("#buy-num").val();
		value--;
		if(value <= 0){
			value = 1;
		}	
		$("#buy-num").val(value);
	}
	
	/* function valueChang(){
		var value = $("#buy-num").val();
		value=value.replace(/[^\d]/g,'');
		var num = "<s:property value='product.number'/>";
		alert(value);
		console.log(value);
		console.log(num);
		alert(num);
		if(num <= 12){
			value = 5;
		}
		$("#buy-num").val(value);
	} */
	
	function setHref(){
		var value = $("#buy-num").val();
		//var num = "<s:property value='product.number'/>";
		var num = <s:property value='product.number'/>;
		//alert(value);
		//alert(num);
		if(value > num){
			$.messager.alert("提示", "不能超过商品剩余数量");
			return false;
		}else if(value <= 0){
			$.messager.alert("提示", "数量不能为0");
			return false;
		}else{
			var id = "<s:property value='product.id'/>";
			$(".btn-append").attr("href", "front/Cart-list?id=" + id + "&cartNumber=" + value);
			return true;
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
	    	<div class="directory">
	    		<div class="d-title">
	    			<h3>
	    				<s:property value="product.category.parent.parent.name"/> >
	    				<s:property value="product.category.parent.name"/> >
	    				<s:property value="product.category.name"/> >
	    				<s:property value="product.name"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    			</h3>
	    		</div> 
	    	</div>
	    	<div class="p-main">
	    		<div class="p-aside">
	    			<div class="p-image">
	    				<img src='<s:property value="product.url"/>' > 
	    			</div>
	    		</div>
	    		<div class="p-info">
	    			<div class="p-descr">
	    				<h1><s:property value="product.descr"/></h1>
	    			</div>
	    			<div class="p-surplus">(剩余商品数量：<s:property value="product.number"/>件)</div>
	    			<div class="p-price">
	    				<div class="J-title">价&nbsp;&nbsp;格：</div>
	    				<div class="J-price">
	    					<strong><em>¥</em><i><s:property value="product.marketprice"/></i></strong>
	    				</div>
	    				
	    			</div>
	    			<div class="p-choose">
	    				<!-- <div class="spinner"><input id="spinner" class="easyui-numberspinner" style="width:70px;"/></div> -->
	    				<div class="spinner">
	    					<a class="btn-add" href="javascript:;" onclick="addNumber()">+</a>
	    					<a class="btn-reduce" href="javascript:;" onclick="reduceNumber()">-</a>
	    					<input id="buy-num" value="1"  onkeyup="value=value.replace(/[^\d]/g,'')" autocomplete="off"/>
	    					<!-- onkeyup="value=value.replace(/[^\d]/g,'')" -->
	    				</div>
	    				<div class="choose-btn">
	    					<s:if test="product.number <= 0">
	    						<a class="btn-append1" href="javascript:;" onclick="return false"><h3>加入购物车</h3></a>
	    					</s:if>
	    					<s:else>
	    						<a class="btn-append" href="javascript:;" onclick="return setHref()"><h3>加入购物车</h3></a>
	    					</s:else>
	    					
	    				</div>
	    			</div>
	    		</div>
	    			
			</div>
		
	   
		
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>