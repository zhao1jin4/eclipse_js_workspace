<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Merge Cells for DataGrid - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	<h2>Merge Cells for DataGrid</h2>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div>Cells in DataGrid body can be merged.</div>
	</div>
	<div style="margin:10px 0;"></div>
	<table class="easyui-datagrid" title="Merge Cells for DataGrid" style="width:700px;height:250px"
			data-options="
				rownumbers: true,
				singleSelect: true,
				iconCls: 'icon-save',
				url: 'datagrid_data1.json',
				method: 'get',
				onLoadSuccess: onLoadSuccess
			">
		<thead>
			<tr>
				<th data-options="field:'productid',width:100">Product</th>
				<th data-options="field:'itemid',width:80">Item ID</th>
				<th data-options="field:'listprice',width:80,align:'right'">List Price</th>
				<th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
				<th data-options="field:'attr1',width:240">Attribute</th>
				<th data-options="field:'status',width:60,align:'center'">Status</th>
			</tr>
		</thead>
	</table>
	<script type="text/javascript">
		function onLoadSuccess(data){
			var merges = [{
				index: 2,
				rowspan: 2
			},{
				index: 5,
				rowspan: 2
			},{
				index: 7,
				rowspan: 2
			}];
			for(var i=0; i<merges.length; i++){
				$(this).datagrid('mergeCells',{
					index: merges[i].index,
					field: 'productid',
					rowspan: merges[i].rowspan
				});
			}
		}
	</script>
</body>
</html>