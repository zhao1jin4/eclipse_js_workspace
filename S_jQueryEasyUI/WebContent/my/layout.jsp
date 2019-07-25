<%@page pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>分页  工具栏</title>
	
	<!-- 
	<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	 -->
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/icon.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	function openClose( )
	{
		var ul=$(".third_ul");
	 	if(ul.is(":hidden"))
			ul.slideDown();
		else
			ul.slideUp();
	 }

	 function addTab(subtitle,url,icon){
		if(!$('#tabs').tabs('exists',subtitle)){
			$('#tabs').tabs('add',{
				title:subtitle,
				content:'<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>',
				closable:true,
				icon:icon
			});
		}else{
			$('#tabs').tabs('select',subtitle);
		}
	}
	
	</script>
	 <style type="text/css"> 
		ul li{list-style-type:none;}
	 	li div:hover{border:1px dashed #99BBE8; background:#E0ECFF;cursor:pointer;}
	</style>
	
	</head>
	<body>
 	 <div class="easyui-layout" style="width:1000px;height:700px;">
        <div data-options="region:'north'" style="height:50px"></div>
        <div data-options="region:'south',split:true" style="height:50px;"></div>
        <div data-options="region:'east',split:true" title="East" style="width:180px;">
             
        </div>
        <div data-options="region:'west',split:true" title="我的面板" style="width:300px;">
            <div class="easyui-accordion" data-options="fit:true,border:false,animate:true">
                <div title="用户管理" style="padding:10px;" data-options="selected:true,iconCls:'icon-users'" >
                    <ul class="navlist" style="list-sytle:none">
                   		 <li ><div onclick="openClose()"> 
                   		 		<a><span class="icon icon-add" >&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp; 
                   		 		   <span class="nav">第一级第1个</span>
                   		 		 </a>
	                   		 </div>
	                   		 <ul class="third_ul"   >
	                   		 	<li><div >
	                   		 		  <a  rel="demo/form/basic.html" onclick="addTab('第二级第1个',this.rel,'icon icon-ok')" >
	                   		 		  <span class="icon icon-ok" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			                   		  <span class="nav">第二级第1个</span>
			                   		  </a>
		                   			</div>
		                   		 </li>
	                   		 </ul>
                   		 </li>
                    </ul>
                </div>
                <div title="Title2" data-options="iconCls:'icon-edit'" style="padding:10px;"  >
                    content2
                </div>
                <div title="Title3" style="padding:10px" data-options="iconCls:'icon-search'" >
                    content3
                </div>
            </div>
        </div>
        <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
            <div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true">
            
                
            </div>
        </div>
    </div>

    </body>
</html>