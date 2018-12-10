<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ComboBox </title>
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
     

<input id="promptText"  class="easyui-textbox"  data-options="prompt: 'Input something here!'" >   <br/>
<input id="promptComboBox"   data-options="prompt: 'Input something here!'"  >  有promt  <br/>

<input id="noInput" name="dept"  data-options="prompt: 'Input something here!'" >  ,不可输入editable: false是textbox的属性  <br/>
<script type="text/javascript">
//HTML id="cc" 要在JS前面
  $('#noInput').combobox({
      url:'../demo/comboBox/combobox_data1.json',
      valueField:'id',
      textField:'text',
      editable: false // editable: false是combo的属性 ,不可输入
  });
  
  $('#promptComboBox').combobox({
  		prompt:'--请选择--', //是textbox的属性
  });
 </script>
 
 
  <select id="noArrow" class="easyui-combobox" name="dept" style="width:200px;">  <br/>
       <option value="aa">aitem1</option>
       <option>bitem2</option>
       <option>bitem3</option>
   </select>  没有下箭头按钮,<br/>
<script type="text/javascript">
  $('#noArrow').combobox({
      //url:'../demo/comboBox/combobox_data1.json',
      valueField:'id',
      textField:'text', 
      hasDownArrow:false, //没有下箭头按钮,是combo的属性 
      onChange :myOnChange 
  });
  function myOnChange(newValue,oldValue)
  {
	  console.log(newValue); 
      if (newValue.length <  2) //至少2个字母请求服务器
       	return false;
      
      var root="/S_jQueryEasyUI";
      
      //$('#noArrow').combobox('reload');//不能动态
     // $('#noArrow').combobox('reload', root+'/easyUI/tagBoxJson?input='+newValue);//XML Parsing Error: no root element found
	  
     
 	//中文不按空格时也算输入？？？ 是输入法的问题，用搜狗就可以，用微软就不行
      $.ajax({
		method:'get',
      	url:root+'/easyUI/tagBoxJson',
      	 data:{input:newValue},
          dataType: 'json', 
          success: function(data)
          {
             $('#noArrow').combobox('loadData', data);
            
          } 
      });
	 
	
 }
 </script>
 
   
 	limitToList :true,
    
<br/>测试输入java<br/>   

<input id="inputComboBox" class="easyui-combobox" data-options="
		valueField: 'label',
		textField: 'value',
		limitToList : true" /> 输入一半不选还在,使用 limitToList就可以了   <br/>
		
<input id="testComboBox" class="easyui-combobox" data-options="
		valueField: 'label',
		textField: 'value',
		onSelect:function(record){
              console.log('onSelect:' +record.text);
          },
          onChange:function(newValue,oldValue)
          {
          	console.log('changed newValue :'+newValue+',old value='+oldValue);
          },
          onHidePanel:myHidePanel " 
		 />  
 输入一半不选还在 要自定入onHidePanel的函数 <br/>
  <script type="text/javascript">
  $(function (){
	  var data=[{
			label: 'java',
			value: 'Java'
		},{
			label: 'c/c++',
			value: 'cpp'
		}];
	  $('#testComboBox').combobox('loadData',data);
	  $('#testComboBox').combobox('select','cpp');
	  
	  
	  $('#inputComboBox').combobox('loadData',data);
	  $('#inputComboBox').combobox('select','cpp');
    
  });
  function myHidePanel()
  {
	  //jqCombox=$(this);
	  //var allSelectData= jqCombox.combobox('getValues');//为多选准备
	  var val = $(this).combobox("getValue");  
      var allData = $(this).combobox("getData"); 
      
      var valueField = $(this).combobox("options").valueField;
      var rightVal = false;  
      for (var i = 0; i < allData.length; i++)
      {
          if (val == allData[i][valueField])
		  {
        	  rightVal = true;
              break;
          }
      }
      if (!rightVal) {
          $(this).combobox("clear");
      } 
  }
  </script>
  
  JSONP <br/>
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <div style="margin-bottom:20px">
            <input class="easyui-combobox" style="width:100%;" data-options="
                    loader: myloader,
                    mode: 'remote',
                    valueField: 'id',
                    textField: 'text',
                    label: 'State:',
                    labelPosition: 'top'
                    ">
        </div>
    </div>
    <script type="text/javascript">
        var myloader = function(param,mysuccess,myerror){
            var q = param.q || '';//param在用户输入的情况下有值 ，eayUI传入参数名为q
            if (q.length <  2) //至少2个字母请求服务器
             	return false;
            $.ajax({
            	//浏览器如是localhost,用127.0.0.1就是跨域
            	//url:'http://localhost:8080/S_jQueryEasyUI/easyUI/comboBoxJsonp',
            	url:'http://127.0.0.1:8080/S_jQueryEasyUI/easyUI/comboBoxJsonp',
            	data:{input:q},
                dataType: 'jsonp',
                jsonp: "callback",//默认为:callback，传到服务端的参数名
                jsonpCallback:"myFunc",//传到服务端的参数值,即函数名(也可不传jquery自动生成名字),JS端生成这个函数调用success
                success: function(data){
                    var items = $.map(data, function(item,index){
                        return {
                            id: item.value,
                            text: item.name
                        };
                    });
                    mysuccess(items);
                },
                error: function(){
                	myerror.apply(this, arguments);
                }
            });
        }
    </script>
    
 <div style="width:500px;height:500px; border:5px solid red;">test</div>
    
</body>