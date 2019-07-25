  <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Tooltip as Toolbar - jQuery EasyUI Demo</title>
       <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Tooltip as Toolbar</h2>
        <p>This sample shows how to create a tooltip style toolbar.</p>
        <div style="margin:20px 0;"></div>
        <div style="padding:10px 200px">
            <p><a id="dd" href="javascript:void(0)" class="easyui-tooltip" data-options="
                        hideEvent: 'none',
                        content: function(){
                            return $('#toolbar');
                        },
                        onShow: function(){
                            var t = $(this);
                            t.tooltip('tip').focus().unbind().bind('blur',function(){
                                t.tooltip('hide');
                            });
                        }
                    ">Hover me</a> to display toolbar.</p>
        </div>
        <div style="display:none">
            <div id="toolbar">
                <a href="#" class="easyui-linkbutton easyui-tooltip" title="Add" data-options="iconCls:'icon-add',plain:true"></a>
                <a href="#" class="easyui-linkbutton easyui-tooltip" title="Cut" data-options="iconCls:'icon-cut',plain:true"></a>
                <a href="#" class="easyui-linkbutton easyui-tooltip" title="Remove" data-options="iconCls:'icon-remove',plain:true"></a>
                <a href="#" class="easyui-linkbutton easyui-tooltip" title="Undo" data-options="iconCls:'icon-undo',plain:true"></a>
                <a href="#" class="easyui-linkbutton easyui-tooltip" title="Redo" data-options="iconCls:'icon-redo',plain:true"></a>
            </div>
        </div>
    </body>
    </html>