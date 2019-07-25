    <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a pagination to TreeGrid - jQuery EasyUI Demo</title>
       <!-- 
	<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	 -->
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/icon.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="./selectUser.js"></script>
	<script type="text/javascript">
	var editId=undefined;
	function myOnDblClickRow(row) //不同于 datagrid的参数
	{
		$(this).treegrid('beginEdit',row.myid)//idField的字段,不同于 datagrid是第索引
		editId=row.myid;
	}
 	function myOnClickRow( row)//不同于 datagrid的参数
	{
		$(this).treegrid('endEdit',editId);  
	}
	 
	function formatDollar(value){
	    if (value){
	        return '$'+value;
	    } else {
	        return '';
	    }
	}
	
	
	//treegrid  的editor不能tagbox这里扩展了 ，做选人( 就editor:'SelectUser' 可以选人了)  
	// 删除选中的有问题？？？？？？？？？？？
	 /*
	$.extend($.fn.treegrid.defaults.editors,{ //新增的editor,系统中的editor还是存在的
		 SelectUser: {
              init: function(container, options){
                  var input = $('<input class="easyui-tagbox" style="width: 100%;" type="text" id="SelectUser">').appendTo(container);
                  return initTagBoxWithSelectUser("SelectUser",false,"SelectUser");//自己的选人组件
              },
              destroy: function(target){
                  $("#SelectUser").tagbox('destroy');
              },
              getValue: function(target){
            	  var userIdVal=$("#SelectUser").tagbox('getValue');
                  $("#myTreegrid").treegrid('find',editId).userid=userIdVal;
                  return $(".datagrid-editable .tagbox-label").text();
              },
              setValue: function(target, value){
            	  //已 经有值,先调init后,再调setValue
            	  $("#SelectUser").tagbox('loadData',[{
            		  id:value,
            		  text:value//查DB？？？   或者拿到row.         			
            	  }]);
                  $("#SelectUser").tagbox('setValue',value); 
              },
              resize: function(target, width){
                  var input = $("#SelectUser");
                  if ($.boxModel == true) {
                      input.width(width - (input.outerWidth() - input.width()));
                  } else {
                      input.width(width);
                  } 
 
          }} //editors
	});//extend 
*/

	  //拿到row.   
	  $.extend($.fn.treegrid.defaults,{  
		  //onDblClickRow:  function  (row)  
		  	onDblClickCell : function  (field,row)//会调用 myonDblClickRow
			{
				//代码同上面的
				
				$.extend($.fn.treegrid.defaults.editors,{//新增的editor,系统中的editor还是存在的
					 SelectUser: {
			              init: function(container, options){
			                  var input = $('<input class="easyui-tagbox" style="width: 100%;" type="text" id="SelectUser">').appendTo(container);
			                  return initTagBoxWithSelectUser("SelectUser",false,"SelectUser",false);//自己的选人组件
			              },
			              destroy: function(target){
			                  $("#SelectUser").tagbox('destroy');
			              },
			              getValue: function(target){
			            	  var userIdVal=$("#SelectUser").tagbox('getValue');
			                  $("#myTreegrid").treegrid('find',editId).userid=userIdVal;
			                  return $(".datagrid-editable .tagbox-label").text();
			              },
			              setValue: function(target, value){
			            	  //已 经有值,先调init后,再调setValue
			            	  $("#SelectUser").tagbox('loadData',[{
			            		  id:row.myid,
			            		  text:row.name//   或者拿到row ！！！！！！！       			
			            	  }]);
			                  $("#SelectUser").tagbox('setValue',row.myid); 
			              },
			              resize: function(target, width){
			                  var input = $("#SelectUser");
			                  if ($.boxModel == true) {
			                      input.width(width - (input.outerWidth() - input.width()));
			                  } else {
			                      input.width(width);
			                  } 
			 
			          }} //editors
				});//extend 
				
			}
	  });
	</script>
    </head>
    <body>
    

      
    
    
        选人组件在树中  <br/>
         删除选中的有问题？？？？？？？？？？？  <br/>
     在 treegrid 有分页的情况下 数据是一性加载的情况下，    展开树 expandTo  无效????  可能是分页的数据格式带rows等原因
         
        <table id="myTreegrid"  class="easyui-treegrid"  title="Test Select User"  style="width:700px;height:300px">
        </table>
   <br/>     
         
           
    <script type="text/javascript">
			//要放在<table id="myTreegrid"> 后执行
           $("#myTreegrid").treegrid({
          	 url: '/S_jQueryEasyUI/easyUI/treeGridPage',
               rownumbers: true,
               pagination: true,
               pageSize: 10,
               pageList: [2,10,20],
              // checkbox: true,
               
               checkbox: function(row) //条件是否有复选框
               {
	           		 if(row.myid%2==0)
	           			 return true;
	           		 else 
	           			 return false;
	           	},
	            
               idField: 'myid',
               treeField: 'name2',
               onDblClickRow:myOnDblClickRow,
               onClickRow:myOnClickRow,
               columns:[[
                   {field:'name',title:'name',width:250,editor:"SelectUser"},
                   {field:'name2',title:'name2',width:250 },
                   {field:'quantity',title:'quantity',width:100,align:'right',editor:"numberspinner"},
                   {field:'price',title:'price',width:100, formatter:formatDollar , editor:"numberbox"},
                   {field:'total',title:'total',width:100, formatter:formatDollar }  
               ]]
           });
           
    </script>
           
    </body>
    </html>