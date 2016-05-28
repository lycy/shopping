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
<title><s:property value="search"/>&nbsp;-&nbsp;商品搜索 </title>

<link rel="stylesheet" type="text/css" href="front/css/productList.css" />
<jsp:include page="/common/import.jsp"></jsp:include>

<script type="text/javascript">
	
	$(function(){
		$(".goods .all-goods").hide();
		
		$("#pp").pagination({
			total:"<s:property value='total'/>",
			pageSize:9,
			pageNumber:"<s:property value='page'/>",
			layout:['first','prev','links','next','last'],
			onSelectPage:function(pageNumber, pageSize){
				initData(pageNumber);
			}

		});
		
		
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
		
		var posl = $(".p-list").height();
		var posa = $(".p-aside").height();
		if(posl > posa){                     //两者谁高，使用那个
			$(".footer").css("top", posl+20);
		}else{
			$(".footer").css("top", posa+20);
		} 
		
		var size= "<s:property value='products.size()'/>";
		if(size <= 0){
			var pos = $(".search-info").height();
			$(".footer").css("top", pos);
		}
		
	});
	
	function initData(page){
		var p = page;	
		var path = "<%=mypath%>" + "/";
		var url = path + "front/Product-frontSearch?search=" + "<s:property value='search'/>" + "&page=" + p;
		url = encodeURI(url);
		url = encodeURI(url);
		window.location.assign(url);
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
	    				"<s:property value="search"/>"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    				共搜索到<s:property value='total'/>个商品
	    			</h3>
	    		</div> 
	    	</div>
	    	<s:set name="size" value="products.size()"></s:set>
			<s:if test="#size<=0">
				<div class="search-info">抱歉！没有找到与“<s:property value="search"/>”相关的商品</div>
			</s:if>
			<s:else>
	    	<div class="p-main">
	    		<div class="p-aside">
	    			<div class="p-title"><h4>推广商品</h4></div> 
	    			<div><ul>
	    				<s:iterator value="productPromotion" id="p">
							<li class="wrap">	
								<div class="p-item">
									<div class="p-img">
										<a href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
											<img src='<s:property value="#p.url"/>'>
										</a> 
									</div>
									<div class="p-price">
										<strong class="J-price"><em>¥</em><i><s:property value="#p.marketprice"/></i></strong>
									</div>
									<div class="p-descr">
										<a href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
											<em><s:property value="#p.descr"/></em>
										</a>
									</div>
									<div class="p-commit">
										<strong>已有0人评价</strong>
									</div>
									
								</div>
							</li>
						</s:iterator>
					</ul></div>
	    		</div>
	    		<div class="p-list">
	    			<div>
	    				<ul>	
	    					<s:iterator value="products" id="p">
	    						<li class="wrap">	
									<div class="p-item">
										<div class="p-img">
											<a href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
												<img src='<s:property value="#p.url"/>'>
											</a> 
										</div>
										<div class="p-price">
											<strong class="J-price"><em>¥</em><i><s:property value="#p.marketprice"/></i></strong>
										</div>
										<div class="p-descr">
											<a href="front/Product-loadProduct?id=<s:property value='#p.id'/>" target="_blank">
												<em><s:property value="#p.descr"/></em>
											</a>
										</div>
										<div class="p-commit">
											<strong>已有0人评价</strong>
										</div>
										
									</div>
								</li>
	    					</s:iterator>
						</ul>
	    			</div>
	    			<div class="ss">
						<div id="pp"></div>
	    			</div>
	    		</div>
			</div>
			
			</s:else>
			
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>