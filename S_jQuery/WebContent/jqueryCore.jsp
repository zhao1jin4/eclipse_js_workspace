<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<jsp:include page="commonHead.jsp"/>
	
	<link type="text/css" rel="stylesheet" href="css/my.css"/>
	
	<style type ="text/css" >
	 .errorText
	 {
	 	/*gvim可HTML模板,可以提示CSS 的key:value,还可是路径*/
		 border:1px solid red;
		 background-image:url(img/error.png);
		 background-repeat:repeat-x;
		 background-position:bottom;
	 }
	 .wrap{
	  background-color:blue
	 }
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn").click(function(){
				var v=$("#username").val();
				if(v=="")
					$("#username").addClass("errorText");
				else
					$("#username").removeClass("errorText");
					
			});
			
			//---测试end()
			$('ul.first').find('.foo').css('background-color', 'red')//因现在当前是'.foo',如end()后变为'ul.first'
					.end().find('.bar').css('background-color', 'green');
			//----wrap
			$("#myWrap").wrap("<div class='wrap'></div>");//变为<div class="wrap"><p>Test Paragraph.</p></div>
			
			//---
			var div=$("#myParent").parent();// <div><p id="myParent">Hello</p></div>
			//alert(div.html());
			
			//--prepend
			var result=$("#myPrepend").prepend("<b>Hello</b>");//结果: <p id="myPrepend"><b>Hello</b>I would like to say: </p>
			alert(result.html());
		});
		 
		 $(document).keydown(function(event)
		  {
		     if(event.keyCode == 37){
				alert('37 左方向键');
			}else if (event.keyCode == 39){
				alert('39 右方向键');
			}
		 });
	</script>
</head>
<body>
	<input type="text" id="username" />	<input type="button" id="btn" value="验证是否为空" />
	
	
	<ul class="first">
		<li class="foo">list item 1</li>
		<li>list item 2</li>
		<li class="bar">list item 3</li>
	</ul>
	<ul class="second">
		<li class="foo">list item 1</li>
		<li>list item 2</li>
		<li class="bar">list item 3</li>
	</ul>
	
	
	<p  id="myWrap">Test Paragraph.</p>
 
    <div><p id="myParent">Hello</p></div>

	<p id="myPrepend">I would like to say: </p>

	<p  > 按左键 按右键 有响应 </p>
</body>
</html>

