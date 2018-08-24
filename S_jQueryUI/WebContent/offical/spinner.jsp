<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Spinner </title>

	<jsp:include page="../commonHead.jsp"/>
	
<script type="text/javascript">
$(function() {
	var spinner = $( "#spinner" ).spinner(
		{
			step: 0.01,//小数
			min: 5,
			start: 1000,
			max: 2500,
			numberFormat: "C", //才可在前加$
			spin: function( event, ui )//还有change,stop 响应回调,但要重新去取值,不传的
				{
					$("#logDiv").append( $("<p>").html("spin value:"+ui.value) );//ui.value得到值
				}
		});
	$( "#spinner" ).spinner( "option", "culture", "en-US" );//en-US是$
	
	$( "#disable" ).click(function() {
		if ( spinner.spinner( "option", "disabled" ) )//尾多一个d字母,取状态 
			spinner.spinner( "enable" );//修改
		  else  
			spinner.spinner( "disable" );
	});
	$( "#getvalue" ).click(function() {
		alert( spinner.spinner( "value" ) );//取值
	});
	$( "#setvalue" ).click(function() {
		spinner.spinner( "value", 5 );//设值
	});
	//----
	$( "button" ).button();
});

</script>



</head>
<body>
<p>
	<label for="spinner">Select a value:</label>
	<input id="spinner" >
</p>

<p>
	<button id="disable">Toggle disable/enable</button>
</p>

<p>
	<button id="getvalue">Get value</button>
	<button id="setvalue">Set value to 5</button>
</p>
<div id="logDiv" class="ui-widget-content" style="width:200px;height:100px"></div>


</body>
</html>