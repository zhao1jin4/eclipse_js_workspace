  <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Button Align on FileBox - jQuery EasyUI Demo</title>
        <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Button Align on FileBox</h2>
        <p>Change the button align to the left or right of filebox.</p>
        <div style="margin:20px 0 40px 0;"></div>
        <span>Select Button Align:</span>
        <select onchange="changeAlign(this.value)">
            <option value="left">Left</option>
            <option value="right" selected>Right</option>
        </select>
        <div style="margin:20px 0;"></div>
        <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
            <input id="fb" class="easyui-filebox" style="width:100%" data-options="prompt:'Choose a file...'">
        </div>
     
        <script type="text/javascript">
            function changeAlign(align){
                $('#fb').filebox({buttonAlign:align});
            }
        </script>
    </body>
    </html>