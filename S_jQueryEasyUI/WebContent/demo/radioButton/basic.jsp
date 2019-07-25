   <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Basic RadioButton - jQuery EasyUI Demo</title>	
        <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Basic RadioButton</h2>
        <form id="ff">
            <div style="margin-bottom:20px">
                <input class="easyui-radiobutton" name="fruit" value="Apple" label="Apple:">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-radiobutton" name="fruit" value="Orange" label="Orange:">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-radiobutton" name="fruit" value="Banana" label="Banana:">
            </div>
        </form>
    </body>
    </html>