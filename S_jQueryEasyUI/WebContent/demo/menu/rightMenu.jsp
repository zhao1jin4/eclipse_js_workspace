   <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Menu Events - jQuery EasyUI Demo</title>
        <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Menu Events</h2>
        <p>Right click on page to display menu and click an item.</p>
        <div style="margin:20px 0;"></div>
        <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width:120px;">
            <div data-options="name:'new'">New</div>
            <div data-options="name:'save',iconCls:'icon-save'">Save</div>
            <div data-options="name:'print',iconCls:'icon-print'">Print</div>
            <div class="menu-sep"></div>
            <div data-options="name:'exit'">Exit</div>
        </div>
        <div id="log" class="easyui-panel" title="Event Log" style="height:250px;padding:10px">
        </div>
        <script>
            function menuHandler(item){
                $('#log').prepend('<p>Click Item: '+item.name+'</p>');
            }
            $(function(){
                $(document).bind('contextmenu',function(e){
                    e.preventDefault();
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                });
            });
        </script>
    </body>
    </html>