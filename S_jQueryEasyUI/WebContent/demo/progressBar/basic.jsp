    <!DOCTYPE html>
    <html>
    <head>
        <title>Basic ProgressBar - jQuery EasyUI Demo</title>
        <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Basic ProgressBar</h2>
        <p>Click the button below to show progress information.</p>
        <div style="margin:20px 0;">
            <a href="#" class="easyui-linkbutton" onclick="start()">Start</a>
        </div>
        <div id="p" class="easyui-progressbar" style="width:400px;"></div>
        <script>
            function start(){
                var value = $('#p').progressbar('getValue');
                if (value < 100){
                    value += Math.floor(Math.random() * 10);
                    $('#p').progressbar('setValue', value);
                    setTimeout(arguments.callee, 200);
                }
            };
        </script>
    </body>
    </html>