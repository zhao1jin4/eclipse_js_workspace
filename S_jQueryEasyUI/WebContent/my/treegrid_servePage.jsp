    <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a pagination to TreeGrid - jQuery EasyUI Demo</title>
       <!-- 
	<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	 -->
	<link rel="stylesheet" type="text/css" href="../themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../themes/icon.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	var editId=undefined;
	function myOnDblClickRow(row) //不同于 datagrid的参数
	{
		$(this).treegrid('beginEdit',row.myid)//idField的字段,不同于 datagrid是第索引
		editId=row.myid;
	}
 	function myOnClickRow( row)//不同于 datagrid的参数
	{
		$(this).treegrid('endEdit',editId); 
	}
 	function myOnAfterEdit(row,changes)
 	{
 		$(this).treegrid('checkNode', row.myid);
 	}
	 
	function formatDollar(value){
	    if (value){
	        return '$'+value;
	    } else {
	        return '';
	    }
	}
	
	
	var saveFunc=[];
	function nameFormater(value,row,index)
	{
		var key='btnClick'+row.myid;
		saveFunc[key]=rowClick.bind(this,row);//row也会存到数组中,第一个参数this必传
		var  strFunc="saveFunc['"+key+"'](this)";//这里this可以省略
		return '<button onclick="'+strFunc+'">'+value+'</button>';
		//return '<button onclick="rowClick(row)">'+value+'</button>';//这样单击时得到不row的值，要存起来
	}
	function rowClick(row)
	{
		console.log(row);
	}
	
	
	function addChange()
	{
		var theId=10;
		$("#myTreegrid").treegrid('beginEdit',theId);
		
		// update (beginEdit也不行) 后 getChanges 得不到变化的！！！,只能是更新UI
		$("#myTreegrid").treegrid('update',{
			 id:10,
			 row:{
				 myid:theId,
				 name:'李0001', 
				 name2: "张0001", 
				 price: "1000", 
				 quantity: "2", 
				 state: "closed", 
				 total: 2000
			 }			 
		});
		$("#myTreegrid").treegrid('endEdit',theId);
		
	
	}
	function showChange()
	{
		var changes=$("#myTreegrid").treegrid('getChanges');//得到变化的,可传第二个参数 type,可选值 为inserted,deleted,updated 
		console.log(changes);
		var updated=$("#myTreegrid").treegrid('getChanges','updated');
		console.log(updated);
		
		//treegrid是getData，datagrid是getRows
		var newData=$("#myTreegrid").treegrid('getData' );//是修改后的值 
		//即使数据格式是　_parentId,这里得到的数据也是children格式,每一项数据也多加(如源数据没用)_parentId
		console.log(newData);
	}
	 
	function showCheckedAndLevel()
	{
		var checkedArray=$("#myTreegrid").treegrid('getCheckedNodes');
		
		console.log(checkedArray);
		for(var i in checkedArray)
		{
			var row=checkedArray[i];
			var level=$("#myTreegrid").treegrid('getLevel',row.myid);//得到级别
			console.log("name2="+row.name2+",myId="+row.myid+",level="+level);
		} 
	}
	 
	</script>
    </head>
    <body>
    
        
        <h2>Add a pagination to TreeGrid</h2>
        <p>This example shows how to add a pagination to TreeGrid.</p>
        
          <!--  
                ,
                 onBeforeLoad: function(row,param){
                     if (!row) {    // load top level rows
                         param.id = 0;    // set id=0, indicate to load new page rows
                     }
                 }
                 
                treeField: 'name2' 一定是表格中存在的 
            -->    
         <a class="easyui-linkbutton" onclick="addChange()" >新增变化的   update 后 getChange 得不到变化的???</a> <br/>
        <a class="easyui-linkbutton" onclick="showChange()" >得到变化的</a> <br/> 
         <a class="easyui-linkbutton" onclick="showCheckedAndLevel()" >得到选中的数据级别</a> <br/> 
        <table  id="myTreegrid"  title="Products" class="easyui-treegrid" style="width:700px;height:300px"
                data-options="
                    url: '/S_jQueryEasyUI/easyUI/treeGridPage',
                    rownumbers: true,
                    pagination: true,
                    pageSize: 10,
                    pageList: [2,10,20],
                    checkbox: true,
                    idField: 'myid',
                    treeField: 'name2',
                    onDblClickRow:myOnDblClickRow,
                    onClickRow:myOnClickRow,
                    onAfterEdit:myOnAfterEdit
                ">
              
            <thead>
                <tr>
               		<th field="name" width="250" formatter="nameFormater" >Name</th>
                    <th field="name2" width="250">Name2</th>
                    
                    <th field="quantity" width="100" align="right" editor="numberspinner">Quantity</th>
                    <th field="price" width="150" align="right" formatter="formatDollar"  editor="numberbox" >Price</th>
                    <th field="total" width="150" align="right" formatter="formatDollar">Total</th>
                </tr>
            </thead>
        </table>
        <br/>
   
           
    </body>
    </html>