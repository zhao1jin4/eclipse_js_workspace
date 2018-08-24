<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<jsp:include page="../commonHead.jsp"/>
	
	<script type="text/javascript">
		$(function() {
			$( "#check" ).button();
			$( "#format" ).buttonset();
		});
		
		$(function() {
			$( "#myRadio" ).buttonset();
		});
		
		$(function() {
			$( "button:first" ).button({
				icons: {
					primary: "ui-icon-locked"
				},
				text: false
			}).next().button({
				icons: {
					primary: "ui-icon-locked"
				}
			}).next().button({
				icons: {
					primary: "ui-icon-gear",// 齿轮
					secondary: "ui-icon-triangle-1-s"//向下的键头
				}
			}).next().button({
				icons: {
					primary: "ui-icon-gear",
					secondary: "ui-icon-triangle-1-s"
				},
				text: false
			});
		});
	</script>
	
	
	<style>
		.ui-menu { 
				position: absolute; /* 是浮在上面的   */
				width: 100px; 
			 }
	</style>
	<script>
	$(function() {
		$( "#rerun" )
			.button()
			.click(function() {
				alert( "Running the last action" );
			})
			.next()//#select
				.button({
					text: false,
					icons: {
						primary: "ui-icon-triangle-1-s"
					}
				})
				.click(function() {
					var menu = $( this ).parent().next().show().position({ //$(this).parent().next()是<ul>
						my: "left top",//当前的<ul>元素的左顶 与 #select 的左底对齐
						at: "left bottom",
						of: this //#select
					});
					//在其它地方点击,菜单会被隐藏
					$( document ).one( "click", function() {//one ,一次性的事件处理函数,只会被执行一次,因每次单击都会被注册
						menu.hide();
					});
					return false;
				})
				.parent()
					.buttonset()
					.next()
						.hide()
						.menu();//menu()操作对<ul>元素,子级<li>是菜单项,再级<ul>是子菜单
	});
	</script>
 </head>
 
 <body>
 	<div class="ui-icon ui-icon-minusthick">减号图标</div>
	<div class="ui-icon ui-icon-plusthick">加号图标</div>
	<div class="ui-icon ui-icon-arrowthick-2-n-s">南北宽箭头图标</div>
	<div class="ui-icon ui-icon-circle-arrow-e">带圆底,东箭头图标</div>
	<div class="ui-icon ui-icon-circle-arrow-s">带圆底,南箭头图标</div>
	<div class="ui-icon ui-icon-circle-check">带圆底,对号图标</div>
	<div class="ui-icon ui-icon-triangle-1-s">南三角图标</div>
	<div class="ui-icon ui-icon-close">X关闭图标</div>
	<div class="ui-icon ui-icon-gear">齿轮图标</div>
	<div class="ui-icon ui-icon-locked">锁图标</div>
 	<span class="ui-icon ui-icon-volume-on" ></span><!-- 声音图标 -->
	<span class="ui-icon ui-icon-signal" ></span> <!-- 无线信号图标 -->
	<span class="ui-icon ui-icon-pencil"></span> <!-- 吸色图标 -->
	<div class="ui-icon ui-icon-alert"> 叹号图标</div>
	<span class="ui-icon ui-icon-disk"></span>软盘图标
	<span class="ui-icon ui-icon-zoomin"></span>放大图标
	<span class="ui-icon ui-icon-zoomout"></span>缩小图标
	<span class="ui-icon ui-icon-print"></span>打印图标
	<!-- 其它的看.css文件中,和图片中的图标-->


	<input type="checkbox" id="check" /><label for="check">Toggle</label>
	
	<!--  必须有 id="x" -->
	<div id="format">
		<input type="checkbox" id="check1" /><label for="check1">B</label>
		<input type="checkbox" id="check2" /><label for="check2">I</label>
		<input type="checkbox" id="check3"/><label for="check3">U</label>
	</div>
	<!--  必须有 id="x" -->
	<div id="myRadio" >
		<input type="radio" id="radio1" name="group" /><label for="radio1">Choice 1</label>
		<input type="radio" id="radio2" name="group" checked="checked" /><label for="radio2">Choice 2</label>
		<input type="radio" id="radio3" name="group" /><label for="radio3">Choice 3</label>
	</div>
	 	
 	<button>Button with icon only</button>
	<button>Button with icon on the left</button>
	<button>Button with two icons</button>
	<button>Button with two icons and no text</button>


	<!-- 弹出菜单 -->
	<div  class="ui-widget-header ui-corner-all"> <!-- 工具栏式 -->
		<div>
			<button id="rerun">Run last action</button>
			<button id="select">Select an action</button>
		</div>
		<ul><!-- //menu()操作对<ul>元素,子级<li>是菜单项,再级<ul>是子菜单 -->
			<li><a href="#">Open...</a></li>
			<li><a href="#">Save</a></li>
			<li><a href="#">Delete</a></li>
		</ul>
	</div>
	<div>这个不会被推开</div>
</body>
</html>
 
	