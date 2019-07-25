   <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>TreeGrid Lines - jQuery EasyUI Demo</title>
        	<jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>TreeGrid Lines</h2>
        <p>This example shows how to show treegrid lines.</p>
        <div style="margin:20px 0;"></div>
        <table title="TreeGrid Lines" class="easyui-treegrid" style="width:700px;height:250px"
                data-options="
                    url: 'treegrid_data1.json',
                    method: 'get',
                    lines: true,
                    rownumbers: true,
                    idField: 'id',
                    treeField: 'name'
                ">
            <thead>
                <tr>
                    <th data-options="field:'name'" width="220">Name</th>
                    <th data-options="field:'size'" width="100" align="right">Size</th>
                    <th data-options="field:'date'" width="150">Modified Date</th>
                </tr>
            </thead>
        </table>
     
    </body>
    </html>