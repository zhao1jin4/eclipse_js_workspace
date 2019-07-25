<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <title>TextBox with Clear Icon - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	     <h2>TextBox with Clear Icon</h2>
    <p>This example shows how to create an textbox with an icon to clear the input element itself.</p>
    <div style="margin:20px 0 40px 0;"></div>
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <div style="margin-bottom:20px">
            <input id="tt" class="easyui-textbox" style="width:100%;" data-options="
            label: 'Icons:',
            labelPosition: 'top',
            prompt: 'Input something here!',
            iconWidth: 22,
            icons: [{
                iconCls:'icon-add',
                handler: function(e){
                    $(e.data.target).textbox('setValue', 'Something added!');
                }
            },{
                iconCls:'icon-remove',
                handler: function(e){
                    $(e.data.target).textbox('clear');
                }
            },{
                iconCls:'icon-clear',
                handler: function(e){
                    $(e.data.target).textbox('clear');
                }
            }, 
            {
                iconCls:'icon-search',
                handler: function(e){
                    var v = $(e.data.target).textbox('getValue');
                    alert('The inputed value is ' + (v ? v : 'empty'));
                }
            }]
            ">
        </div>
    </div> 
 
       
</body>
</html>