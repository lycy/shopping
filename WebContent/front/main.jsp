<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>main</title>

<link rel="stylesheet" type="text/css" href="front/css/main.css" />

<script type="text/javascript">

	

	//图片轮转
	var index = 0;
	var myInterval;
	function slider(){
		$("#img").attr("src", "front/front_image/index-" + getIndex(index) + ".jpg");
		var li = $(".num .on").index();      //获取前一个li,去掉css  设置现在li的css
		$(".num li:eq(" + li + ")").removeClass("on");
		$(".num li:eq(" + getIndex(index) + ")").addClass("on");
		index++;
	};
	
	function getIndex(i){
		var j;
		if(i >= 4){
			j = i % 4;
		}
		else{
			j = i;
		}
		return j;
	};
	//图片轮转
	
	$(function(){
		
		$(".directory1").hide();
		
		myInterval = setInterval("slider()", 3000); //设置每隔1000毫秒调用一个func()函数
		
		$(".num li").hover(function(){
			
			 /* li获取焦点时 
			 		1. clearInterval()
			 		2. 获取前一个有css的li,去掉css  设置现在li的css
			 		3. 改变图片
			 	li失去焦点时
			 		1. myInterval
			 */
			clearInterval(myInterval);                      
			$(this).siblings(".on").removeClass("on");  //siblings: 同胞元素
			
			var i = $(this).index();
			$(this).addClass("on");
			
			index = i;
			slider();
			
		},function(){
			myInterval = setInterval("slider()", 3000);
		});
		
		$("#img").hover(function(){
			clearInterval(myInterval);
		},function(){
			myInterval = setInterval("slider()", 3000);
		});
		
		
		//尾部
		var pos = $(".main1").height();
		//alert(pos);
		//alert(pos.left);
		$(".footer").css("top", pos-40);
	});
</script>


</head>
<body>

<s:action var="productPromotion" name="Product-listPromotion" namespace="/front" executeResult="false"></s:action> 

<jsp:include page="menu.jsp"></jsp:include>

<div class="goods-class">
	<div class="goods-menu">
		
		<div class="goods-main">
			<div class="main1">
				<ul class="slider" >
			        <li><img id="img" src="front/front_image/index-0.jpg"></li>
			        <!-- <li><img src="front/front_image/index-2.jpg"/></li>
			        <li><img src="front/front_image/index-3.jpg"/></li>
			        <li><img src="front/front_image/index-4.jpg"/></li> -->
				</ul>
			    <ul class="num" >
			        <li class="on">1</li>
			        <li>2</li>
			        <li>3</li>
			        <li>4</li>
			    </ul>
			</div>
			
			<div class="main2">
				<s:iterator value="#productPromotion.productPromotion" id="p">
					<div class="item">
						<!-- <div class="item-img"> -->
							<a class="item-img" href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
								<img src="<s:property value='#p.url'/>">
							</a>
						<!-- </div> -->
						<div class="item-info">
							<div class="price">
								<em>¥<s:property value="#p.marketprice"/></em>
								<%-- <strong class="J-price"><em>¥</em><i><s:property value="#p.marketprice"/></i></strong>	 --%>
							</div>
							<!-- <div class="descr"> -->
								<a class="descr" href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
									<s:property value="#p.descr"/>
								</a>
							<!-- </div> -->
						</div>
						
					</div>
				</s:iterator>
				<!-- <div class="item">saf</div>
				<div class="item">saf</div> -->
			</div>
		</div>
		
		
		
	</div>
</div>  
<jsp:include page="footer.jsp"></jsp:include>


<!-- <div class="nav-wrap">
	<div class="nav">
		<div class="goods">
			<h2 class="title">商品分类</h2>
			<div class="all-goods">	
			</div>
		</div> 
	</div>
</div> -->



	


</body>
</html>