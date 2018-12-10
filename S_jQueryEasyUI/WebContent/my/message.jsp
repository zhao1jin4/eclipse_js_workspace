<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Message </title>
  <!-- 
	<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	 -->
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/icon.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
$(function (){
	
	 $('#dlg').dialog('close'); 

	//   要初始化 $(function (){ 才能正常显示  
	 $('#dlg2').dialog({
	 	    title: 'My Dialog',
	 	    width: 400,
	 	    height: 200,
	 	    modal: true,
	 	    toolbar:[{
	 			text:'Edit',
	 			iconCls:'icon-edit',
	 			handler:function(){alert('edit')}
	 		},{
	 			text:'Help',
	 			iconCls:'icon-help',
	 			handler:function(){alert('help')}
	 		}]
	  	}); 
	 $('#dlg2').dialog('close'); 
})
function showDialog()
{
	 $('#dlg2').dialog('open'); 
 }
  
	 
	 
 function showAlert()
 {
		$.messager.alert({
			title: 'My Title',
			msg: 'Here is a message!',
			icon:'info',
			fn: function(){
				console.log('after click button');
			}	
		});
 }
 
 
 
 function showToast()
 {
	//中心显示，会自动消失
	 $.messager.show({
			title:'My Title',
			msg:'Message will be closed after 2 seconds.',
			timeout:1000,
			showType:'fade',
			style:{
				right:'', 
				bottom:''
			}
		});
 }
 function showConfirm()
 {
	 $.messager.confirm({
			title: 'My Title',
			msg: 'Are you confirm this?',
			fn: function(r){
				if (r){
					alert('confirmed: '+r);
				}
			}
		});
 }
 function showPrompt()
 {
	 $.messager.prompt({
			title: 'Prompt',
			msg: 'Please enter your name:',
			fn: function(r){
				if (r){
					alert('Your name is:' + r);
				}
			}
		});
 }
	</script>
</head>
<body>
        <a onclick="showAlert()" class="easyui-linkbutton"  >showAlert</a> <br/>
         <a onclick="showConfirm()" class="easyui-linkbutton"  >showConfirm</a> <br/>
          <a onclick="showPrompt()" class="easyui-linkbutton"  >showPrompt</a> <br/>
         <a onclick="showDialog()" class="easyui-linkbutton"  >showDialog2</a>  要初始化 $(function (){ 才能正常显示  <br/>
         <a onclick="showToast()" class="easyui-linkbutton"  >showToast 显示 中心</a> <br/>
     <div style="margin:20px 0;">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('open')">Open</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('close')">Close</a>
    </div>
    <div id="dlg2"></div>
    <div id="dlg" class="easyui-dialog" title="Toolbar and Buttons" style="width:400px;height:200px;padding:10px;display:none"   >
              <select class="easyui-combobox" name="state" label="State:" labelPosition="top" style="width:100%;">
                <option value="AL">Alabama</option>
                <option value="AK">Alaska</option>
                <option value="AZ">Arizona</option>
                <option value="AR">Arkansas</option>
             </select>
             <a  class="easyui-linkbutton"  >button</a>
             <br/>
            <input class="easyui-datebox" label="Start Date:" labelPosition="top" style="width:100px;">
    </div>
</body>