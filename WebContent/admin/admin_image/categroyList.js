
var flagFunction;
var flag;
function  getFlag(flag){
	var url;
	if(flag == "update"){
		url = "admin/Categroy-update";
	}else if(flag =="add"){
		url = "admin/Categroy-add";
	}else if(flag == "delete"){
		url = "admin/Categroy-delete";
	}else if(flag == "search"){
		url = "admin/Categroy-search";
	}
	return url;
}

$(function(){
	
	//datagrid
	 $("#Categroy-list").treegrid({
		 url:"admin/Categroy-pageList",
		 //iconCls:'icon-ok',
		 width:1000,
		 height:400,
		 nowrap: false,
		 rownumbers: true,  //行号
		 collapsible:true,		
		 idField:"id",				//数据表格要有主键	
		 treeField:"name",			//treegrid 树形结构主键 text
		 fitColumns:true ,
		 columns:[[
		           {field:"name",title:"类别名称",width:200} ,
		           {field:"descr",title:"类别描述",width:120}    
		 ]],
		 onContextMenu: function(e,node){
			 e.preventDefault();					//屏蔽浏览器的菜单
			 $(this).treegrid("unselectAll");	//清除所有选中项
			 $(this).treegrid("select", node.id);	//选中状态 
			 $("#menu").menu("show", {
				 left: e.pageX,
				 top: e.pageY
			 });
		 }
	 });
	 
	 
	 $("#btn1").click(function(){
		 var node = $("#Categroy-list").treegrid("getSelected");  //选中的树节点
		 if(flagFunction == "add"){
			//前台保存
			 $("#Categroy-list").treegrid("append", {     //添加新节点
				 parent:node.id,
				 data:[{
					 name:$("#form").find("input[name='categroyDto.name']").val(),
					 descr:$("#form").find("textarea[name='categroyDto.descr']").val()
				 }]
			 });
			 //后台
			 $.post(
					 getFlag(flag),
					 {
						 "categroyDto.parent_id":node.id,
						 "categroyDto.name":$("#form").find("input[name='categroyDto.name']").val(),
						 "categroyDto.descr":$("#form").find("textarea[name='categroyDto.descr']").val(),
					 },
					 function(data, status){
						//刷新节点  
						 //$.messager.alert("提示", "添加成功！");
						 //alert("s");
						 $("#Categroy-list").treegrid("reload", node.id);

					 }
			 );
		 }else{
			 $.post(
					 getFlag(flag),
					 {
						 "categroyDto.id":node.id,
						 "categroyDto.name":$("#form").find("input[name='categroyDto.name']").val(),
						 "categroyDto.descr":$("#form").find("textarea[name='categroyDto.descr']").val()
					 },
					 function(data, status){
						 
						//刷新选中节点的父节点
						 //(node.id);
						 //alert("s");
						 var parent = $("#Categroy-list").treegrid("getParent", node.id);  
						 if(parent ==null){
							 $("#Categroy-list").treegrid("reload", 0);
						 }else{
							 $("#Categroy-list").treegrid("reload", parent.id);
						 }
					 }
			 );
		 }
		 $("#dialog").dialog("close");
	 });
	 
	 $("#btn2").click(function(){
		 $("#dialog").dialog("close");
	 });		 
});

function add(){
	flagFunction = "add";
	flag = "add";
	$("#form").form("clear");
	$("#dialog").dialog("open");
}	

function update(){
	flagFunction = "update";
	flag = "update";
	$("#form").form("clear");
	$("#dialog").dialog({
		title:"修改商品类别信息"
	});
	
	$("#dialog").dialog("open");
	var node = $("#Categroy-list").treegrid("getSelected");
	$("#form").form("load", {
		"categroyDto.name":node.name,
		 "categroyDto.descr":node.descr
	});
}	

function Remove(){
	flagFunction = "delete";
	flag = "delete";
	$.messager.confirm("提示", "确认删除?", function(r){
		if(r){
			var node = $("#Categroy-list").treegrid("getSelected");
			$("#Categroy-list").treegrid("remove", node.id);
			$.post(
					getFlag(flag),
					{
						"categroyDto.id":node.id
					},
					function(result){
						$(this).treegrid("unselectAll");
						$("#Categroy-list").treegrid("remove", node.id);
					}
			);
		}else{
			return;
		}
	});
}	

