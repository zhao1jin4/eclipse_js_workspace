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
pageContext.request.contextPath :${pageContext.request.contextPath} <br/>
 
 
<div class="demoTable">
  搜索ID：
  <div class="layui-inline">
    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
</div>
 
<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table> 


language列templet

<script type="text/html" id="langTransfer">
    {{#  	if(d.language === 'C'){ 			}}
   				 <span>C/C++ 语言</span>
    {{#  	} else {							}}
   				 <span>非C 语言</span>
    {{#  	} 									}}
</script>                 
<script>

layui.use('table', function(){
  var table = layui.table;
  
  //方法级渲染
  table.render({
    elem: '#LAY_table_user'
   	,method : 'get'
    ,url: '${pageContext.request.contextPath}/layUI/queryJsonData'
    //,data: [{}]
    ,cols: [[
      {checkbox: true, fixed: true}
      ,{field:'id', title: 'ID', width:80, sort: true, fixed: true}
      ,{field:'username', title: '用户名', width:80}
      ,{field:'language', title: '语言', width:80, sort: true,templet: '#langTransfer'}
      ,{field:'salary', title: '工资', width:80}
      ,{field:'isMan', title: '男人吗', sort: true, width:80}
      ,{field:'birthday', title: '生日', sort: true, width:80}
      ,{field:'comment', title: '说明 ', width:80} 
    ]]
    ,id: 'testReload'
    ,page: true
    ,height: 315
    , done:  function(res, curr, count){
        console.log('加载完成 隐藏加载中');
    }

  });
  
  var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload');
      
      table.reload('testReload', {
        where: {
        	  id: demoReload.val()  //服务端直接 request.getParameter("id");
        }
      });
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type'); //type 是 reload
    active[type] ? active[type].call(this) : '';
  });
});
</script>

</body>
</html>