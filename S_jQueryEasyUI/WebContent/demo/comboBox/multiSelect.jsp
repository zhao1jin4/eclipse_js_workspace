   
   <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Multiple Select - jQuery EasyUI Demo</title>
       	<jsp:include page="../../commonHead.jsp"  />
       	<script type="text/javascript">
       	function getSelectedValuel()
       	{
       		var values=$("#myLang").combobox('getValues');
       		console.log(values);
       	}
       	</script>
    </head>
    <body>
        <h2>Load Dynamic ComboBox Data</h2>
        <p>Drop down the panel and select multiple items.</p>
        <div style="margin:20px 0"></div>
        <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
            <div style="margin-bottom:20px">
                <input id="myLang" class="easyui-combobox" name="language[]" style="width:100%;" data-options="
                        url:'combobox_data1.json',
                        method:'get',
                        valueField:'id',
                        textField:'text',
                        value:[1,3],
                        multiple:true,
                        panelHeight:'auto',
                        label: 'Language:',
                        labelPosition: 'top'
                        ">
            </div>
        </div>
         <a href="#" class="easyui-linkbutton" onclick="getSelectedValuel()" >得到选中的值 </a>
    </body>
    </html>

