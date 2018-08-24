<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loading</title>

<style>

#loading {
    width:100%;
    position:absolute;
    z-index:100;
    background-color:#F7F9FC;
    line-height:25px;
    text-align:center;
    font-size:11pt;
    display:none;
    opacity:0.5;
}

 
</style> 

	<jsp:include page="commonHead.jsp"/>
	
<script>

$(function(){

  
    $("#loading").css("height",$(document).height());
    $("#loadingContent").css("padding-top",$(document).height()/2);

    $.ajaxSetup({
        //timeout: 3000,
        beforeSend: function (xhr)
        {
            //显示加载数据
 			$("#loading").show();
        },
        complete: function (xhr, status)
        {
            //隐藏加载数据
            $("#loading").hide();
        }
    });
     
    var siteCode=$("form[name='chartForm'] input[name='siteName']");//可以查所有 form[name='chartForm']  及所有子级的input[name='siteName']
     siteCode.each(function(){
         $(this).attr("readonly","readonly");
        // $(this).click(function(){
          //   $("#myModal1").show();
        // });
     });

});
function startAjax()
{

	$.ajax({
	    type: "POST",
	    url:'www.baidu.com',
	    dataType:"text/html",
	    success: function(res)
	    {
	    	alert('OK');

	    },
	    error: function(e)
	    {
	        alert('请求服务器出现错误');
	    }
	});
}
</script>
</head>
<body>

<div id="loading">
    <div id="loadingContent">  <img src="img/loading.gif" alt=""/> 加载中... </div>
</div>

<button onclick="startAjax()"> ajax test 要运行在服务中才行 </button> 

<br/>


chartForm 1
<form name="chartForm">
siteName：	<input name="siteName"/> 
userName:	<input name="userName"/>
</form>

<br/>


chartForm 2
<form name="chartForm">
	siteName：	<input name="siteName"/> 
	userName:	<input name="userName"/>
</form>

</body>
</html>