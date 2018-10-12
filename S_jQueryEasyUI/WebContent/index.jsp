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
	 
	 
		
	
	<p>container</p>
	<a href="demo/panel/panelTool.jsp">panel/panelTool    </a> <br/>
	<a href="demo/window/modalWindow.jsp">window/modalWindow </a> <br/>
	<a href="demo/tabs/tabDynAdd.jsp">  tabDynAdd  </a> <br/>
	<a href="demo/dialog/complexDialog.jsp">dialog/complexDialog </a> <br/>
	
	<a href="demo/message/alterMessage.jsp">message/alterMessage  </a> <br/>
	<a href="demo/message/promptMessage.jsp">message/promptMessage  </a> <br/>
	
	<p>datagrid ,tree,treegrid</p>
	<a href="demo/datagrid/checkbox.jsp">datagrid checkbox </a> <br/>
	<a href="demo/datagrid/columngroup.jsp">表格合并 表头 </a> <br/>
	<a href="demo/datagrid/footer.jsp">表格_表尾 </a> <br/>
	<a href="demo/datagrid/frozenrows.jsp">表格冻结行/列 </a> <br/>
	<a href="demo/datagrid/mergecells.jsp">表格合并Cell </a> <br/>
	<a href="demo/datagrid/multisorting.jsp">表格排序_(服务端) </a> <br/>
	<a href="demo/datagrid/rowediting.jsp">表格编辑  </a> <br/> 
	<a href="demo/datagrid/contextmenu.jsp">表格_表头右键显示列(表格头部右键) ,数据右击没有？  </a> <br/>
	
	<a href="demo/tree/contextmenu.jsp">tree/contextmenu </a> <br/>
	<a href="demo/tree/dnd.jsp">tree/drop and drag</a> <br/>
	<a href="demo/tree/icons.jsp">tree/icons </a> <br/>
	
	 <a href="demo/treegrid/treegrid_lines.jsp"> treegrid 数据格式是  children </a> <br/> 
	 <a href="demo/treegrid/treegrid_action.jsp"> treegrid  数据格式是  _parentId 表格树  动态展开,有手写的展开指定层级</a> <br/> 
	 <a href="demo/treegrid/treegrid_contextmenu.jsp"> treegrid 表格树  右键菜单 </a> <br/> 
	 <a href="demo/treegrid/treegrid_editable.jsp"> treegrid 表格树  可编辑 </a> <br/> 
	 
	 <a href="demo/propertygrid/basic.jsp">propertygrid/basic </a> <br/>
		
		 
	<p>form</p>
	
	<a href="demo/form/load.jsp">表单 加载初始数据 </a> <br/>
	<a href="demo/form/onSubmitValidate.jsp">表单 提交时才验证 </a> <br/>
	<a href="demo/form/ajaxFormJson.jsp">表单 ajax json,  </a> <br/>
		
	<p>component</p> 
	
	<a href="demo/textBox/textWithIconsClear.jsp">textBox/textWithIconsClear </a> <br/> 
	<a href="demo/passwordBox/flashLetters.jsp">passwordBox/flashLetters </a> <br/>
	<a href="demo/searchBox/category.jsp">searchBox/category </a> <br/>
	<a href="demo/fileBox/fileBox.jsp">fileBox/fileBox</a> <br/>
	
 	<a href="demo/comboBox/remoteData.jsp">combobox remote input</a> <br/>
	<a href="demo/comboBox/multiSelect.jsp">combobox multiSelect</a> <br/>
	
	<a href="demo/linkButton/toggle.jsp">linkButton/toggle 按下高亮</a> <br/>
	<a href="demo/linkButton/group.jsp">linkButton/group </a> <br/>
	<a href="demo/switchButton/basic.jsp">switchButton 手机开关</a> <br/>
	<a href="demo/radioButton/basic.jsp">radioButton </a> <br/>
	
	<a href="demo/progressBar/basic.jsp">progressBar </a> <br/>
    <a href="demo/slider/sliderRule.jsp">slider/sliderRule </a> <br/>
	
	<a href="demo/menu/rightMenu.jsp">menu/rightMenu</a> <br/>
		
	<a href="demo/tooltip/tooltipStyle.jsp">tooltip/tooltipStyle  </a> <br/>
	<a href="demo/tooltip/tooltipToolBar.jsp">tooltip/tooltipToolBar   </a> <br/>
	
	
	<a href="demo/datetimebox/datebox.jsp">日期选择</a> <br/>
	<a href="demo/datetimebox/datetimebox.jsp">日期时间选择</a> <br/>
	
	<br/>
	 tutorial
	<hr/>
	<a href="tutorial/datagrid/datagrid12_demo.jsp">表格行内编辑  DataGrid inline editing </a> <br/>
	 
	 
	 <br/>
	 extension
	<hr/>
	 <a href="extension/datagrid-detailview/datagrid-detailview.html">datagrid-detailview </a> <br/>
	 <a href="extension/datagrid-detailview/datagrid-detailview_update-form.html">	datagrid-detailview_update-form.html</a> <br/>

	my 
 	<hr/>
 	basic <br/>
 	
 	<a href="my/tooltip.jsp"> my tooltip no js  </a> <br/>
 	<a href="my/message.jsp"> Message Alert click invoke function  </a> <br/>
 	<a href="my/layout.jsp">layout </a> <br/>
 	<a href="my/sqlView.jsp">sqlView ,table 动态column (在 J_SpringMVC 项目中有 连接DB的) </a> <br/>
 	
 	box<br/>
 	<a href="my/myValidateBox.jsp">ValidateBox 表单 select可查询,文本框可验证, 得到JSON ，/serializeArray 如果  对 禁用的combobox 和 combobox未选择值 的，这样根本拿不到字段名???? </a> <br/>
 	<a href="my/myComboBox.jsp">comboBox 不可输入的 ,没有下箭头按钮,JSONP 输入一半不选还在 自定义onHidePanel的函数或用limitToList, 动态从网络取onChange为何选中后显示的是值 ？？？？,</a> <br/>
 	<a href="my/myTagBoxAutoComplete.jsp">tagBox/tagBoxAutoComplete 输入一半不选还在,limitToList没用???  onHidePanel OK ,onChange没用？？？ </a> <br/>
 
	grid<br/>
 	<a href="easyUI/queryPage?action=init">datagrid 表格_分页_工具栏_一行更新_checkBox多选删   </a> <br/>
    <a href="my/treegrid_servePage.jsp"> treegrid 服务端分页 </a> <br/>
 	<a href="my/treegrid_editor_tagBox.jsp"> treegrid 行内 tagbox编辑 , 删除选中的有问题？？？？？？？？？？？</a> <br/>
 	
 	
 <br/>
 	
</body>
</html>