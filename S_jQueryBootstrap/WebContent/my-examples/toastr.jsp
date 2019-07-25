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
 
	<jsp:include page="head.jsp"></jsp:include>	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/toastr-2.1.3/toastr.min.css" >
	<script src="${pageContext.request.contextPath}/toastr-2.1.3/toastr.min.js" ></script>
	
	
	<script type="text/javascript">
	 toastr.options.positionClass = 'toast-top-center';
	
	 $(document).ready(
	function() {
		
		 
	});
	

	 
	 
	</script>
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    

    <h1>你好，toastr</h1>
     
     <button id="errorButtion" type="button" class="btn btn-default"  onclick=" toastr.error('查询失败!');">测试错误消息</button>
       
            
	<table>
		<tr>
			<td style="width=20">
				<a href=""> </a>
			</td>
			<td style="width=2000">
			 	<div id="body"></div>
			</td>
		</tr>
	</table>
  </body>
</html>
 