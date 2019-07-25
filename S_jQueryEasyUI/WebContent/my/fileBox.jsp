  <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title> </title>
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
        只能选图片： <input id="fb" class="easyui-filebox" style="width:100%" data-options="prompt:'Choose a file...'"> <br/>
        只能选excel： <input id="excelFileBox" class="easyui-filebox" style="width:100%" data-options="prompt:'Choose a file...'"><br/>
        <input id="fb" class="easyui-linkbutton" onclick="validateFileBox()" value="检查"/>
        <script type="text/javascript">
        $(function (){
        	 $('#fb').filebox(
        			 {buttonAlign:'right',
        		 	buttonText:"浏览",
        		 	accept:"image/*"
        		 	
        		 });
        	 $('#excelFileBox').filebox(
        			 {buttonAlign:'right',
        		 	buttonText:"浏览",
        		 	accept:"application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        		 	
        		 });
        });
           function validateFileBox()
           {
           	 if($('#fb').filebox('getText')=='')
           		 alert("请选择文件 ");
           }
        </script>
    </body>
    </html>