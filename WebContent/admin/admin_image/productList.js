var flag;
function  getFlag(flag){
	var url;
	if(flag == "update"){
		url = "admin/Product-update";
	}else if(flag =="add"){
		url = "admin/Product-add";
	}else if(flag == "delete"){
		url = "admin/Product-delete";
	}else if(flag == "search"){
		url = "admin/Product-search";
	}
	return url;
}

$(function(){
	
	$("#Product-list").datagrid({
		idField:"id",
		url:"admin/Product-pageList",
		height:$("#body").height()-$(".search-product").height()-5,
		width:$("#body").width(),
		fitColumns:true,
		loadMsg:"数据正在加载",
		
		frozenColumns:[[
		    {field:"ok",
			width:50,
			checkbox:true, //列特性    在冻结列  ;
			}  
		]],
		singleSelect:true,  // 只可选中一列
		rownumbers:true,    // 行号
		//分页
		pagination:true,
		pageSize:5,   //与pageList对应
		pageList:[5, 10, 15, 20],      //select * from user limit 0, 5 : 从0号位置查询5条记录 
		showFooter:true,
		columns:[[
		          {
		        	  field:"name", 
		        	  title:"商品名称", 
		        	  width:80,  
		        	  resizable:false
		          },
		          {
		        	  field:"number", 
		        	  title:"剩余数量", 
		        	  width:60, 
		        	  resizable:false
		          },
		          {
		        	  field:"marketprice", 
		        	  title:"价格", 
		        	  width:60, 
		        	  resizable:false
		          },
		          {
		        	  field:"categroyName", 
		        	  title:"所属分类", 
		        	  width:60, 
		        	  resizable:false
		          },
		          {
		        	  field:"promote", 
		        	  title:"推广商品", 
		        	  width:80, 
		        	  resizable:false
		          },
		          {
		        	  field:"pdate", 
		        	  title:"上架日期", 
		        	  width:80, 
		        	  resizable:false
		          },
		          {
		        	  field:"url", 
		        	  title:"图片路径", 
		        	  width:80, 
		        	  resizable:false,
		        	  formatter:function(value, rowData, rowIndex){
			        		  return "<span title=" + value + ">" + value + "</span>"
			        	  }
		          },
		          {
		        	  field:"descr", 
		        	  title:"描述", 
		        	  width:100, 
		        	  resizable:false,
		        	  formatter:function(value, rowData, rowIndex){
		        		  return "<span title=" + value + ">" + value + "</span>"
		        	  }

		          }
		
		]],
	
		toolbar:[
		         {
		        	 text:"添加商品",
					 iconCls:"icon-add",
					 handler:function(){
						 flag = "add";
						 $("#dialog").dialog({
							 title:"添加商品"
						 });
						 $("#form").form("clear");
					     $("#dialog").dialog("open");
					}
		         },
		         {
		        	 text:"删除商品",
					 iconCls:"icon-remove",
					 handler:function(){
						 flag = "delete";
						 var arr = $("#Product-list").datagrid("getSelections");
						 if(arr.length == 1){
							 $.messager.confirm("提示", "确认删除商品: " + arr[0].name + "?", function(r){
								 if(r){
									 $.post(
											 getFlag(flag),
											 {"productDTO.id":arr[0].id},
											 function(result){
												 if(result.flag == "ok"){
													 $("#Product-list").datagrid("reload");
													 $("#Product-list").datagrid("unselectAll");
													 $.messager.alert("提示", "成功删除！");
												 }else{
													 $.messager.alert("提示", "删除失败，请重试!");
												 }
												 
											 }
										
									 );
								 }else{
									 return;
								 }
							 });
						 }else{
							 $.messager.alert("提示", "选择一条记录删除！");
						 }
					 }
		        	 
		         },
		         { 
		        	 text:"修改商品信息",
					 iconCls:"icon-edit",
					 handler:function(){
						 flag = "update";
						 var arr = $("#Product-list").datagrid("getSelections");
						 if(arr.length == 1){
							 $("#dialog").dialog({
									title:"修改商品信息"
							 });
							 $("#form").form("clear");
							 $("#dialog").dialog("open");
							 $("#form").form("load", {     //从新加载数据
									"productDTO.id":arr[0].id,
									"productDTO.name":arr[0].name,
									"productDTO.number":arr[0].number,
									"productDTO.marketprice":arr[0].marketprice,
									"productDTO.descr":arr[0].descr,
									"productDTO.pdate":arr[0].pdate,
									"productDTO.url":arr[0].url,
									"productDTO.promote":arr[0].promote
							 });
						  }else{
							  $.messager.alert("提示", "选择一条记录修改！");
						  }
					 }
					 
		         }/*,
		         { 
		        	 text:"查询",
					 iconCls:"icon-search",
		         }*/
		]
	});
	
	$("#btn1").click(function(){
		$.ajax({
			type:"post",
			url: getFlag(flag),
			cache:false,   //是否清空缓存	
			data:$("#form").serialize(),  //发送的表单数据
			dataType:"json",  //服务器返回时接收的数据类型
			//提交成功时
			success:function(result){
				if(result.flag == "ok"){
					$("#Product-list").datagrid("reload");
					$("#dialog").dialog("close");
					$.messager.alert("提示", "操作成功！");
				}else{
					$("#Product-list").datagrid("reload");
					$("#dialog").dialog("close");
					$.messager.alert("提示", "操作失败！");
				}
				
			},  
			//提交失败时
			error:function(result){
				$.messager.alert("提示", "操作失败！");
			}
		});
	});
	
	$("#btn2").click(function(){
		$("#dialog").dialog("close");
	});
	
	
	 
	//动态加载商品类别
	$("#Category1").combobox({
		url:"admin/Product-loadCategroies?pid=0",
		valueField:"id",
		textField:"name",
		onSelect:function(){
			var pid = $("#Category1").combobox("getValue");
			$("#Category2").combobox("setValue", "");
			$("#Category2").combobox("reload", "admin/Product-loadCategroies?pid=" + pid);
		}
	});
	$("#Category2").combobox({
		valueField:"id",
		textField:"name",
		onSelect:function(){
			var pid = $("#Category2").combobox("getValue");
			$("#Category3").combobox("setValue", "");
			$("#Category3").combobox("reload", "admin/Product-loadCategroies?pid=" + pid);
		}
	});
	$("#Category3").combobox({
		valueField:"id",
		textField:"name"
	});
	
	
	
	//查询
	$("#openOrClose").click(function(){
		var display = $(".search-area").css("display");
		//alert(display);
		if(display == "none"){
			$(".search-area").show();
			domresize();
			
			
		}else{
			$(".search-area").hide();
			domresize();
		}
		
	});
	
	//查询
	$("#search-btn1").click(function(){
		var value = $("#search-Category3").combobox("getValue");
		//alert(value);
		if(value == ""){
			$.messager.alert("提示", "请选择查询条件"); 
		}else{
			$("#Product-list").datagrid({  
		        url:"admin/Product-search",  
		        queryParams:{  
		        	adminCategroyId:value,  
		        }  
		    }); 
			$("#Product-list").datagrid("unselectAll");
		}
	});
	//查询全部
	$("#search-btn2").click(function(){
		$("#Product-list").datagrid({  
	        url:"admin/Product-pageList"
	    }); 
		$("#Product-list").datagrid("unselectAll");
	});
	
	//查询  ------------- 动态加载商品类别
	$("#search-Category1").combobox({
		url:"admin/Product-loadCategroies?pid=0",
		valueField:"id",
		textField:"name",
		onSelect:function(){
			var pid = $("#search-Category1").combobox("getValue");
			$("#search-Category2").combobox("setValue", "");
			$("#search-Category2").combobox("reload", "admin/Product-loadCategroies?pid=" + pid);
		}
	});
	$("#search-Category2").combobox({
		valueField:"id",
		textField:"name",
		onSelect:function(){
			var pid = $("#search-Category2").combobox("getValue");
			$("#search-Category3").combobox("setValue", "");
			$("#search-Category3").combobox("reload", "admin/Product-loadCategroies?pid=" + pid);
		}
	});
	$("#search-Category3").combobox({
		valueField:"id",
		textField:"name"
	});
	
});


//改变表格宽高
window.onresize = function(){
	setTimeout(domresize,300);
};

function domresize(){
	$("#Product-list").datagrid("resize", {
		height:$("#body").height()-$(".search-product").height()-5,
		width:$("#body").width()
	});
}
