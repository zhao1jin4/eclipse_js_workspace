<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Basic Form - jQuery EasyUI Demo</title>
	
	<!-- 
	<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	 -->
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/icon.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
	<style type ="text/css"> 

	</style>
	<script type="text/javascript">
	    // extend the 'equals' rule
	    $.extend($.fn.validatebox.defaults.rules, 
	    	{
			    equals://自定义方法
			    {
				    validator: function(value,param)
				    {
				   		return value == $(param[0]).val();
				    },
				    message: '两次输入的密码不相同'
			    }
	   		});
		$(function()
		{
			 //JS动态增加的表单做验证
		   $("<input type='text' name='other'/>").validatebox({
		    required: true,
		    validType: 'email'
		    }).appendTo($('form'));
		});
		
		function submitForm(){
			$('form').form('submit');
		}
		var editable=true;
		function toggleDisable()
		{
			if(editable)
			{
				
				$(".easyui-combobox").combobox({disabled:true});//combobox  {disabled:true} 和 'disable' 都行
				//$(".easyui-combobox").combobox('disable');
				
				//$(".easyui-validatebox").validatebox('disable');  //validatebox   {disabled:true} 和 'disable' 都行
				$(".easyui-validatebox").validatebox({disabled:true}); 
			
				$(".easyui-textbox").textbox({disabled:true});  //validatebox   {disabled:true} 和 'disable' 都行
				//$(".easyui-textbox").textbox('disable');
				
				//$(".easyui-datebox").datebox('disable'); //datebox  不会清空已有的数据
				$(".easyui-datebox").datebox({disabled:true});//insdep  版本 会清空已有的数据 
				
				 editable=false;
			}else
			{
				//$(".easyui-combobox").combobox({disabled:false});  
				$(".easyui-combobox").combobox('enable');
				
				//$(".easyui-validatebox").validatebox('enable');
				$(".easyui-validatebox").validatebox({disabled:true}); 
			
				$(".easyui-textbox").textbox({disabled:false}); 
				//$(".easyui-textbox").textbox('enable');
					
				//$(".easyui-datebox").datebox('enable');
				$(".easyui-datebox").datebox({disabled:false});
				
				 editable=true;
			}
		}
		function getFormData(){
			var fields = $( "#ff" ).serializeArray();
			//serializeArray 如果  对 禁用的combobox 和 combobox未选择值 的，这样根本拿不到字段名????
					
					
			//表单快速得到JSON 值 
			$.fn.serializeObject=function()
			{
				var obj={};
				var arrayField=$(this).serializeArray();
				$.each(arrayField,function()
				{
					if(obj[this.name])//重复出现放数组
					{
						if(!obj[this.name].push)
							obj[this.name]=[ obj[this.name] ]; //第一次建数组 ,存原来的值 
						 //在存新值 
						 obj[this.name].push(this.value); 
					}else
						obj[this.name]=this.value;
					
				});
				return obj;
			} 
			console.log($("#ff").serializeObject());
		}
		
	</script>
	
</head>
<body>
	<div class="icon-tip" style="width:16px;height:16px"></div> 灯图标
	
	<div class="easyui-panel" title="New Topic" style="width:400px">
		<div style="padding:10px 0 10px 60px">
	    <form id="ff" method="post"> <!-- 有form是为验证 -->
	    	<table>
	    		<tr>
	    			<td>Name:</td>
	    			<td><input class="easyui-validatebox" type="text" name="name" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Email:</td>
	    			<td><input class="easyui-validatebox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Language:</td>  <!-- 可以输入查询-->
	    			<td>
	    				<select class="easyui-combobox" name="language"><option value="ar">Arabic</option><option value="bg">Bulgarian</option><option value="ca">Catalan</option><option value="zh-cht">Chinese Traditional</option><option value="cs">Czech</option><option value="da">Danish</option><option value="nl">Dutch</option><option value="en" selected="selected">English</option><option value="et">Estonian</option><option value="fi">Finnish</option><option value="fr">French</option><option value="de">German</option><option value="el">Greek</option><option value="ht">Haitian Creole</option><option value="he">Hebrew</option><option value="hi">Hindi</option><option value="mww">Hmong Daw</option><option value="hu">Hungarian</option><option value="id">Indonesian</option><option value="it">Italian</option><option value="ja">Japanese</option><option value="ko">Korean</option><option value="lv">Latvian</option><option value="lt">Lithuanian</option><option value="no">Norwegian</option><option value="fa">Persian</option><option value="pl">Polish</option><option value="pt">Portuguese</option><option value="ro">Romanian</option><option value="ru">Russian</option><option value="sk">Slovak</option><option value="sl">Slovenian</option><option value="es">Spanish</option><option value="sv">Swedish</option><option value="th">Thai</option><option value="tr">Turkish</option><option value="uk">Ukrainian</option><option value="vi">Vietnamese</option></select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td>
	    				 <input id="pwd" name="pwd" type="password" class="easyui-validatebox" data-options="required:true">
	    			</td>
	    		</tr>
	    		 <tr>
	    			<td>确认密码:</td>
	    			<td>
	    				<input id="rpwd" name="rpwd" type="password" class="easyui-validatebox"  required="required" validType="equals['#pwd']">
	    			</td>
	    		</tr>
	    		 <tr>
	    			<td>未选择combobox:</td>
	    			<td>
	     	            <input id="language" class="easyui-combobox" name="language" style="width:100%;" data-options="
	                    valueField: 'id',
	                    textField: 'text',
	                    label: 'Language:',
	                    labelPosition: 'top',
	                    prompt:'--please select',
	                    data:[{id:1,text:'one'},{id:2,text:'two'},]
	                    ">
                    
			                               禁用的combobox:
			            <select class="easyui-combobox" name="stateDisabled" label="stateDisabled" data-options="disabled:true" labelPosition="top" style="width:100%;">
			                <option value="AL">Alabama</option>
			                <option value="AK">Alaska</option>
			                <option value="AZ">Arizona</option>
			              </select>
			              <br/>
			          datebox:  <input   class="easyui-datebox" value="2018-09-01" /> <br/>
			          textbox:  <input   class="easyui-textbox" value="my text" /> <br/>
	    			</td>
	    		
	    		</tr>
	    		<tr>
	    			<td>Message:</td>
	    			<td><textarea name="message" style="height:60px;"></textarea></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    </div>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="getFormData()">getFormData</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="toggleDisable()">toggleDisable</a>
	    </div>
	</div>
	
 
	
</body>
</html>