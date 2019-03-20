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
     <h2>Basic CheckBox</h2>
    <form id="ff">
        <div style="margin-bottom:20px">
            <input id="myCheckBox" class="easyui-checkbox" name="fruit" value="Apple" label="Apple:">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-checkbox" name="fruit" value="Orange" label="Orange:">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-checkbox" name="fruit" value="Banana" label="Banana:">
        </div>
    </form>
    <script type="text/javascript">
    /* 
    //init
	$('#myCheckBox').checkbox({
        label: 'Apple:',
        value: 'Apple',
        checked: true
    });
	*/
	
	//做成 选中为true,不选为false ,SwitchButton不能 datagrid 的editor
    function checkOnOff()
    {
		if($("#myCheckBox").checkbox('options').checked)
		{
			$('#myCheckBox').checkbox('uncheck');
			$("#myCheckBox").checkbox('setValue',false);
		}
		else
		{
			$('#myCheckBox').checkbox('check');
			$("#myCheckBox").checkbox('setValue',true);
		}
		console.log($("#myCheckBox").val()); 
    }
    </script> 
    <button type="button" onclick="checkOnOff()">check开关</button>
    
   
    
    
</body>