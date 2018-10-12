<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8" />
	<title>Cross Domain</title>
	<jsp:include page="commonHead.jsp"/>
	 
	<script type="text/javascript">
 
	   	
    // 跨域 jsonp 
    $(document).ready(function()
    { 
        $.ajax({
             type: "get",
             async: true,
             url: "http://127.0.0.1:8080/S_jQuery/jQuery/crossDomainJsonp",
             //url: "http://localhost:8080/S_jQuery/jQuery/crossDomainJsonp",
             data:{flight:"FLT001"},
             dataType: "jsonp",
             jsonp: "callback",//默认为:callback，传到服务端的参数名
             jsonpCallback:"flightHandler",//传到服务端的参数值,即函数名(也可不传jquery自动生成名字),JS端生成这个函数调用success
             success: function(json){
                 alert('您查询到航班'+json.code+'信息：票价： ' + json.price + ' 元，余票： ' + json.tickets + ' 张。');
             },
             error: function(){
                 alert('fail');
             }
         });
     });
   
	</script>
</head>
<body>
	 
</body>
</html>

