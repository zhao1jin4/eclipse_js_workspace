<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 示例</title>
 
	<script src="${pageContext.request.contextPath}/jquery-3.2.1.min.js"></script>
	
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css"  >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" >
	<script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/toastr-2.1.3/toastr.min.css" >
	<script src="${pageContext.request.contextPath}/toastr-2.1.3/toastr.min.js" ></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-daterangepicker-2.1.25/daterangepicker.css" >
	<script src="${pageContext.request.contextPath}/bootstrap-daterangepicker-2.1.25/moment.min.js" ></script>
	<script src="${pageContext.request.contextPath}/bootstrap-daterangepicker-2.1.25/daterangepicker.js" ></script>

	
	<script type="text/javascript">
	 
	</script>
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    
    <h1>你好 bootstrap</h1>
    
    <a href="my-examples/toastr.jsp">Toastr 测试错误消息</a> <br/>
     <a href="my-examples/daterange.jsp">daterange  日期范围   格式化无效?? </a> <br/> 
     <a href="my-examples/bootbox.jsp">bootbox confirm 确认 </a> <br/> 
     <a href="my-examples/modal_dialog.jsp">  module dialog</a> <br/>
     <a href="my-examples/modal_dialog2.jsp"> module dialog 22 </a> <br/> 
     <a href="my-examples/datatables.jsp">datatable 分页  	,问题 总是请求中     ,页数30时,选择中没有30</a> <br/>
     
     
     <a href="my-examples/hplus/bsSuggest.jsp">hplus bootstrap suggest</a> <br/>
     <a href="my-examples/hplus/loading.jsp">hplus loading 测试中？？？</a> <br/>
     	
     <a href="my-examples/popover.jsp"> popover</a> <br/>
     <a href="my-examples/tab.jsp"> tab</a> <br/>
      
     	
      
  </body>
</html>
 