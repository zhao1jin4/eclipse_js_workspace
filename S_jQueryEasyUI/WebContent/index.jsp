<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title> easyUI</title>
	
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- 
	<link rel="stylesheet" type="text/css" href="./themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./themes/bootstrap/easyui.css">
	 -->
	<link rel="stylesheet" type="text/css" href="./themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="./themes/icon.css">
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./js/easyui-lang-zh_CN.js"></script>
	

	
</head>
<body>
	zip中的Demo
	<hr/>
	 表格 分页 工具栏 在 服务端
	 <br/>
	<a href="demo/form/basic.jsp">表单 select可查询,文本框可验证</a> <br/>
	<a href="demo/datetimebox/basic.jsp">日期选择</a> <br/>

	<a href="demo/datagrid/checkbox.jsp">datagrid checkbox </a> <br/>
	<a href="demo/datagrid/columngroup.jsp">表格合并 表头 </a> <br/>
	<a href="demo/datagrid/contextmenu.jsp">表格_表头右键显示列(表格右键)  无效？？？ </a> <br/>
	<a href="demo/datagrid/footer.jsp">表格_表尾 </a> <br/>
	<a href="demo/datagrid/frozenrows.jsp">表格冻结行/列 </a> <br/>
	<a href="demo/datagrid/mergecells.jsp">表格合并Cell </a> <br/>
	<a href="demo/datagrid/multisorting.jsp">表格排序_(服务端) </a> <br/>
	<a href="demo/datagrid/rowediting.jsp">表格编辑 ,  icon出不来？？？</a> <br/>
	<div id="tb"  >
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Append</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Remove</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">Accept</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">Reject</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">GetChanges</a>
	</div>
	------------
	
	<a href="demo/propertygrid/basic.jsp">propertygrid/basic </a> <br/>
	<a href="demo/tree/contextmenu.jsp">tree/contextmenu </a> <br/>
	<a href="demo/tree/dnd.jsp">tree/drop and drag</a> <br/>
	<a href="demo/tree/icons.jsp">tree/icons </a> <br/>
	
	<a href="demo/switchButton/basic.jsp">switchButton </a> <br/>
	<a href="demo/tabs/tabTools.jsp">tab tools </a> <br/>
	<a href="demo/progressBar/basic.jsp">progressBar </a> <br/>
	<a href="demo/passwordBox/flashLetters.jsp">passwordBox/flashLetters </a> <br/>
	<a href="demo/slider/sliderRule.jsp">slider/sliderRule </a> <br/>
	<a href="demo/dialog/complexDialog.jsp">dialog/complexDialog </a> <br/>
	<a href="demo/menu/rightMenu.jsp">menu/rightMenu</a> <br/>
	<a href="demo/fileBox/fileBox.jsp">fileBox/fileBox</a> <br/>
	<a href="demo/tagBox/tagBoxAutoComplete.jsp">fileBox/tagBoxAutoComplete 输入一半不选还在??? </a> <br/>
 	<a href="demo/combox/remoteData.jsp">combox remote input ，输入一半不选还在 onblur,onUnSelect 不触发？？</a> <br/>
	
	<br/>
	 tutorial
	<hr/>
	<a href="tutorial/datagrid/datagrid12_demo.jsp">表格行内编辑  DataGrid inline editing </a> <br/>
	 
	 
	 <br/>
	 extension
	<hr/>
	 <a href="extension/datagrid-detailview/datagrid-detailview.html">datagrid-detailview </a> <br/>
	 <a href="extension/datagrid-detailview/datagrid-detailview_update-form.html">	datagrid-detailview_update-form.html</a> <br/>

	
 	<br/> my 
 	<hr/>
 	<a href="my/layout.jsp">layout </a> <br/>
 	<a href="my/sqlView.jsp">sqlView ,table 动态column (在 J_SpringMVC 项目中有 连接DB的) </a> <br/>
 	<a href="easyUI/queryPage?action=init">datagrid 表格_分页_工具栏_一行更新_checkBox多选删   </a> <br/>
 	
 	
 	<br/><br/><br/><br/>
 	
</body>
</html>