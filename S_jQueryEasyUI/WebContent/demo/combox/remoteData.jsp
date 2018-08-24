<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Binding to Remote Data - jQuery EasyUI Demo</title>
   <jsp:include page="../../commonHead.jsp"  />
</head>
<body>
    <h2>Binding to Remote Data</h2>
    <p>The ComboBox is bound to a remote data.</p>
    <div style="margin:20px 0"></div>
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <div style="margin-bottom:20px">
            <input class="easyui-combobox" name="language" id="language" style="width:100%;" data-options="
                    url:'combobox_data1.json',
                    method:'get',
                    valueField:'id',
                    textField:'text',
                    panelHeight:'auto',
                    label: 'Language:',
                    labelPosition: 'top',
                    onSelect:function(record){
		                console.log('onSelect:' +record.text);
		            },
		            onChange:function(newValue,oldValue)
		            {
		            	console.log('changed newValue :'+newValue);
		            },
		            onUnselect:function(record){//没用
		                console.log('onUnSelect' +record.text);
		            },
                    " 
                    onblur="console.log('onblur:' +this.value);//没用"
                    >
        </div>
    </div>
</body>