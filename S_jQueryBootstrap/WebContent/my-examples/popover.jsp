<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>popover 示例</title>
 
 	<jsp:include page="head.jsp"></jsp:include>
 
	<script src="${pageContext.request.contextPath}/bootstrap-3.3.7/js/tooltip.js" ></script>
	<script src="${pageContext.request.contextPath}/bootstrap-3.3.7/js/popover.js" ></script>
	
	
	<script type="text/javascript">
	
	 $(document).ready(
	function() {
		
		 $('[data-toggle="popover"]').popover();
	});
	   
	  
	</script>
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    

    <h1>你好，popover</h1>
     	<button  
		data-toggle="popover" data-trigger="click" 
		data-placement="bottom" 
		data-content="这是一个全部的文本，很长很长，很长很长，很长很长，很长很长，很长很长，很长很长"  >
		这是一个缩短的文本 ...
	</button>

	<%--
<c:if test="${content.length() > 50 }">
	<button  
		data-toggle="popover" data-trigger="click" 
		data-placement="bottom" 
		data-content="${content}"  >
		${fn:substring(content,0,50)} ...
	</button>
</c:if>
<c:if test="${content.length() <= 50 }"> ${content}</c:if>
  --%>    
 
  </body>
</html>
 