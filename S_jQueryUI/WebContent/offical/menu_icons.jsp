<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>jQuery UI Menu - Icons</title>
		
	<jsp:include page="../commonHead.jsp"/>
	
	
	<script>
	$(function() {
		$( "#menu" ).menu();//menu()操作对<ul>元素,子级<li>是菜单项,再级<ul>是子菜单
	});
	</script>
	<style>
	.ui-menu { width: 150px; }
	</style>
</head>
<body>

<ul id="menu">
	<li><a href="#"><span class="ui-icon ui-icon-disk"></span>Save</a></li>
	<li><a href="#"><span class="ui-icon ui-icon-zoomin"></span>Zoom In</a></li>
	<li><a href="#"><span class="ui-icon ui-icon-zoomout"></span>Zoom Out</a></li>
	<li class="ui-state-disabled"><a href="#"><span class="ui-icon ui-icon-print"></span>Print...</a></li>
	<li>
		<a href="#">Playback</a>
		<ul>
			<li><a href="#"><span class="ui-icon ui-icon-seek-start"></span>Prev</a></li>
			<li><a href="#"><span class="ui-icon ui-icon-stop"></span>Stop</a></li>
			<li><a href="#"><span class="ui-icon ui-icon-play"></span>Play</a></li>
			<li><a href="#"><span class="ui-icon ui-icon-seek-end"></span>Next</a></li>
		</ul>
	</li>
</ul>

<div class="demo-description">
<p>A menu with the default configuration, showing how to use a menu with icons.</p>
</div>
</body>
</html>
