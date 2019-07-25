        <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
         <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Interactive Messager - jQuery EasyUI Demo</title>
       <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Interactive Messager</h2>
        <p>Click on each button to display interactive message box.</p>
        <div style="margin:20px 0;">
            <a href="#" class="easyui-linkbutton" onclick="confirm1();">Confirm</a>
            <a href="#" class="easyui-linkbutton" onclick="prompt1()">Prompt</a>
        </div>
        <script>
            function confirm1(){
                $.messager.confirm('My Title', 'Are you confirm this?', function(r){
                    if (r){
                        alert('confirmed: '+r);
                    }
                });
            }
            function prompt1(){
                $.messager.prompt('My Title', 'Please type something', function(r){
                    if (r){
                        alert('you type: '+r);
                    }
                });
            }
        </script>
    </body>
    </html>