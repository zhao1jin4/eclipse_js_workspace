<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Drag Drop Tree Nodes - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	<h2>Drag Drop Tree Nodes</h2>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div>Press mouse down and drag a node to another position.</div>
	</div>
	<div style="margin:10px 0;"></div>
	<ul class="easyui-tree" data-options="url:'../tree/tree_data1.json',animate:true,dnd:true"></ul>

</body>
</html>