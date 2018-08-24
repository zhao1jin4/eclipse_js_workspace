<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- 
	<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	 -->
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/icon.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
	
	
	<script src="../js/codemirror.js"></script>
	<script src="../js/mode/sql.js"></script>
	<link rel="stylesheet" href="../css/codemirror.css">
	
<style type="text/css">
.CodeMirror {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}
</style>
            
            
 <script type="text/javascript" >

//$(function(){   });
	window.onload = function() 
	{
		var mime = 'text/x-mariadb';
		 window.editor = CodeMirror.fromTextArea(document.getElementById('sql'), {
				mode: mime,
				lineNumbers: true,
				autofocus: true
		  });
	}
	
	 function processQuery ()
         {
		  	var sql=window.editor.getValue();
             var parm={"sql":sql,"skip":$("#skip").val(),"pageSize":$("#pageSize").val()};
            $.ajax( {
                type:"POST",
                contentType:'application/json;charset=UTF-8',
		//url:"sqlWorkbench/submitJson.mvc",
		url:"db.json",
		data: JSON.stringify(parm),
		async:true, 
		dataType:"json", 
		success:showData,
                error:function(e){ 
                   $("#err-dialog").dialog() 
                            .css("display","block") 
                            .html(e.responseText); 
                }
                });
                
         }
         function showData(data)
         {  
             if(data.errorMsg!=null)
             {
                   $("#err-dialog").dialog() 
                            .css("display","block") 
                            .html(data.errorMsg); 
                    return;
             }
             var listData=data.rows;
             
              //var listData=[{name:"lisi",age:20},{name:"lisi1",age:21}];
             
               var uiColums=new Array();
               for( field in listData[0])
               {
                    uiColums.push({"field":field,"title":field});
               } 
           
          $('#resultTable').datagrid({
                columns:[uiColums],
                data:listData
             });
         }
	</script>
</head>
<body>
     

 	<div id="err-dialog"  title="SQL 语法错误" style="width:400px;height:200px;display:none"
            data-options="iconCls:'icon-tip',resizable:true,modal:true" >
     </div>
    
     <TABLE style="width: 90%;"  border="0px" align="center">
    		<tr>
                <td>show tables =</td>
                <td> select table_name from information_schema.TABLES where table_schema='accounting'   </td>
            </tr>
            <tr VALIGN="TOP"  >
                <td>SQL  :</td>
                <td>
                    <textarea   id="sql">  select table_name from information_schema.TABLES where table_schema='accounting'  </textarea>
                </td>
            </tr>
             <tr  style="height:50px">
                <td></td>
                <td align="right">skip <INPUT TYPE="text" id="skip" value="0" /> pageSize<INPUT TYPE="text" id="pageSize"  value="200"/></td>
            </tr>  
             <tr style="height:50px">
                <td></td>
                <td align="right"><INPUT TYPE="button" value="提交查询" onclick="processQuery()"/></td>
            </tr>  
      </TABLE> 
      <div align="center" > 
      	easyUI datagrid 对齐 要在外面加个DIV
	     <table id="resultTable" class="easyui-datagrid" title="查询结果"  style="width:1500px;height:500px;"
				data-options="  
	                fitColumns: true,
					singleSelect: true,
					rownumbers: true,
					showFooter: true
				">
	         
	    </table>
     </div>
</body>
</html>