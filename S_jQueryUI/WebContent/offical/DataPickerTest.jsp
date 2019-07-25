<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- 

<script src="js/jquery.ui.core.js"></script>
<script src="js/jquery.ui.widget.js"></script>
<script src="js/jquery.ui.datepicker.js"></script>
 -->
 
 
 
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Datepicker - Default functionality</title>
	
	<jsp:include page="../commonHead.jsp"/>
	
	<script>
		$(function() {
			
			
			$( "#datepicker" ).datepicker();//不能第一次使用 "option"方式
			$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd");//两个y,就会显示四位年,可mm/dd/yy
			$( "#datepicker" ).datepicker( "option", "showAnim", "clip" );//clip效果不错
			
			$( "#datepicker1" ).datepicker({
				dateFormat: "yy-mm-dd",
				showAnim : "clip",
				changeMonth: true,//下拉选择,月
				changeYear: true, //下拉选择,年
				showButtonPanel: true,//有今天,关闭按钮,没有清除???

				showWeek: true,//显示周 
				firstDay: 1,//周1是第一个
				
				showOn: "button",//以点击图标的方式显示
				buttonImage: "images/calendar.gif",//图像位置
				buttonImageOnly: true
			});
			
			$( "#datepicker" ).datepicker({ minDate: -20, maxDate: "+1M +10D" });//只可选最多前20天,后12个月+10天
			
			$( "#datepicker3" ).datepicker();//,可显示在div中 ,中文????
			
		});
	</script>
</head>
<body>

<p>Date: 		 <input type="text" id="datepicker" size="30"/></p>
<p>Date 下拉选择,周,按钮,图标<input type="text" id="datepicker1" size="30"/></p>
Date: 			<div id="datepicker3"></div><!-- 显示在div中 -->
<p>Date 选择限制 	 <input type="text" id="datepicker4" size="30"/></p>


<!--  月,年    中文??? --> 


</body>
</html>



 