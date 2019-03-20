<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Basic CheckBox - jQuery EasyUI Demo</title>
  <!-- 
	<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	 -->
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/icon.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
	
</head>
<body>
     
    <script type="text/javascript">
   
    function switchOnOff()
    {
    	if( $('#mySwitch').switchbutton('options').checked)
   		{
    		$('#mySwitch').switchbutton({
   	           // checked: false ,
   	         	value:false  //这样才行
   	        });
    		$('#mySwitch').switchbutton('uncheck');//正常，也用修改checked属性方式
    		//$('#mySwitch').switchbutton('setValue',false);//setValue没用 ???
   		}else
		{
   			$('#mySwitch').switchbutton({
	        //     checked: true,
	             value:true
	         });
   			$('#mySwitch').switchbutton('check');
   			//$('#mySwitch').switchbutton('setValue',true); 
		} 
    	console.log($('#mySwitch').switchbutton().val());
    }
    </script>
    <br/> switchbutton <br/> 
    
    <input id="mySwitch" class="easyui-switchbutton" value="yes" data-options="onText:'开',offText:'关'">
    <button type="button" onclick="switchOnOff()">switch开关</button>
    
    
</body>