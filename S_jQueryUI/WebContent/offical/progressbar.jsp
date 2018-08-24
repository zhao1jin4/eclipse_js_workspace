<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>progree bar</title>


	<jsp:include page="../commonHead.jsp"/>
	
	
 <style>
	.progress-label 
	{
		float: left;/*文字浮在进度条上面*/
		margin-left: 50%;/* 居中*/
		margin-top: 5px;/* 与顶部的距离*/
	} 
</style>
<script>
$(function() {
	var progressLabel = $( ".progress-label" );//是里面的DIV的CSS
	var progressbarDiv=$( "#progressbarDiv" );
	progressbarDiv.progressbar({
		value: 37,
		change: function() {
			progressLabel.text( progressbarDiv.progressbar( "value" ) + "%" );
		},
		complete: function() {
			progressLabel.text( "Complete!" );
		}
	});
	progressbarValue =$( "#progressbarDiv" ).find( ".ui-progressbar-value" );//只是这个CSS,要在建立后
	progressbarValue.css({"background": 'yellow'});
	function doProgress() 
	{
		var val = $( "#progressbarDiv" ).progressbar( "value" ) || 0;//取值
				  $( "#progressbarDiv" ).progressbar( "value", val + 1 );//修改,转换为数字
		if ( val < 99 ) 
			setTimeout( doProgress, 1000 );
	}
	doProgress();
});
function modify()
{
	var txt=$("#downloaded").val();
	var num=parseInt(txt);//必须转换为数字
	$( "#progressbarDiv" ).progressbar( "option", {value: num});//option有于修改,必须是建立后
}
function notConfirm()
{ 
	$( "#progressbarNoValue" ).progressbar({value: 37});
	$( "#progressbarNoValue" ).progressbar( "option", "value", false );//不确定进度值的
}


</script>
</head>
<body>

	<div id="progressbarDiv"><div class="progress-label">Loading...</div></div>
	<input type="text" id="downloaded" /><button onclick="modify()" >修改数值</button>
	<br/>
	<div id="progressbarNoValue"></div>
	<button onclick="notConfirm()" >显示一个不确定进度</button>
</body>
</html>