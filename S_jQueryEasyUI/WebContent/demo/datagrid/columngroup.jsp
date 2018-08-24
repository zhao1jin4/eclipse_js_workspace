<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Column Group - jQuery EasyUI Demo</title>
	 <jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	<h2>Column Group</h2>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div>The header cells can be merged. Useful to group columns under a category.</div>
	</div>
	<div style="margin:10px 0;"></div>
	<table class="easyui-datagrid" title="Column Group" style="width:700px;height:250px"
			data-options="rownumbers:true,singleSelect:true,url:'datagrid_data1.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80" rowspan="2">Item ID</th>
				<th data-options="field:'productid',width:100" rowspan="2">Product</th>
				<th colspan="4">Item Details</th>
			</tr>
			<tr>
				<th data-options="field:'listprice',width:80,align:'right'">List Price</th>
				<th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
				<th data-options="field:'attr1',width:240">Attribute</th>
				<th data-options="field:'status',width:60,align:'center'">Status</th>
			</tr>
		</thead>
	</table>

</body>
</html>