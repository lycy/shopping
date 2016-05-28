var flag;
function  getFlag(flag){
	var url;
	if(flag == "update"){
		url = "admin/User-update";
	}else if(flag =="add"){
		url = "admin/User-register";
	}else if(flag == "delete"){
		url = "admin/User-delete";
	}else if(flag == "search"){
		url = "admin/User-search";
	}
	return url;
}

$(function(){
	 	//datagrid
		$("#User-list").datagrid({
			idField:"id",  //创建表格，要用该属性
			url:"admin/User-pageList",
			fitColumns:true,	
			frozenColumns:[[   //选中标识
				{field:"ok",
				 width:50,
				 checkbox:true, //列特性    在冻结列  ;
				 }  
			]],			
			loadMsg:"数据正在加载",
			singleSelect:true,  // 只可选中一列
			rownumbers:true,    // 行号
			//分页
			pagination:true,
			pageSize:5,   //与pageList对应
			pageList:[5, 10, 15, 20],      //select * from user limit 0, 5 : 从0号位置查询5条记录 
			
			
			columns:[[
				{
					field:"username", 
					title:"用户名", 
					width:100,
				},
				{
					field:"sex", 
					title:"性别", 
					width:100
				},
				{
					field:"phone", 
					title:"电话", 
					width:100
				},
				{
					field:"addr", 
					title:"地址", 
					width:100
				},
				{
					field:"rdate", 
					title:"注册日期", 
					width:200,
				}/*,
				{
					field:"interests",
					title:"兴趣/爱好",
					width:200,
				},*/
			]],
			toolbar:[    //对话框的顶部工具栏
				/* {
					text:"添加用户",
					iconCls:"icon-add",
					handler:function(){
						flag = "add";
						//alert(flag);
						$("#dialog").dialog({
							title:"添加用户"
						});
						$("#dialog").dialog("open");
						$("#form").get(0).reset(); 
						//alert("assssss");
						//$("#myform").
						
						//清空表单  
						// 1. $("#myform").get(0).reset();   //jquery对象转换为DOM对象
						// 2. $("#myform").form("clear");   //会清空默认值
					}
			
				}, */
				/*{
					text:"修改用户",
					iconCls:"icon-edit",
					handler:function(){
						flag = "update";
						var arr = $("#User-list").datagrid("getSelections");
						if(arr.length == 1){
							$("#dialog").dialog({
								title:"修改用户"
							});
							
							$("#dialog").dialog("open");     //打开表单
							$("#form").get(0).reset();    //清空								
							//alert(arr[0].interests);
							//alert(arr[0].username);
							var id = "user.id";
							$("#form").form("load", {     //从新加载数据
								"user.id":arr[0].id,
								"user.username":arr[0].username,
								"user.password":arr[0].password,
								"user.phone":arr[0].phone,
								"user.addr":arr[0].addr,
								"user.password2":arr[0].password,
								"user.interests":arr[0].interests,
								"user.sex":arr[0].sex,
								"user.rdate":arr[0].rdate
							});
						}else{
							$.messager.alert("提示", "选择一条记录修改！");
						}
					}
				},*/
				{
					text:"删除用户",
					iconCls:"icon-remove",
					handler:function(){
						flag = "delete";
						var arr = $("#User-list").datagrid("getSelections");
						if(arr.length == 1){
							$.messager.confirm("提示", "确认删除,用户" + arr[0].username + "?", function(r){
								if(r){
									$.post(
										getFlag(flag),
										{"user.id":arr[0].id},
										function(result){
											if(result.flag == "ok"){
												$("#User-list").datagrid("reload");
												$("#User-list").datagrid("unselectAll");
												$.messager.alert("提示", "成功删除！");
											}else{
												$("#User-list").datagrid("reload");
												$("#User-list").datagrid("unselectAll");
												$.messager.alert("提示", "删除失败！");
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
						
						
						//36分钟  02
					}
				},
				/*{
					text:"查询用户",
					iconCls:"icon-search",
					handler:function(){
						
						$("#layout").layout("expand", "north");
						flag = "search";
						 $("#layout").layout("panel", "north")({
							title:"用户查询"
						}); 
					}
				},*/
			],
			
		});
});