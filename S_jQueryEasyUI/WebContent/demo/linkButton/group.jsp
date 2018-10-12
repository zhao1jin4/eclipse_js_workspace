      <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
       <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Button Group - jQuery EasyUI Demo</title>
          <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Button Group</h2>
        <p>In a button group only one button can be selected.</p>
        <div style="margin:10px 0 40px 0;"></div>
        <div class="easyui-panel" style="padding:5px;">
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">Button 1</a>
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1',selected:true">Button 2</a>
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">Button 3</a>
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">Button 4</a>
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">Button 5</a>
        </div>
        <div style="margin:20px 0;"></div>
        <div class="easyui-panel" style="padding:5px;">
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g2',plain:true">Button 1</a>
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g2',plain:true,selected:true">Button 2</a>
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g2',plain:true">Button 3</a>
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g2',plain:true">Button 4</a>
            <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g2',plain:true">Button 5</a>
        </div>
     
    </body>
    </html>