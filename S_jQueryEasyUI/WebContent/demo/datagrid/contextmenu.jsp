<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Context Menu on DataGrid - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	<h2>Context Menu on DataGrid</h2>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div>Right click on the header of DataGrid to display context menu.</div>
	</div>
	<div style="margin:10px 0;"></div>
	<table id="dg"></table>
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({
				url: 'datagrid_data1.json',
				method: 'get',
				title: 'Context Menu on DataGrid',
				iconCls: 'icon-save',
				width: 700,
				height: 250,
				fitColumns: true,
				singleSelect: true,
				columns:[[
					{field:'itemid',title:'Item ID',width:80},
					{field:'productid',title:'Product ID',width:120},
					{field:'listprice',title:'List Price',width:80,align:'right'},
					{field:'unitcost',title:'Unit Cost',width:80,align:'right'},
					{field:'attr1',title:'Attribute',width:250},
					{field:'status',title:'Status',width:60,align:'center'}
				]],
				onHeaderContextMenu: function(e, field){
					e.preventDefault();
					if (!cmenu){
						createColumnMenu();
					}
					cmenu.menu('show', {
						left:e.pageX,
						top:e.pageY
					});
				}
			});
		});
		var cmenu;
		function createColumnMenu(){
			cmenu = $('<div/>').appendTo('body');
			cmenu.menu({
				onClick: function(item){
					if (item.iconCls == 'icon-ok'){
						$('#dg').datagrid('hideColumn', item.name);
						cmenu.menu('setIcon', {
							target: item.target,
							iconCls: 'icon-empty'
						});
					} else {
						$('#dg').datagrid('showColumn', item.name);
						cmenu.menu('setIcon', {
							target: item.target,
							iconCls: 'icon-ok'
						});
					}
				}
			});
			var fields = $('#dg').datagrid('getColumnFields');
			for(var i=0; i<fields.length; i++){
				var field = fields[i];
				var col = $('#dg').datagrid('getColumnOption', field);
				cmenu.menu('appendItem', {
					text: col.title,
					name: field,
					iconCls: 'icon-ok'
				});
			}
		}
	</script>
</body>
</html>