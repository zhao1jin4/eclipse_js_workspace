<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>slider </title>

	<jsp:include page="../commonHead.jsp"/>
	
	
<style type="text/css">
	#slider .ui-slider-range { background: red; } /* 修改 slider外观*/
	#slider .ui-slider-handle { border-color: red; }
</style>
<script>
	$(function() {
		//$( "#slider" ).slider();
		$( "#slider" ).slider({
			range: "min",//"min"小数值区高亮 ,"max"大数值区高亮
			orientation: "vertical",
			value:100,
			min: 0,
			max: 500,
			//step: 50,
			slide: function( event, ui ) {//滑动过程中
				$( "#amount" ).text( "slide$" + ui.value );//ui带value属性
			},
			change:function( event, ui ) {//滑动完成
				$( "#amount" ).text( "change$" + ui.value );
			}
		});
		$( "#amount" ).text( "$" + $( "#slider" ).slider( "value" ) );//取值
		//-----
		$( "#slider-range" ).slider({
			range: true,
			min: 20,
			max: 500,
			values: [ 75, 300 ],//values数组
			slide: function( event, ui ) {
				$( "#amount_range" ).text( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );//ui带values数组
			}
		});
		$( "#amount_range" ).text( "$" + $( "#slider-range" ).slider( "values", 0 ) + //values 传索引,取值
			" - $" + $( "#slider-range" ).slider( "values", 1 ) );
		
		$( "#mySelect" ).change(function() {
			$( "#slider" ).slider( "value", this.selectedIndex + 1 );//修改值 ,会调用change:的处理函数
		});
	});
	</script>
</head>
<body>

<label id="amount"></label>
<div id="slider"></div>
<select id="mySelect">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
</select>
	
<label id="amount_range"></label>
<div id="slider-range"></div>


</body>
</html>