<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


	<jsp:include page="../commonHead.jsp"/>
	
	
<style type="text/css">
	#targetElement { width:240px;height:200px;background-color:grey;margin:30px auto; }
	.positionDiv { width:50px;height:50px;opacity:0.6; }
	#position1 {background-color:red;}
	#position2 {background-color:green;}
	#position3 {background-color:blue;}
	#position4 {background-color:yellow;}
</style>

<script>
  $(document).ready(function() {
    
$("#position1").position({
  my: "center",
  at: "center",
  of: "#targetElement"
});
$("#position2").position({
  my: "left top",
  at: "left top",
  of: "#targetElement"
});
$("#position3").position({ //我的右中 与 #targetElement的右底对齐
  my: "right center", //先 左右(中),后 顶底(中),
  at: "right bottom",
  of: "#targetElement"
});
$(document).mousemove(function(ev){
  $("#position4").position({ //div没有加z-index
    my: "left bottom",
    of: ev,
    //offset: "50 -50",//top left,好像没什么作用
    collision: "fit" //在拖放到浏览器的边界时的变化方式,默认是flip
    ,using:animate//修改位置时一个回调函数
  });
});

  });
function animate( to ) {//带top,left属性的对象参数传入
	$( "#log").text( to.top+","+to.left );
	$( this ).stop( true, false ).animate( to );
}  
  </script>
</head>
<body style="font-size:62.5%;">
  
<div id="targetElement">
  <div class="positionDiv" id="position1"></div>
  <div class="positionDiv" id="position2"></div>
  <div class="positionDiv" id="position3"></div>
  <div class="positionDiv" id="position4"></div>
</div>
<div id="log">
</div>

</body>
</html>