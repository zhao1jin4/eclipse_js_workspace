<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Frozen Rows in DataGrid - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	<h2>Frozen Rows in DataGrid</h2>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div>This sample shows how to freeze some rows that will always be displayed at the top when the datagrid is scrolled down.</div>
	</div>
	<div style="margin:10px 0;"></div>
	<table class="easyui-datagrid" title="Frozen Rows in DataGrid" style="width:700px;height:250px"
			data-options="
				singleSelect: true,
				collapsible: true,
				rownumbers: true,
				url: 'datagrid_data1.json',
				method: 'get',
				onLoadSuccess: function(){
					$(this).datagrid('freezeRow',0).datagrid('freezeRow',1);
				}
			">
		<thead data-options="frozen:true">
			<tr>
				<th data-options="field:'itemid',width:100">Item ID</th>
				<th data-options="field:'productid',width:120">Product</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th data-options="field:'listprice',width:90,align:'right'">List Price</th>
				<th data-options="field:'unitcost',width:90,align:'right'">Unit Cost</th>
				<th data-options="field:'attr1',width:230">Attribute</th>
				<th data-options="field:'status',width:60,align:'center'">Status</th>
			</tr>
		</thead>
	</table>

</body>
</html>