      <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
      <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Editable TreeGrid - jQuery EasyUI Demo</title>
       <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>Editable TreeGrid</h2>
        <p>Select one node and click edit button to perform editing.</p>
        <div style="margin:20px 0;">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()">Edit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">Save</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">Cancel</a>
        </div>
        <table id="tg" class="easyui-treegrid" title="Editable TreeGrid" style="width:700px;height:250px"
                data-options="
                    iconCls: 'icon-ok',
                    rownumbers: true,
                    animate: true,
                    collapsible: true,
                    fitColumns: true,
                    url: 'treegrid_data2.json',
                    method: 'get',
                    idField: 'myid',
                    treeField: 'name',
                    showFooter: true
                ">
            <thead>
                <tr>
                    <th data-options="field:'name',width:180,editor:'text'">Task Name</th>
                    <th data-options="field:'persons',width:60,align:'right',editor:'numberbox'">Persons</th>
                    <th data-options="field:'begin',width:80,editor:'datebox'">Begin Date</th>
                    <th data-options="field:'end',width:80,editor:'datebox'">End Date</th>
                    <th data-options="field:'progress',width:120,formatter:formatProgress,editor:'numberbox'">Progress</th>
                </tr>
            </thead>
        </table>
        <!--  _parentId 是固定的 ， 可  idField: 'myid', 数据类型可以是数字也可是字符-->
        <script type="text/javascript">
            function formatProgress(value){
                if (value){
                    var s = '<div style="width:100%;border:1px solid #ccc">' +
                            '<div style="width:' + value + '%;background:#cc0000;color:#fff">' + value + '%' + '</div>'
                            '</div>';
                    return s;
                } else {
                    return '';
                }
            }
            var editingId;
            function edit(){
                if (editingId != undefined){
                    $('#tg').treegrid('select', editingId);
                    return;
                }
                var row = $('#tg').treegrid('getSelected');
                if (row){
                    editingId = row.id
                    $('#tg').treegrid('beginEdit', editingId);
                }
            }
            function save(){
                if (editingId != undefined){
                    var t = $('#tg');
                    t.treegrid('endEdit', editingId);
                    editingId = undefined;
                    var persons = 0;
                    var rows = t.treegrid('getChildren');
                    for(var i=0; i<rows.length; i++){
                        var p = parseInt(rows[i].persons);
                        if (!isNaN(p)){
                            persons += p;
                        }
                    }
                    var frow = t.treegrid('getFooterRows')[0];
                    frow.persons = persons;
                    t.treegrid('reloadFooter');
                }
            }
            function cancel(){
                if (editingId != undefined){
                    $('#tg').treegrid('cancelEdit', editingId);
                    editingId = undefined;
                }
            }
        </script>
     
    </body>
    </html>