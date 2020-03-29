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
	
	<style type="text/css">
		/* 日期 选择后  文本框 右对齐  */
		.datebox input.textbox-text{text-align:right;}
		 
	</style>
	
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
	/*	var myLanguages=
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
					my_custome_param: 'my-easyUI-value',
					my_array: ['one','two'] //相当于url加参数名为my_array[]=one&my_array[]=two,服务端要用request.getParameterValues("my_array[]")来接收

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
			updateActions(index);//进入了edit模式，调用 updateRow 不会刷新format
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
						}

						$.messager.alert('提示','操作成功','info');//可用的有 error,question,info,warning.
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
			updateActions(index);//无效
			editIconVisible(row.id,true); 
		}
		function myCancelEdit(index,row)
		{
			row.editing = false;
			updateActions(index);//无效
			editIconVisible(row.id,true); 
		}
		
		//--行级的
		function getRowIndex(target){
			var tr = $(target).closest('tr.datagrid-row');
			return parseInt(tr.attr('datagrid-row-index'));
		}
		function myEditrow(target){
			var index=getRowIndex(target);
			$('#dg').datagrid('selectRow',index);
			var firstSel=$('#dg').datagrid('getSelected');
			editIconVisible(firstSel.id,false);
			$('#dg').datagrid('beginEdit', index);//调用 onBeforeEdit:myBeforeEdit
			console.log('这是调用myBeforeEdit后执行的') ; 
		}
		function mySaveUpdateRow(target){
			$('#dg').datagrid('endEdit', getRowIndex(target));//调用  onAfterEdit: myAfterEdit
			//editIconVisible( ); //myAfterEdit中有 
		}
		function myCancelUpdateRow(target){
			$('#dg').datagrid('cancelEdit', getRowIndex(target));//调用   onCancelEdit: myCancelEdit
			//editIconVisible( ); //myCancelEdit 中有 
		}
		function myInsert()
		{
			var row = $('#dg').datagrid('getSelected');//返回选中行的数据对象
			if (row){
				var index = $('#dg').datagrid('getRowIndex', row);
			} else {
				index = 0;
			}
			$('#dg').datagrid('insertRow', {//也有appendRow
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
			// 加format中加  class="easyui-linkbutton"没效果 ???
			/*		
			//进入编辑模式后，再调用 updateRow 方法 调用后也不会触发format ??
			if (row.editing){
				var s = '<a href="#"  onclick="mySaveUpdateRow(this)">Save</a> ';
				var c = '<a href="#" onclick="myCancelUpdateRow(this)">Cancel</a>';
				return s+c;
			} else { 
				var e = '<a href="#"  class="easyui-linkbutton" onclick="myEditrow(this)">Edit</a> ';
				var d = '<a href="#"  class="easyui-linkbutton" onclick="myDeleterow(this)">Delete</a>';
				return e+d;
			}
			*/ 
			var editBtn   = '<a href="#" id="editBtn'+row.id+'" class="easyui-linkbutton" onclick="myEditrow(this)">Edit</a> &nbsp;';//不可传row除非bind
			var saveBtm   = '<a href="#" id="saveBtn'+row.id+'" class="easyui-linkbutton" onclick="mySaveUpdateRow(this)" style="display:none" >Save</a>&nbsp; ';
			var cancelBtn = '<a href="#" id="cancelBtn'+row.id+'" class="easyui-linkbutton" onclick="myCancelUpdateRow(this)" style="display:none" >Cancel</a> &nbsp;';
			var deleteBtn = '<a href="#" id="deleteBtn'+row.id+'" class="easyui-linkbutton" onclick="myDeleterow(this)">Delete</a>';
			return editBtn+saveBtm+cancelBtn+deleteBtn; 
		}		
		function editIconVisible(id,visiable)
		{
			if(visiable)
			{
				$("#editBtn"+id).show();
				$("#saveBtn"+id).hide();
				$("#cancelBtn"+id).hide();  
			}else
			{
				$("#editBtn"+id).hide();
				$("#saveBtn"+id).show();
				$("#cancelBtn"+id).show(); 
			}
		}
		function updateActions(index)
		{
			$('#dg').datagrid('updateRow',{
				index: index,
				row:{}
			}); 
		}
		function myLangFormatter(value,row,index)
		{
			for(var i in myLanguages)
			{
				if(myLanguages[i].langValue==value)
					return myLanguages[i].langLabel;
			} 
		}
	 
		function mycomboBoxItemFormatter(row)
		{
		 	var opts = $(this).combobox('options');
			var val=row[opts.valueField];
			var text=row[opts.textField];
			if(val=='C')
			{
				//$(this).css('background-color','red');
				return '<span style="background-color: red;color: yellow">--'+text+'---</span>';
			}
			else
				return text;
		}
		function mySearch()
		{
			var selectedArray=['init','run','done','success','fail'];
			 $('#dg').datagrid('load',{
				 selectStatus: selectedArray ,//可传数组，服务端用request.getParameterValues("selectStatus[]")
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
			$('#dg').datagrid('endEdit',myIndex); //会自动验证
			var changes=$('#dg').datagrid('getChanges');//得到变化的,可传第二个参数 type,可选值 为inserted,deleted,updated 
			console.log(changes);
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
			$('#dg').datagrid('loading','任务正在加处理中。。。');//可用进度条
			$('#dg').datagrid('load');//取消显示处理中
			// $('#dg').datagrid('reload');
		}
		
		
	</script>
</head>
<body>

<span style="background-color: red;color: yellow">test color</span> <br/>


	<div class="icon-tip" style="width:16px;height:16px"></div>
	<div>分页  工具栏 in DataGrid.</div>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add"  onclick="myInsert()">增加一行</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="myBarEdit()">编辑</a><!-- 加 plain="true" 按钮没有立体感 -->
			
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="myBarSave()">保存</a>
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
	<table id="dg" title="表格数据" style="width:1000px;height:500px" 
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
				<th data-options="field:'x',checkbox:true"></th> <!-- 选择的复选框 -->
				<th  width="80" data-options="field:'id'" 	>ID</th> <!-- field的值是JSON对象的属性名 -->
				<th  width="100" data-options="field:'username',editor:{type:'validatebox',options:{required:true}}">用户名</th>
				<th width="100" data-options="field:'language',editor:{
							type:'combobox',
							options:{
								valueField:'langValue',
								textField:'langLabel',
								data:myLanguages,
								required:true,
								formatter: mycomboBoxItemFormatter,
							}
						},styler: function(value,row,index){
							if(value=='C')
								return 'background-color:#ffee00;color:red;';
						},formatter:myLangFormatter					
						">用语言</th>
					<th width="100" data-options="field:'hobby',editor:{
							type:'combobox',
							options:{
								valueField:'value',
								textField:'name',
								url:'/S_jQueryEasyUI/easyUI/comboBoxEditor' 
							} 
						}		
					">业余,URL取下拉</th>
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
	SelectOnCheck(没用？): <input type="checkbox" checked onchange="$('#dg').datagrid({selectOnCheck:$(this).is(':checked')})"><br/>
	CheckOnSelect: <input type="checkbox" checked onchange="$('#dg').datagrid({checkOnSelect:$(this).is(':checked')})">
		
	<br/>
	
	 <a  class="easyui-linkbutton" onclick="editDate()">编辑表格(如要进入页就是可以编辑代码移位置),样式发生变化，不对齐表格（对全部的编辑情况）？？？ 方案二 单击时 onClickCell 修改这行</a>
	 <a   class="easyui-linkbutton" onclick="readDate()">保存时读取输入的日期</a>
	<table id="myForm" 	style="width:700px;height:500px" 
		data-options="
				rownumbers:true,
				singleSelect:true,
				autoRowHeight:false,
				">
		<!--  
		 <thead>
			<tr>
				<th  data-options="field:'mileStone',width:100" >里程碑</th>
				<th  data-options="field:'startDate',editor:{type:'datebox'},width:100" >开始日期</th> 
				<th  data-options="field:'enDate',editor:{type:'datebox'},width:100">结束日期</th>
			</tr>
		</thead>
		-->
	</table>
		<script type="text/javascript"> 
		$("#myForm").datagrid({
		   columns:[[
		        {field:'mileStone',title:'里程碑',width:200},
		        {field:'startDate',title:'开始日期',width:200,editor:'datebox'},
		        {field:'endDate',title:'结束日期',width:200,align:'right',editor:'datebox'}
		    ]],
		    
			data:[
				{mileStone:"M1",startDate:'',endDate:''},
				{mileStone:"M2",startDate:'',endDate:''},
				{mileStone:"M3",startDate:'',endDate:''} 
				]
		,onClickCell:myClickCell
			
		});
		
		var nowEditRow=undefined;
		function myClickCell(index,field,value)
		{
			if(nowEditRow!=undefined)
			{   //先结束其它的编辑
				if($(this).datagrid('validateRow',nowEditRow))
				{
					$(this).datagrid('endEdit',nowEditRow);
					nowEditRow=undefined;
				}else
				{
					return; //验证失败不可编辑其它的
				}
			}  
			//开始编辑
			$(this).datagrid('selectRow',index);
			$(this).datagrid('beginEdit',index );
			nowEditRow=index;
		}
	 	function editDate( )
		{
			var rows=$("#myForm").datagrid('getRows');
			$(rows).each(function(i)
			{
				 $("#myForm").datagrid('beginEdit',i);
			});
			   
		}
		function readDate()
		{
			var rows=$("#myForm").datagrid('getRows');
			$(rows).each(function(i) 
			{
				 $("#myForm").datagrid('endEdit',i);
			});
			
			var jsonData=$("#myForm").datagrid('getRows');//只是最初始的数据，如修改了要保存才行
			console.log(jsonData); 
		}
		
		
		
		</script>
</body>
</html>