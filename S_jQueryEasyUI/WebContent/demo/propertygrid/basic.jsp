<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Basic PropertyGrid - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	<h2>Basic PropertyGrid</h2>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div>Click on row to change each property value.</div>
	</div>
	<div style="margin:10px 0;">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="showGroup()">ShowGroup</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="hideGroup()">HideGroup</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="showHeader()">ShowHeader</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="hideHeader()">HideHeader</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="getChanges()">GetChanges</a>
	</div>
	<table id="pg" class="easyui-propertygrid" style="width:300px"
			data-options="url:'../propertygrid/propertygrid_data1.json',showGroup:true,scrollbarSize:0"></table>

	<script type="text/javascript">
		function showGroup(){
			$('#pg').propertygrid({
				showGroup:true
			});
		}
		function hideGroup(){
			$('#pg').propertygrid({
				showGroup:false
			});
		}
		function showHeader(){
			$('#pg').propertygrid({
				showHeader:true
			});
		}
		function hideHeader(){
			$('#pg').propertygrid({
				showHeader:false
			});
		}
		function getChanges(){
			var s = '';
			var rows = $('#pg').propertygrid('getChanges');
			for(var i=0; i<rows.length; i++){
				s += rows[i].name + ':' + rows[i].value + ',';
			}
			alert(s)
		}
	</script>
</body>
</html>