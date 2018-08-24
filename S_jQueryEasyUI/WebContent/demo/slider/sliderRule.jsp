    <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Slider Rule - jQuery EasyUI Demo</title>
            <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Slider Rule</h2>
        <p>This sample shows how to define slider rule.</p>
        <div style="margin:20px 0 50px 0;"></div>
        <input class="easyui-slider" style="width:300px" data-options="
                    showTip:true,
                    rule: [0,'|',25,'|',50,'|',75,'|',100]
                ">
                
                
                
    <h2>Range Slider</h2>
    <p>This sample shows how to define a range slider.</p>
    <div style="margin:20px 0 50px 0;"></div>
    <input class="easyui-slider" style="width:300px" data-options="
                showTip: true,
                range: true,
                value: [20,60],
                rule: [0,'|',25,'|',50,'|',75,'|',100]
            ">
    </body>
    </html>