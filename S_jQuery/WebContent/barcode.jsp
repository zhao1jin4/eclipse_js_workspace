<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BarCode</title>

<style>
 

 
</style> 

	<jsp:include page="commonHead.jsp"/>
	<script type="text/javascript" src="js/jquery-barcode-2.0.1.js"></script>
<script>

$(function(){

   
}); 



function genCode()
{
	//$("div[id*='mycode']")
	 $("#mycode").barcode("CB024B5PQ71", "code128",{barWidth:3, barHeight:130});
}
</script>
</head>
<body>

 <div style='margin:0 auto;' id='mycode' style='text-align: center'> </div>

<button onclick="genCode()" >生成条形码</button>

</body>
</html>