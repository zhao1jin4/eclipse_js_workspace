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
            	  $("#SelectUser").tagbox('loadData',{
            		  id:value,
            		  text:value//查DB？？？   或者拿到row.         			
            	  });
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
			            	  $("#SelectUser").tagbox('loadData',{
			            		  id:row.myid,
			            		  text:row.name//   或者拿到row ！！！！！！！       			
			            	  });
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
	
	
/**
 * 初始化选人控件
 * @param id            控件ID
 * @param multiple      是否多选,true：多选
 * @param name          生成姓名隐藏域,如需要后台保存姓名，可以传此属性
 */
function initTagBoxWithSelectUser(id,multiple,name) {
    var value = $("#" + id).val();
    var comboData = [];
    var comboValue = [];
    if(value){
        comboValue = value.split(",");
        var text = $("#" + id).attr("data-tagtext");
        if(text){
            var textArr = text.split(",");
            for(var i=0; i < textArr.length; i++) {
                var idText = {id:comboValue[i],text:textArr[i]};
                comboData.push(idText);
            }

        }else{
        	 var root="/S_jQueryEasyUI";
            var params = {"input":value};
            $.ajax({
                type: "post",
            	url:root+'/easyUI/tagBoxJson',
                data: params,
                async: false,
                success: function (data) {
                    comboData = data;
                    ;
                }
            });
        }
    }
    var selectedTagBoxUser = {};
    if(multiple == null){
        multiple = false;
    }
    var timeout = 0;
    var isInputed = true;
    $("#"+id).tagbox({ 
        limitToList:true,
        prompt: "",
        valueField: 'id',
        textField: 'text',
        multiple:multiple,
        value:comboValue,
        data:comboData,
        events:{
        	input: function (e) {
        		newValue=e.target.value;
                //在选择人名时，也会触发onChange事件，获取到value(value为主键ID)，如果继续执行searchForm方法，会将主键ID填入文本框
                //所以需要判断输入是汉字或字母才触发searchForm方法，避免上述问题
                if(!isInputed){
                    return;
                }
                clearTimeout(timeout);
                timeout = setTimeout(function () {
                    var trueValue = newValue;
                    // alert(trueValue)
                    if (isChinese(trueValue)) {
                        searchTagBoxForm("fullname", trueValue, id, selectedTagBoxUser);
                    }
                    else if (isChar(trueValue) && trueValue.length > 1) {
                        searchTagBoxForm("email", trueValue, id, selectedTagBoxUser);
                    }
                },300);
            },compositionstart:function(e){
                isInputed = false;
            },compositionend:function(e){
            	  isInputed = true;
            }
        },
               
        onSelect:function(data){
            //保存已选择的Item
            if(! selectedTagBoxUser[data.id]){
                if(!multiple){
                    selectedTagBoxUser = {};
                }
                selectedTagBoxUser[data.id] = data;
            }
            //将textField的显示文本截取
            if(data.text.indexOf("(") != -1){
                data.text = data.text.substr(0,data.text.indexOf("("));
            }
            //将textField的显示文本截取
            if(data.text.indexOf(" ") != -1){
                data.text = data.text.substr(0,data.text.indexOf(" "));
            }
            if(name){
                updateNameTextHidden(id,selectedTagBoxUser,name,this);
            }

        },
        onRemoveTag:function(itemId){
            //删除已选中的记录
            delete selectedTagBoxUser[itemId];//只这样不行的??????????
            if(name){
                updateNameTextHidden(id,selectedTagBoxUser,name,this);
            }
        }

    });
}
function updateNameTextHidden(compomentId,selectedTagBoxUser,name,compom){
    var value = "";
    var length = 0;
    $.each(selectedTagBoxUser,function(i,param){
        value += param.text;
        if(length < Object.keys(selectedTagBoxUser).length - 1){
            value += ",";
        }
        length ++;
    });
    //增加
    if($("#"+compomentId+"_name").length == 0){
        var hiddenInput = "<input type=\"hidden\" id=\""+compomentId+"_name\" name=\""+name+"\" value=\""+value+"\" />";
        $(compom).append(hiddenInput);
    }else{
        $("#"+compomentId+"_name").val(value);
    }

}
/**
 * 选择框初始化2
 */
 
function searchTagBoxForm(field,value,compomentId,selectedTagBoxUser){
//    var searchKey = "Q_"+field+"_SL";
 	var data = {"input":value}; 
    var root="/S_jQueryEasyUI";
    $.post(root+'/easyUI/tagBoxJson',data,
        function(result){
            if(selectedTagBoxUser){
                $.each(selectedTagBoxUser,function(i,param){
                    result.push(param);
                });
            }
            $("#"+compomentId).combobox("loadData", result);
            $("#"+compomentId).combobox("setText", value);

        });
}
//检测是否为中文，true表示是中文，false表示非中文
function isChinese(str){
    if(/^[\u3220-\uFA29]+$/.test(str)){
        return true;
    }else{
        return false;
    }
}
function isChar(str){
    var i = /^(?!_)([A-Za-z ]+)$/;
    if(!i.test(str)){
        return false;
    }
    return true;
}
	 
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