<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Insert title here</title>

	<jsp:include page="../commonHead.jsp"/>
	
<style>
	#draggable { width: 350px; height: 250px; padding: 0.5em; }
	#draggable_x { width: 150px; height: 50px; padding: 0.5em; }
	 #set div { width: 90px; height: 90px }
</style>
<script>
$(function() {
	
	var $start_counter = $( "#event-start" ),
	$drag_counter = $( "#event-drag" ),
	$stop_counter = $( "#event-stop" ),
	counts = [ 0, 0, 0 ];
	
	//$( "#draggable" ).draggable();
	$( "#draggable" ).draggable({
		start: function() {
			counts[ 0 ]++;
			updateCounterStatus( $start_counter, counts[ 0 ] );
		},
		drag: function() {
			counts[ 1 ]++;
			updateCounterStatus( $drag_counter, counts[ 1 ] );
		},
		stop: function() {
			counts[ 2 ]++;
			updateCounterStatus( $stop_counter, counts[ 2 ] );
		},
		snap: true,//自动捕获到其它可拖动的边角
		grid: [ 50,50 ]//每50个单位跳动一,和snap为true只可以一个生效
	});
	
	function updateCounterStatus( $event_counter, new_count ) {
		// first update the status visually...
		if ( !$event_counter.hasClass( "ui-state-hover" ) ) {
			$event_counter.addClass( "ui-state-hover" )
				.siblings().removeClass( "ui-state-hover" );
		}
		// ...then update the numbers
		$( "span.count", $event_counter ).text( new_count );
	}
	//--------
	$( "#draggable_x" ).draggable({ axis: "y" });//只可在y方向移动
	$( "#draggable_y" ).draggable({ axis: "x" });
	$( "#draggable3" ).draggable({ containment: "#containment-wrapper"});
	$( "#draggable5" ).draggable({ containment: "parent" });//只可在父容器中移动

	$( "#draggable_help" ).draggable({ opacity: 0.7, helper: "clone" });//产生一个新影,原不动
	$( "#draggable_help_my" ).draggable({
		cursor: "move",
		cursorAt: { top: -12, left: -20 },
		helper: function( event ) {
			return $( "<div class='ui-widget-header'>I'm a custom helper</div>" );
		}
	});
	
	$( "#set div" ).draggable({ stack: "#set div" });//stack 的所有元素,是自动调整,当然拖动的放在其它的前面
	$( "#draggable_handle" ).draggable({ handle: "p" });//#draggable_handle中的<p>才可拖动
	$( "#draggable_handle_not" ).draggable({ cancel: "p.ui-widget-header" });//#draggable_handle中的<p>不能拖动
	
	$( "div, p" ).disableSelection();
	//-----
	$( "#sortable" ).sortable();
	$( "#draggable_sort" ).draggable({
		connectToSortable: "#sortable",//可以拖到一个排序区
		helper: "clone"
	});
	$( "ul, li" ).disableSelection();//li文本不可被选择
	
});	 
</script>
</head>
<body>
 

<div id="draggable" class="ui-widget ui-widget-content">
	<p>Drag me to trigger the chain of events.</p>
	<ul class="ui-helper-reset" >
		<li id="event-start" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-play"></span>"start" invoked <span class="count">0</span>x</li>
		<li id="event-drag" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-arrow-4"></span>"drag" invoked <span class="count">0</span>x</li>
		<li id="event-stop" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-stop"></span>"stop" invoked <span class="count">0</span>x</li>
	</ul>
</div>
<!-- ------------ -->
<div id="draggable_x" class="draggable ui-widget-content">
	<p>I can be dragged only horizontally</p>
</div>

<div id="draggable_y" class="draggable ui-widget-content" style="width:150px; height:50px;">
	<p>I can be dragged only horizontally </p>
</div>

<div id="containment-wrapper" style="width:250px; height:250px; border:2px solid #ccc; " >
	<div id="draggable3" class="draggable ui-widget-content" style="width:150px; height:50px;">
		<p>I'm contained within the box</p>
	</div>

	<div class="draggable ui-widget-content" style="width:150px; height:150px;">
		<p id="draggable5" class="ui-widget-header" style="width:50px;">I'm contained</p>
	</div>
</div>

<div id="set">
	<div class="ui-widget-content">
		<p>We are draggables..</p>
	</div>

	<div class="ui-widget-content">
		<p>..whose z-indexes are controlled automatically..</p>
	</div>

	<div class="ui-widget-content">
		<p>..with the stack option.</p>
	</div>
</div>

<div id="draggable_help" class="ui-widget-content"  style="width:150px; height:50px;">
	<p>Semi-transparent clone</p>
</div>

<div id="draggable_help_my" class="ui-widget-content"  style="width:150px; height:80px;">
	<p>Custom helper (in combination with cursorAt)</p>
</div>


<div id="draggable_handle" class="ui-widget-content" style="width:150px; height:180px;">
	<p class="ui-widget-header">I can be dragged only by this handle</p>
</div>

<div id="draggable_handle_not" class="ui-widget-content" style="width:150px; height:180px;">
	<p>You can drag me around&hellip;</p>
	<p class="ui-widget-header">&hellip;but you can't drag me by this handle.</p>
</div>


<!--  Sortable -->
<ul  >
	<li id="draggable_sort" class="ui-state-highlight" style=" height:30px;">Drag me down</li>
</ul>

<ul id="sortable" style="list-style-type: none"> <!-- 不要项目前的 "." -->
	<li class="ui-state-default">Item 1</li>
	<li class="ui-state-default">Item 2</li>
	<li class="ui-state-default">Item 3</li>
	<li class="ui-state-default">Item 4</li>
	<li class="ui-state-default">Item 5</li>
</ul>

<p>
test
</p>

</body>
</html>



