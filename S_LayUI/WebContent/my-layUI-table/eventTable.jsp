<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <jsp:include page="../head.jsp"></jsp:include>
  
</head>
<body>
 
pageContext request contextPath : ${pageContext.request.contextPath} <br/> 

点 工资 列 <br/>
language列templet
 
<script type="text/html" id="langTransfer">
    {{#  	if(d.language === 'C'){ 			}}
   				 <span>C/C++ 语言</span>
    {{#  	} else {							}}
   				 <a style="color: blue;" lay-event="edit">编辑</a>   
    {{#  	} 									}}
</script>      
<table class="layui-table" lay-data="{height: 313, url:'${pageContext.request.contextPath}/layUI/queryJsonData'}" lay-filter="demoEvent">
  <thead>
    <tr>
      <th lay-data="{field:'id', width:80}">ID</th>
      <th lay-data="{field:'username', width:80}">用户名</th>
      <th lay-data="{field:'isMan', width:80}">性别</th>
      <th lay-data="{field:'city', width:80}">城市</th>
      <th lay-data="{field:'comment', width:177 }">说明</th>
      <th lay-data="{field:'salary', width:80 , event: 'setSalary', style:'cursor: pointer;'}">工资</th>
      <th lay-data="{field:'language', width:80,templet: '#langTransfer'}">语言</th>
      
    </tr>
  </thead>
</table>  


<script>
layui.use('table', function(){
  var table = layui.table; 
  //监听单元格事件
  table.on('tool(demoEvent)', function(obj){
    var data = obj.data;
    if(obj.event === 'setSalary')
    {
      layer.prompt({
        formType: 2
        ,title: '修改 ID 为 ['+ data.id +'] 的工资'
        ,value: data.salary
      }, function(value, index){
        layer.close(index);
        
        //这里一般是发送修改的Ajax请求
        
        //同步更新表格和缓存对应的值
        obj.update({
        	salary: value
        });
      });
    }else if (obj.event === 'edit')
   	{
   		alert('收到edit事件');
   	}
  });
});
</script>

</body>
</html>