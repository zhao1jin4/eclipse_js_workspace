    <!DOCTYPE html>
    <html>
    <head>
        <title>Tabs Tools - jQuery EasyUI Demo</title>
     	<jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Tabs Tools</h2>
        <p>Click the buttons on the top right of tabs header to add or remove tab panel.</p>
        <div style="margin:20px 0;"></div>
        <div id="tt" class="easyui-tabs" data-options="tools:'#tab-tools'" style="width:700px;height:250px">
        </div>
        <div id="tab-tools">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="addPanel()"></a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="removePanel()"></a>
        </div>
        <script type="text/javascript">
            var index = 0;
            function addPanel(){
                index++;
                $('#tt').tabs('add',{
                    title: 'Tab'+index,
                    content: '<div style="padding:10px">Content'+index+'</div>',
                    closable: true
                });
            }
            function removePanel(){
                var tab = $('#tt').tabs('getSelected');
                if (tab){
                    var index = $('#tt').tabs('getTabIndex', tab);
                    $('#tt').tabs('close', index);
                }
            }
        </script>
    </body>
    </html>