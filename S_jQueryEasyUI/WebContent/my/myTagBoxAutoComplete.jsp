    <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>TagBox with Autocomplete - jQuery EasyUI Demo</title>
      <link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/icon.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	 function myTagBoxHidePanel()//输入一半不选就清除
	  {
		  var allSelectData= $(this).tagbox('getValues');// 多选 
	      var allData = $(this).tagbox("getData"); 
	      $(this).tagbox("setValues", allSelectData);
	      //$(this).tagbox("clear");//会再次触发这个函数，不能用 
	  }
	//----
	 
	 var selectedTagBox={};
	 var isEnd=true;
	 function  myStart(e) //是对输入中文的情况下
	 {
		 console.log('myStart'+e);
		 isEnd=false;
	 }
	 function  myEnd(e) //是对输入中文的情况下,表示中文输入完成
	 {
		 console.log('myEnd'+e);
		 isEnd=true;
	 }
	 function  myOnInput(e)
	 {
		 if(!isEnd)
			 return;
		var newValue= e.target.value;
		 console.log(newValue);
		   if (newValue.length <  2) //至少2个字母请求服务器
		       	return false;
		      
		 var root="/S_jQueryEasyUI";
		 $.ajax({
				method:'get',
		      	url:root+'/easyUI/tagBoxJson',
		      	 data:{input:newValue},
		          dataType: 'json', 
		          success: function(data)
		          {
		        	  // selectedTagBox -> data 带有老的选择的
		        	  $.each(selectedTagBox,function(id,obj){ 
		        		  data.push(obj);
		        	  });
		        	//tagbox,combobox都可以
		             $('#myTagBox').tagbox('loadData', data);
		         	 $("#myTagBox").tagbox('setText',newValue);//如不调用就清空输入的值 ，也变老的选择的,还要前面加载已经选择的
		          } 
		      });
	 }
	
	 function myOnSelect(record)
	 {
		 console.log('myOnSelect：'+record);
		
		 if(!selectedTagBox[record.id])
			 selectedTagBox[record.id]=record;
	 }
	 function myOnRemoveTag(value)
	 {
		 console.log('myOnRemoveTag'+value);
		 delete selectedTagBox[value]; // 还可这样删属性
	 }
	 
	 //----
	 function printValue()
	 {
		console.log( $("#myTagBox").val() );//选中的值 是传后端
		console.log(selectedTagBox);//是自己定义myOnSelect方法的数据
		//----
		console.log( $("#myTagBox").tagbox('getValues') );// 当选中的值，数组形式
		console.log( $("#myTagBox").tagbox('getData') );// 全部可选值，数组形式
		
		console.log( $("#myTagBox").tagbox('getText')  );// 这个是选中文本
		//console.log( $("#myTagBox").attr("data-tagtext")  );//选人组件自定义的
		
	 }
	 </script>
    </head>
    <body>
        <h2>TagBox with Autocomplete</h2>
        <p>The autocomplete is the built-in feature that allows the user to select a value from the drop-down list.</p>
        <div style="margin:20px 0;"></div>
        <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        	
        
            <input id="myTagBox" class="easyui-tagbox" label="Add a tag" style="width:100%" data-options="
                    valueField: 'id',
                    textField: 'text',
                    multiple:true,
                    hasDownArrow: true,
                    prompt : 'Select a Language',
                    limitToList: true,
                    
                     events : {input:myOnInput,
                    		compositionstart:myStart,
                    		compositionend:myEnd
                    		} ,
              		onSelect : myOnSelect ,
              		onRemoveTag : myOnRemoveTag 
                  
              		
                    ">
            <!--     onHidePanel:myTagBoxHidePanel,
            		 url: 'tagbox_data1.json',
        			 method: 'get',
                    value: '3',
        	  -->
        	  
        	  
            <!--    
                     events : {input:myOnInput,
                    		compositionstart:myStart,
                    		compositionend:myEnd
                    		} ,
              		onSelect : myOnSelect ,
              		onRemoveTag : myOnRemoveTag 
              		
              		 -->
        </div>
        
        <br/>
        
          	 输入一半不选还在,limitToList没用???  onHidePanel OK <br/>
        	 onChange没用？？？comboBox有用,  要用 events :{input:myOnInput}就可以了 <br/>
           	已经下拉了，也会清已经输入的值 ，去onHidePanel也一样？调用$("#myTagBox").tagbox('setText',newValue); <br/>
        	如输入是动态从服务端取，第一个值选择了，再输第二个值下拉列表中的值没有已经选择的值，会丢失？？ 单独保存到全局变量load前加上<br/>
        	<br/>
        	下拉显示过长？？？ 官方示例也是这样的
        	 <br/>
        	<button onclick="printValue()"> 得到选择的值</button>
        <br/>
        
        
      <br/>
      <hr/>
      
              选人组件    删除选中的有问题？？？？？？？？？？？ <br/>
      <span style="width: 200px;">
      	<!-- 
      	<input class="easyui-tagbox" style="width: 100%;" type="text" id="SelectUser">
      	 -->
      <input class="easyui-tagbox" style="width: 100%;" type="text" id="SelectUser" value="1" data-tagtext="用户1">
      </span>
        <br/>
       中文输入事件 ： <input class="easyui-textbox" style="width: 300px" type="text" id="myCnTxt" > <br/>
  
  
      <script type="text/javascript" src="./selectUser.js"></script>
      <script type="text/javascript">
      	//$("#SelectUser").prop("value",1).attr("data-tagtext","用户1");
      	initTagBoxWithSelectUser("SelectUser",false,"SelectUser",false);//自己的选人组件
     
      	
    /*
   	监听 input 或者 change 事件 用户输入拼音的过程中就已经触发了相关事件
    输入开始时触发 compositionstart
    选择字/词完成输入时触发 compositionend
    输入过程中每次击键时触发 compositionupdate，包括 start 事件以后立即触发，end 事件以前立即触发
    Composition 事件以后触发 input 事件
    
    https://www.w3.org/TR/DOM-Level-3-Events/#dom-event-architecture   有说  compositionstart compositionend
    */
    setTimeout(function() {
    	/*
    	//var node=document.querySelector("#myCnTxt");
        var node=document.getElementById("myCnTxt");
        //var node=document;//只document才有效,其它的不行？？？
        node.addEventListener("compositionstart", function(e) {
    	    console.log("start:" + e.data);
    	});
        node.addEventListener("compositionstart", function(e) {
    	    console.log("start:" + e.data);
    	});
        node.addEventListener("compositionend", function(e) {
    	    console.log("end:" + e.data);
    	});
        */
    	 
   }, 300); 
	
      </script>   
     
    </body>
    </html>