<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<jsp:include page="commonHead.jsp"/>
	
	
	<style type ="text/css" >
	 
	</style>
	<script type="text/javascript">
	
	//extend(dest,src1,src2,src3...);//它的含义是将src1,src2,src3...合并到dest中,
	var ori={};
	var result=$.extend(ori,{name:"Tom",age:21},{name:"Jerry",sex:"Boy"});
	//执行后ori和result是相同的
	console.log('ori='+JSON.stringify(ori)+",result="+JSON.stringify(result));
	
	
	$.extend({
		  hello:function(){console.log('hello');}
		  });//就是将hello方法合并到jquery的全局对象中。
	$.hello();
		  
	$.fn.extend({
	  hello2:function(){console.log('hello2');} //将hello2方法合并到jquery的实例对象中去 
	 });
	
	$("#myDiv").hello2();
	//$("#myDiv").hello();//报错
	
	
	$.extend({net:{}});
	$.extend($.net,{ //　 这是在jquery全局对象中扩展一个net命名空间。
		   hello:function(){console.log('hello.net');}
		  })
	$.net.hello();
	
	
	//extend(boolean,dest,src1,src2,src3...)//  第一个参数boolean代表是否进行深度拷贝
	var result=$.extend( false, {},  
			{ name: "John", location:{city: "Boston",county:"USA"} },  
			{ last: "Resig", location: {state: "MA",county:"China"} }  //只要最后一个 location
   ); 
	console.log('dep copy=false,result='+JSON.stringify(result));
	//{"name":"John","location":{"state":"MA","county":"China"},"last":"Resig"}
	
	var result=$.extend( true, {},  
			{ name: "John", location:{city: "Boston",county:"USA"} },  
			{ last: "Resig", location: {state: "MA",county:"China"} }  
   ); 
	console.log('dep copy=true,result='+JSON.stringify(result));  //两location合并，中相同的county使用最后面的
	//{"name":"John","location":{"city":"Boston","county":"China","state":"MA"},"last":"Resig"}
	
	
	
	</script>
</head>
<body>
	 	<div id="myDiv"></div>
</body>
</html>

