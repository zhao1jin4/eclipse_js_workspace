<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sortable</title>

	<jsp:include page="../commonHead.jsp"/>
	

<style>
	#sortable1,#sortable2 ,#sortable3{ list-style-type: none;  float: left;width: 180px; height:200px; }
	#sortable1 li ,#sortable2 li {  padding-left: 20px;  height: 18px;float: left; }
	#sortable1 li span,#sortable2 li span { position: absolute; margin-left: -20px }
	
	#sortable_tab1 li, #sortable_tab2 li {width: 120px; }
	
	/* 控制拖动时,产生虚线背景,颜色同前景色,!important 提高CSS优先级 */
	.ui-sortable-placeholder { border: 1px dotted black; visibility: visible !important; height: 50px !important;  }
	.ui-sortable-placeholder * { visibility: hidden; }
</style>
<script>
	$(function() {
		$("#sortable").sortable();
		$("#sortable1,#sortable2,#sortable3").sortable({
				placeholder: "ui-state-highlight",
				connectWith: ".connectedSortable",//与另一个sortable 可相互拖动自动排列
				dropOnEmpty: false ,//如果另一个sortable 是空的,则不可放入
				items: "li:not(.ui-state-disabled)",
				cancel: ".not_moved"
			}).disableSelection();
		//------------------		
		$( "#sortable_tab1, #sortable_tab2" ).sortable().disableSelection();
		var $tabs = $( "#tabs" ).tabs();
		var $tab_items = $( "ul:first li", $tabs ).droppable({
			accept: ".connectedSortable_tab li",
			hoverClass: "ui-state-hover",
			drop: function( event, ui ) {
				var $item = $( this );//this是被.droppable的tab标签页
				var $list = $( $item.find( "a" ).attr( "href" ) )//二级
					.find( ".connectedSortable_tab" );

				ui.draggable.hide( "slow", function() {
					$tabs.tabs( "option", "active", $tab_items.index( $item ) );//显示指定的标签页
					$( this ).appendTo( $list ).show( "slow" );//this是ui.draggable的列表项
				});
			}
		});
	});
</script>
</head>
<body>


<ul id="sortable" style="width:300px" >
	<li class="ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
	<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
	<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
	<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
</ul>
<ul id="sortable1"  class="connectedSortable">
	<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
	<li class="ui-state-default ui-state-disabled"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
	<li class="ui-state-default not_moved"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>unMove</li>
	<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
</ul>
<ul id="sortable2" class="connectedSortable" >
	<li class="ui-state-highlight">Item 1</li>
	<li class="ui-state-highlight ui-state-disabled">Item 2</li>
	<li class="ui-state-highlight not_moved">unMove</li>
	<li class="ui-state-highlight">Item 4</li>
	<li class="ui-state-highlight">Item 5</li>
	<li class="ui-state-highlight">Item 6</li>
</ul>

<ul id="sortable3" class="connectedSortable" style="background: blue;height:150px;">
</ul>



<div id="tabs" style="clear:left">
	<ul>
		<li><a href="#tabs-1">Nunc tincidunt</a></li>
		<li><a href="#tabs-2">Proin dolor</a></li>
	</ul>
	<div id="tabs-1">
		<ul id="sortable_tab1" class="connectedSortable_tab ui-helper-reset">
			<li class="ui-state-default">Item 1</li>
			<li class="ui-state-default">Item 2</li>
			<li class="ui-state-default">Item 3</li>
			<li class="ui-state-default">Item 4</li>
			<li class="ui-state-default">Item 5</li>
		</ul>
	</div>
	<div id="tabs-2">
		<ul id="sortable_tab2" class="connectedSortable_tab ui-helper-reset">
			<li class="ui-state-highlight">Item 1</li>
			<li class="ui-state-highlight">Item 2</li>
			<li class="ui-state-highlight">Item 3</li>
			<li class="ui-state-highlight">Item 4</li>
			<li class="ui-state-highlight">Item 5</li>
		</ul>
	</div>
</div>

</body>
</html>