<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Multiple Sorting - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	<h2>Multiple Sorting</h2>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div>Set 'multiSort' property to true to enable multiple column sorting.</div>
	</div>
	<div style="margin:10px 0;"></div>
	
	<table class="easyui-datagrid" title="Multiple Sorting" style="width:700px;height:250px"
			data-options="singleSelect:true,collapsible:true,
				url:'datagrid_data1.json',
				method:'get',
				remoteSort:false,
				multiSort:true
			">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80,sortable:true">Item ID</th>
				<th data-options="field:'productid',width:100,sortable:true">Product</th>
				<th data-options="field:'listprice',width:80,align:'right',sortable:true">List Price</th>
				<th data-options="field:'unitcost',width:80,align:'right',sortable:true">Unit Cost</th>
				<th data-options="field:'attr1',width:250">Attribute</th>
				<th data-options="field:'status',width:60,align:'center'">Status</th>
			</tr>
		</thead>
	</table>

</body>
</html>