 <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>TreeGrid Actions - jQuery EasyUI Demo</title>
       	<jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>TreeGrid Actions</h2>
        <p>Click the buttons below to perform actions.</p>
        <div style="margin:20px 0;">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="collapseAll()">CollapseAll</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="expandAll()">ExpandAll</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="expandTo()">ExpandTo</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="expandLevel2()">ExpandLevel2</a>
        </div>
        <table id="tg" class="easyui-treegrid" title="TreeGrid Actions" style="width:700px;height:250px"
                data-options="
                    iconCls: 'icon-ok',
                    rownumbers: true,
                    animate: true,
                    collapsible: true,
                    fitColumns: true,
                    url: 'treegrid_data2.json',
                    method: 'get',
                    idField: 'id',
                    treeField: 'name'
                ">
            <thead>
                <tr>
                    <th data-options="field:'name',width:180">Task Name</th>
                    <th data-options="field:'persons',width:60,align:'right'">Persons</th>
                    <th data-options="field:'begin',width:80">Begin Date</th>
                    <th data-options="field:'end',width:80">End Date</th>
                    <th data-options="field:'progress',width:120,formatter:formatProgress">Progress</th>
                </tr>
            </thead>
        </table>
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
            function collapseAll(){
                $('#tg').treegrid('collapseAll');
            }
            function expandAll(){
                $('#tg').treegrid('expandAll');
            }
            function expandTo(){
                $('#tg').treegrid('expandTo',21).treegrid('select',21);
            }
           
            
            function expandLevel2(){
            	var datas=$("#tg").treegrid('getData');//即使数据格式是　_parentId,这里得到的数据也是children格式,每一项数据也多加(如源数据没用)_parentId
            	recursiveExpand(datas,2);
            }
            function recursiveExpand(datas,level)
            {
            	for(var i in datas)
            	{
            		if(datas[i].level==level)
	            	{
	            		$('#tg').treegrid('expandTo',datas[i].id).treegrid('select',datas[i].id);
	            		return;
	            	}else if(datas[i].children)
	            	{
	            		recursiveExpand(datas[i].children,level)
	            	}
            	} 
            }
        </script>
    </body>
    </html>