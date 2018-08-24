<%@page pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>分页  工具栏</title>
	
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
		var mytoolbar = [{
			text:'增加',
			iconCls:'icon-add',
			handler:myInsert
		},
		'-'//分隔线
		,{
			text:'刷新',
			iconCls:'icon-reload',
			handler:function(){alert('刷新')}
		}];

		var myLanguages=${myLanguages};
		/*
			[{
		      	 langValue:"C",
		      	 langLabel:"C 语言"
	      	 },
	      	 {
		      	 langValue:"Java",
		      	 langLabel:"Java 语言"
	      	 },
	      	 {
		      	 langValue:"PLSQL",
		      	 langLabel:"PLSQL 语言"
	      	 }];
			*/
		$(function(){ 
			$('#dg').datagrid({
				queryParams: {
					my_custome_param: 'my-easyUI-value'
				}
			} );
			
			for(index in myLanguages)
			{
				var opt=$("<option>").val( myLanguages[index].langValue ).html( myLanguages[index].langLabel);
				$("#commonlang").append(opt);
			}
			//easyUI 的 <select>是不同的
			$("#lang").combobox({
					data:myLanguages,//url:xxx
					valueField:'langValue',
					textField:'langLabel'
				});
			
		});
		//表格级的,刷新
		function myBeforeEdit(index,row)
		{
			row.editing = true;//自已新定义的属性
			updateActions(index);
		}
		function myAfterEdit(index,row)
		{
			$.ajax
			({
				url:'../easyUI/updateData',
				type:"POST",
				dataType:"json",
				data:{
						command:(row.id)?"update":"save",
						id:row.id,
						username:row.username,
						language:row.language,
					}, 
				success:function(response)
				{
					if(response.statusCode==200)
					{
						if(! row.id) //save
						{
							row.id=response.additionObject;//newId
							updateActions(index);
						}

						$.messager.alert('提示','操作成功','info');
						/* jQueryUI
					 	$("<div>操作成功</div>").dialog({
							 modal: true,
							 buttons: {
								 Ok: function() {
								 	$( this ).dialog( "close" );
								 }
							 }
						 });
						*/
					}
				}
			});
			row.editing = false;
			updateActions(index);
		}
		function myCancelEdit(index,row)
		{
			row.editing = false;
			updateActions(index);
		}
		function updateActions(index)
		{
			$('#dg').datagrid('updateRow',{
				index: index,
				row:{}
			});
		}
		//--行级的
		function getRowIndex(target){
			var tr = $(target).closest('tr.datagrid-row');
			return parseInt(tr.attr('datagrid-row-index'));
		}
		function myEditrow(target){
			$('#dg').datagrid('beginEdit', getRowIndex(target));//调用 onBeforeEdit:myBeforeEdit
		}
		function mySaveUpdateRow(target){
			$('#dg').datagrid('endEdit', getRowIndex(target));//调用  onAfterEdit:myAfterEdit
		}
		function myCancelUpdateRow(target){
			$('#dg').datagrid('cancelEdit', getRowIndex(target));//调用   onCancelEdit:myCancelEdit
		}
		function myInsert()
		{
			var row = $('#dg').datagrid('getSelected');//返回选中行的数据对象
			if (row){
				var index = $('#dg').datagrid('getRowIndex', row);
			} else {
				index = 0;
			}
			$('#dg').datagrid('insertRow', {
				index: index,
				row:{
					isMan:"true",
					language:"Java",
					birthday:"2014-01-01"
				}
			});
			$('#dg').datagrid('selectRow',index);//选中指定行
			$('#dg').datagrid('beginEdit',index);
		}
		function myDeleterow(target){
			$.messager.confirm('确认','你真的要删除吗?',function(r)
			{
				if (r)
				{
					$.ajax
					({
						url:'../easyUI/updateData',
						type:"POST",
						dataType:"json",
						data:
						{
							id: $('#dg').datagrid('getRows')[ getRowIndex(target)].id ,//getRows返回的是所有数据
							command:"delete",
						},
						success:function(response)
						{
							if(response.statusCode==200)
								$.messager.alert('提示','操作成功','info');
						}
					});
					$('#dg').datagrid('deleteRow', getRowIndex(target));//放后面
				}
			});
		}
		//--格式化显示
		function myGenderFormatter(value,row,index)
		{
			if (row.isMan){
				return "男";
			} else {
				return "女";
			}
		}
		function myActionFormatter(value,row,index)
		{
			if (row.editing){//加  class="easyui-linkbutton"没效果 ???
				var s = '<a href="#" onclick="mySaveUpdateRow(this)">Save</a> ';
				var c = '<a href="#" onclick="myCancelUpdateRow(this)">Cancel</a>';
				return s+c;
			} else {
				var e = '<a href="#" onclick="myEditrow(this)">Edit</a> ';
				var d = '<a href="#" onclick="myDeleterow(this)">Delete</a>';
				return e+d;
			}
		}
		function mySearch()
		{
			 $('#dg').datagrid('load',{
				 date_from: $('#date_from').datebox('getValue'),//日期类型得值 
				 date_to: $('#date_to').datebox('getValue'),
				 lang:$('#lang').val(),
				 user:$('#user').val()
				 });
			 
		}
		//-------Tool Bar
		var myIndex=undefined;
		function myClickRow(index)
		{
			myIndex=index;
			//$('#dg').datagrid('selectRow', index);
		}
		function myBarEdit()//同 myEditrow
		{
			$('#dg').datagrid('beginEdit',myIndex);
		}
		function myBarSave() // 同 mySaveUpdateRow
		{
			$('#dg').datagrid('endEdit',myIndex); 
		}
		function myBarUndo() //同  myCancelUpdateRow
		{
			$('#dg').datagrid('cancelEdit', myIndex);
		}
		function myBarRemove() //类似 myDeleterow 
		{
			var row = $('#dg').datagrid('getSelected');
			if(row)
			{
				$.messager.confirm('确认','你真的要删除吗?',function(r)
				{
					if (r)
					{
						//调ajax
						$.messager.alert('提示','Remove操作ID='+row.id,'info');
						$('#dg').datagrid('deleteRow', myIndex);//放后面
					}
				});
			}
		}
		function myBarRemoveByCheckBox() //table 的 singleSelect:true
		{
			var checkedItems = $('#dg').datagrid('getChecked');//得到所有的checkbox选择的行(是修改后的数据)
			var deleteIds = [];
			$.each(checkedItems, function(index, item){
				deleteIds.push(item.id);
			});               
			console.log(deleteIds.join(","));
		}
		function myBarReload()
		{
			$('#dg').datagrid('reload');
		}
		
	</script>
</head>
<body>
	<div class="icon-tip" style="width:16px;height:16px"></div>
	<div>分页  工具栏 in DataGrid.</div>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add"  onclick="myInsert()"></a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="myBarEdit()"></a><!-- 加 plain="true" 按钮没有立体感 -->
			
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="myBarSave()">编辑保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="myBarUndo()">编辑撤消</a>
			
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="myBarRemove()">删除高亮选中行</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="myBarRemoveByCheckBox()">删除CheckBox选中行</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="myBarReload()"></a>
		</div>
		<div><!-- 因使用JSON不能用form -->
			User:	<input id="user" type="text">
			Date From:	<input id="date_from" type="text" style="width:90px" class="easyui-datebox">
			To: 		<input  id="date_to"  type="text" style="width:90px" class="easyui-datebox">
			Language: 
			<select id="lang" class="easyui-combobox" panelHeight="auto" style="width:100px">
				<!-- 
				<option value="java">Java</option>
				<option value="c">C</option>
				<option value="plsql">PLSQL</option>
				 -->
			</select>
			<select id="commonlang"   style="width:100px">
			</select>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search"  onclick="mySearch()" >搜索</a>
		</div>
	</div>
	
	<!--  collapsible:true,-->
	<table id="dg" title="表格数据" style="width:900px;height:500px" 
		data-options="
				rownumbers:true,
				singleSelect:true,
				autoRowHeight:false,
				
				pagination:true,
				pageSize:${sessionScope.PAGE_SIZE},
				pageList:${allPageSize},
				url:'./queryJsonData',
				method:'get',
				onBeforeEdit:myBeforeEdit,
				onAfterEdit:myAfterEdit,
				onCancelEdit:myCancelEdit,
				onClickRow: myClickRow,
				toolbar:'#tb'"> <!-- toolbar:mytoolbar 读全局变量  mytoolbar ,toolbar:'#tb' 引用 DIV   -->
		<thead>
			<tr> <!-- 老版本的   <th field="id">是不行的   -->
				<th data-options="checkbox:true"></th> <!-- 选择的复选框 -->
				<th  width="80" data-options="field:'id'" 	>ID</th> <!-- field的值是JSON对象的属性名 -->
				<th  width="100" data-options="field:'username',editor:{type:'validatebox',options:{required:true}}">用户名</th>
				<th width="100" data-options="field:'language',editor:{
							type:'combobox',
							options:{
								valueField:'langValue',
								textField:'langLabel',
								data:myLanguages,
								required:true
							}
						}">用语言</th>
				<th width="80"  data-options="field:'salary',editor:{type:'numberbox',options:{precision:1,required:true}}">工资</th> <!--editor:'numberbox'  -->
				<th width="80" data-options="field:'isMan',formatter:myGenderFormatter,editor:{type:'checkbox',options:{on:'true',off:'false'}}">是否为男</th>
				<th width="90"  data-options="field:'birthday',editor:{type:'datebox',options:{required:true}}">生日</th>
				<th width="120"  data-options="field:'comment',editor:'textarea'">comment</th>
				<th width="120" data-options="field:'action',formatter:myActionFormatter" >操作</th>
			</tr>
		</thead>
	</table>
	Selection Mode:
	<select onchange="$('#dg').datagrid({singleSelect:(this.value==0)})">
		<option value="0">Single Row</option>
		<option value="1">Multiple Rows</option>
	</select><br/>
	SelectOnCheck: <input type="checkbox" checked onchange="$('#dg').datagrid({selectOnCheck:$(this).is(':checked')})"><br/>
	CheckOnSelect: <input type="checkbox" checked onchange="$('#dg').datagrid({checkOnSelect:$(this).is(':checked')})">
		
</body>
</html>