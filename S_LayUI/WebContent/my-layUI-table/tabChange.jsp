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

 
<input type="button" value="点选切换2" onclick="switchTab()" />

<div class="layui-tab layui-tab-brief" lay-filter="tab" >
    <ul class="layui-tab-title">
        <li lay-id="11" class="layui-this">标签1</li>
        <li id="layui1" lay-id="22" >标签2</li>
        <li id="layui2" lay-id="33" >标签3</li>
    </ul>
    <div class="layui-tab-content" >
        <div class="layui-tab-item layui-show">
         	11 
        <div class="layui-tab-item" >
			22
        </div>
        <div class="layui-tab-item" >
			33
        </div>
    </div>
</div>
 


<script> 

layui.use('element', function(){
    var $ = layui.jquery ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

});
function  switchTab()
{
	layui.element.tabChange('tab', '22'); //lay-id="22"
}
</script>

</body>
</html>