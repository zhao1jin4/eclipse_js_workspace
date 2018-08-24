<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resizable</title>

	<jsp:include page="../commonHead.jsp"/>
	
	
	<style>
		#resizable,#resizable_in,#resizable_also,#resizable_ghost{ width: 200px; height: 150px; }
		#container { width: 300px; height: 300px; }
		h3 { text-align: center; }
		.ui-resizable-helper { border: 2px dotted #00F; }
		
		.ui-resizable-se {bottom: 17px;}/*south east方向的键头 ,向上移动,对textarea无效*/
	</style>
	<script>
	$(function() {
		$( "#resizable_also" ).resizable();
		$( "#resizable" ).resizable({
					//aspectRatio: 16 / 9, //约束纵横比
					maxHeight: 350,
					maxWidth: 450,
					minHeight: 150,//使用时要与初始大小同,最好不要与aspectRatio同时使用
					minWidth: 200,
					grid: 50,
					alsoResize: "#resizable_also"//对另一个可resizable()做连动
				});
		$( "#resizable_in" ).resizable({
			containment: "#container", //高度出去的,与<h3>有关
			//ghost: true,//ghost不能与containment 一起使用,Bug!!!
		});
		/* 
		$( "#container" ).resizable({ //不能对已是containment的DIV再resizable,(即不能实现父容器大小变,子容器大小也变) Bug!!!
			//alsoResize: "#resizable_in" 
		});
		*/
		$( "#resizable_ghost" ).resizable({
			ghost: true,
			animate: true,
			helper: "ui-resizable-helper"//自己的CSS
		});
		/*
		$( "#resizable_textarea" ).resizable({//textarea不使用resizable(),默认也是可调大小的
			handles: "se"//south east方向的键头,可建立自定义样式,.ui-resizable-se
		});
		*/
	});
	</script>
</head>
<body>
<div style="float:left" >abc</div> <!-- style="float:left" -->
<div style="clear:left">123</div> <!-- style="clear:left" -->

<div id="resizable" class="ui-widget-content" >
	<h3 class="ui-widget-header">Resizable</h3>
</div>
<!-- resizable 做style="float:left"无效, 如何左右排列??? -->
<div id="resizable_also" class="ui-widget-content">
	<h3 class="ui-widget-header">also</h3>
</div>

<div id="container" class="ui-widget-content">
	<!-- <h3 class="ui-widget-header">Containment</h3> -->
	<div id="resizable_in" class="ui-state-active">
		<h3 class="ui-widget-header">Resizable</h3>
	</div>
</div>

<div id="resizable_ghost" class="ui-widget-content" >
	<h3 class="ui-widget-header">resizable_ghost animate helper</h3>
</div>

<textarea id="resizable_textarea"   rows="5" cols="20"></textarea>
</body>
</html>