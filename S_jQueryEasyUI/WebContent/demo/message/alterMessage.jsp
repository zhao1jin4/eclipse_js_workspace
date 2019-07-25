     <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Alert Messager - jQuery EasyUI Demo</title>
       
       <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Alert Messager</h2>
        <p>Click on each button to display different alert message box.</p>
        <div style="margin:20px 0;">
            <a href="#" class="easyui-linkbutton" onclick="alert1()">Alert</a>
            <a href="#" class="easyui-linkbutton" onclick="alert2()">Error</a>
            <a href="#" class="easyui-linkbutton" onclick="alert3()">Info</a>
            <a href="#" class="easyui-linkbutton" onclick="alert4()">Question</a>
            <a href="#" class="easyui-linkbutton" onclick="alert5()">Warning</a>
        </div>
        <script>
            function alert1(){
                $.messager.alert('My Title','Here is a message!');
            }
            function alert2(){
                $.messager.alert('My Title','Here is a error message!','error');
            }
            function alert3(){
                $.messager.alert('My Title','Here is a info message!','info');
            }
            function alert4(){
                $.messager.alert('My Title','Here is a question message!','question');
            }
            function alert5(){
                $.messager.alert('My Title','Here is a warning message!','warning');
            }
        </script>
    </body>
    </html>