<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="commonHead.jsp"/>

<script type="text/javascript">
	
	var  root="/S_jQuery"; 
	//有Ajax操作应和服务器在一个项目
	$(document).ready(function() //<body onload=""
	{
		
		 //全局
		$.ajaxSetup({
			//timeout: 3000,
			beforeSend: function (xhr)
			{
				//显示oading
				alert("全局loading");
			},
			complete: function (xhr, status)
			{
				//隐藏loading
				if(status=='success')
				{
					alert("全局complete");
				}else
				{

				}
			}
		});
		 
		 
		$("#btn_false").click(function ()
		{
			$("input[name='myButton']").trigger("click");
		
		});

		
		$("input[name='myButton']").click(function ()
		//$('#btn').click(function ()
		{
			var user=$('#username').val();
			 
			//$.get    js端 encodeURI
			$.get( root+'/jQuery/Ajax?username='+ encodeURI(user) , null, 
				function(response)
				{
					$("#result").html(response);
				})
			.fail(function(e) 
			{
				alert(e.statusText); //有错误可能是,js和server不在一个项目的原因
			})
			.done(function() {
			alert( "second success" );
			}) 
			.always(function() {
			alert( "finished" );
			});	
			
			//$.ajax , js端encodeURIComponent
			$.ajax
			({
				method : 'GET', //默认是GET
				url:root+'/jQuery/Ajax?username='+ encodeURIComponent(user) , 
				//url:root+'/jQuery/Ajax?username='+user ,  
				data:null, 
				success:function(response)
				{
					//$("#result").html(response);
					$("#result").append(response+'<br>');
				}
			});
			 
		});//click
			
			
		$('#list').click(function ()
		{
			// $.post
			$.post(root+"/jQueryAjaxJsonList","one=一" , function(json)
					  {
						    $(json).each(function(i)
							{ 
						    	$("#result").append(json[i].username+"<br/>");
							});
				      },'json');
			
			
			/*
			// $.getJSON
			$.getJSON(root+"/jQueryAjaxJsonList", { one: "一" },
			  function(json) 
			  { 
				$(json).each(function(i)
				{ 
					//$("#result").append(decodeURI(json[i].username)+"<br/>");
					$("#result").append(json[i].username+"<br/>");
				});
			});
			*/
			/*
			
		 	// $.ajax   dataType:"json",
			$.ajax({
				   type: "POST",
				   url:root+"/jQueryAjaxJsonList",
				   dataType:"json",//返回是json
				   data: "one=一",
				   success: function(json)
				   {
					    $(json).each(function(i)
						{ 
					    	$("#result").append(json[i].username+"<br/>");
						});
				   }
				});
			*/
				 
		});
			
		
	    /*//no effect
		 $("p").click(function()
		 {
	         alert( $(this).text() );
	     });
	    $("button").click(function()
		{
	        $("<p>this is second p</p>").appendTo("body");
	    });
		*/
		
		/*
	    $("p").live("click",function(){ //改成live方式,慎用 .live()方法（应该说尽量不要使用）
	         alert( $(this).text() );
	     });
	 	$("button").click(function()
		{
	        $("<p>this is second p</p>").appendTo("body");
	    });
	    */
		//------
		
		 $("p").click(function()
		 {
	         alert( $(this).text() );
	     });
		 
		$("button").click(function()
		{
		    $("<p>this is second p</p>").click(function()
			{  //为新增的元素重新绑定一次
		            alert( $(this).text() );
		    }).appendTo("body");
		});
		//------


	


	
	});
		
	
	</script>
</head>
<body>
	username:<input type="text" id="username" /> get方式传中文要encodeURI()<br/>
	<input type="button" value="提交"  id="btn" name="myButton" /> <br/>
	<input type="button" value="提交_模拟"  id="btn_false"  /> <br/>
	<div id="result"></div>
	
	<input type="button" value="getListData" id="list"/>
	<div id="tabResult"></div>
  

    <p>click the p have event</p>
	<button>按钮文本在button标签中 </button>
	
</body>
</html>



