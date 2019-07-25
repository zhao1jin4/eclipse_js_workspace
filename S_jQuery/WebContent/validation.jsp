<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> validationEngine-2.6.4 </title>
	
	 <jsp:include page="commonHead.jsp"/>
	<script type="text/javascript" src="js/jquery.validationEngine.js"></script>
	<script type="text/javascript" src="js/jquery.validationEngine-zh_CN.js"></script>
	
	<link type="text/css" rel="stylesheet" href="css/validationEngine.jquery.css"/>
	
	<style type ="text/css" >
	 
	</style>
	<script type="text/javascript">
	$(function (){
		$("#formID").validationEngine("attach",{ 
		    promptPosition:"centerRight", 
		    scroll:false 
		}); 
	});
	function ajaxRequest()
	{
		var isPass=$("#formID").validationEngine('validate');
		if(isPass)
			alert('ajax request done');
	}
	</script>
</head>
<body>
	 
	 URL :https://plugins.jquery.com/validationengine/
	 <br/>
	 <form id="formID"  action="http://www.baidu.com"  method="post"> 
		<fieldset>
			<legend> Required!</legend>
			<label>
				<span>Field is required : </span>
				<input value="" class="validate[required] text-input" type="text" name="req" id="req" />
			</label> <br/>
			<label>
				<span>maxSize 40: </span>
 				<input type="text"  name="BillCode" class="validate[required,maxSize[40]]" />
			</label> <br/>
			<label>
				<span>email : </span>
 				<input type="text"   name="email"   class="validate[custom[email]]" />
			</label> <br/>
			<label>
			<span>正则表左式要用custom,只数字字，最长8位，最小为0 : </span>
 				<input type="text"   name="name"  class="validate[required,min[0.00],maxSize[8],custom[onlyNumberSp]]" />
			</label> <br/>
			<pre>	
				如要扩展custom,在语言文件中加入
				"onlyLetter": {
				    "regex": /^[a-zA-Z\ \']+$/,
				    "alertText": "* Letters only"
				},
			</pre>
		</fieldset>
		<input  type="submit"  value="Validate &amp; Send the form!"/>  <br/>
		<input  type="button" onclick="ajaxRequest()"  value="ajax request"/>
	</form>
	
	
</body>
</html>

