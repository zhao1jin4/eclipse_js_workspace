<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajax Form - jQuery EasyUI Demo</title>
        <jsp:include page="../../commonHead.jsp"  />
     </head>
    <body>
        <h2>Ajax Form Demo</h2>
        <p>Type in input box and submit the form.</p>
        
        <div class="easyui-panel" title="Ajax Form" style="width:300px;padding:10px;">
            <form id="ff" action="form1_proc.php" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>Name:</td>
                        <td><input name="name" class="f1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input name="email" class="f1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td>Phone:</td>
                        <td><input name="phone" class="f1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td>File:</td>
                        <td><input name="file" class="f1 easyui-filebox"></input></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Submit"></input></td>
                    </tr>
                </table>
            </form>
        </div>
        <style>
            .f1{
                width:200px;
            }
        </style>
        <script type="text/javascript">
            $(function(){
            	  
            	
                $('#ff').form({
                    url:'',
                    onSubmit: function(param){
                    	alert(JSON.stringify(param));
                    	 //easyUI,serializeArray对combobox不选择的和禁用的拿不到值 
						return false;
                        param.p1 = 'value1';
                        param.p2 = 'value2';
                    },
                    success:function(data){
                        $.messager.alert('Info', data, 'info');
                    }
                });
            });
        </script>
    </body>
    </html>