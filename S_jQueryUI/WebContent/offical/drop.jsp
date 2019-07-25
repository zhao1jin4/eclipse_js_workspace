<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>DROP </title>

	<jsp:include page="../commonHead.jsp"/>
	
	
<style>
</style>
<script>
$(function() {
	$( "#draggable" ).draggable();
	$( "#droppable, #droppable-inner" ).droppable({
		accept: "#draggable",//接收只定元素,可用":not(#draggable)""
		greedy: true,//防止父级容器接收
		activeClass: "ui-state-hover",
		hoverClass: "ui-state-active",
		drop: function( event, ui ) {
			$( this )
				.addClass( "ui-state-highlight" )
				.find( "> p" )
					.html( "Dropped!" );
		}
	});
	//----------------
	
	$( "#draggable_revert" ).draggable({ revert: "valid" });//不可拖入droppable的地方
	$( "#draggable_revert2" ).draggable({ revert: "invalid" });//必须拖到可droppable的地方
	$( "#droppable_revert" ).droppable({
		activeClass: "ui-state-hover",
		hoverClass: "ui-state-active",
		drop: function( event, ui ) {
			$( this )
				.addClass( "ui-state-highlight" )
				.find( "p" )
					.html( "Dropped!" );
		}
	});
	
	//----------------
	
	$( "#catalog" ).accordion();
	$( "#catalog li" ).draggable({
		//appendTo: "body",
		helper: "clone"
	});
	$( "#cart ol" ).droppable({
		activeClass: "ui-state-default",
		hoverClass: "ui-state-hover",
		accept: ":not(.ui-sortable-helper)",//可用:not()
		drop: function( event, ui ) {
			$( this ).find( ".placeholder" ).remove();
			$( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );//ui.draggable.得到拖入的元素
		}
	})
	/*.sortable({
		items: "li:not(.placeholder)",
		sort: function() {
			// gets added unintentionally by droppable interacting with sortable
			// using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
			$( this ).removeClass( "ui-state-default" );
		}
	})*/
	;
});	 
</script>
</head>
<body>
 
	<div id="draggable" class="ui-widget-content" style="width: 80px; height: 50px;">
		<p>Drag me to my target</p>
	</div>
	
	<div id="droppable" class="ui-widget-header" style="width: 230px; height: 120px;">
		<p>Outer droppable</p>
		<div id="droppable-inner" class="ui-widget-header" style="width: 170px; height: 60px;">
			<p>Inner droppable (not greedy)</p>
		</div>
	</div>
	 
	 
	 
	 
	 
	<div id="draggable_revert" class="ui-widget-content" style="width: 170px; height: 60px;">
		<p>不可拖入droppable的地方</p>
	</div>
	
	<div id="draggable_revert2" class="ui-widget-content" style="width: 170px; height: 60px;">
		<p>必须拖到可droppable的地方</p>
	</div>
	
	<div id="droppable_revert" class="ui-widget-header" style="width: 230px; height: 120px;">
		<p>Drop me here</p>
	</div>
	 
	 
	 <div id="catalog">
		<h2><a href="#">T-Shirts</a></h2>
		<div>
			<ul>
				<li>Lolcat Shirt</li>
				<li>Cheezeburger Shirt</li>
				<li>Buckit Shirt</li>
			</ul>
		</div>
		<h2><a href="#">Bags</a></h2>
		<div>
			<ul>
				<li>Zebra Striped</li>
				<li>Black Leather</li>
				<li>Alligator Leather</li>
			</ul>
		</div>
		<h2><a href="#">Gadgets</a></h2>
		<div>
			<ul>
				<li>iPhone</li>
				<li>iPod</li>
				<li>iPad</li>
			</ul>
		</div>
	</div>
	
	
	
	<div id="cart" class="ui-widget-content">
		<ol>
			<li class="placeholder">Add your items here</li>
		</ol>
	</div>
	
</body>
</html>



