<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>auto complete</title>
	
	
	<jsp:include page="../commonHead.jsp"/>

<style>
	/* 对.ui-autocomplete ,overflow-y: auto;加垂直滚动条 */
	.ui-autocomplete {
		max-height: 100px;
		overflow-y: auto;
		overflow-x: hidden;
	}
</style>
<script>
	$(function() {
	 
		var availableTags = ["C",
		"Java",
		"Python",
		"Scala"
		];
		
		$( "#tags" ).autocomplete(//<input type="text"
				{ 
					source: availableTags ,//["ActionScript","C++"]
					select: function( event, ui ) {//函数原形
						 alert("select :"+ui.item.label);//ui.item.label
					},
					change: function( event, ui ) { //如没有选择就提示，清空输入的 
	            		if(ui.item == null){
	            			$( "#tags" ).val(""); 
	            		}
	            	}
					 
				}
		);
		
 
		var cache = {};
		//var  root="/J_AjaxServer";
		var  root="http://localhost:8080/J_AjaxServer";//localhost 或者 127.0.0.1是不同的，client和server要相同
		$( "#remote" ).autocomplete({//<input type="text"
				minLength: 2,//至少输入2个字符才开始搜索
				delay: 500,
				source: function( request, response ) 
				{//函数原形
					var term = request.term;//输入的值
					  
					if ( term in cache ) {//自己的缓存
						response( cache[ term ] );
						return;
					} 
					//使用$.ajax请求
					$.ajax({
					   type: "POST",
					   url:root+"/queryLanguage_JSON?myMaxRows=12&myStartWith="+request.term,//request.term输入的值
					   dataType:"json",
					   success: function(json)
					   {
						   var res= $.map( json , function( item )//$.map 自定义数组转换字串
												{
													return {
														label: decodeURI(item.label),//JSONE格式{label:x  ,value:y}
														value: item.value
													}
												}
											);
							cache[ term ]=res ;//放入自己的缓存
							response(res);//传入的回调函数
					   }
					});
					
				},
				change: function( event, ui )//修改了选择时
				{ 
					console.log("change"+ ui.item);
            		if(ui.item == null){ //如没有选择就提示，清空输入的 
            			$( "#remote" ).val(""); 
            		}
            	},
            	select: function( event, ui ) 
				{ 
					 alert("select :"+ui.item.label+"val :"+ui.item.value); 
				},
				focus: function( event, ui ) {//鼠标滑过结果项上时
					$( "#remote" ).val( ui.item.label ); 
					return false;
				},
				/* 
				open: function() {//结果打开时
					alert("open ");
				},
				close: function() {//结果关闭时
					alert("close ");
				}
				
				,create: function( event, ui ) { //初始化后调用 
					alert("create ");
				},
			  search: function( event, ui ) {//开始搜索时
				  alert("search ");
			  } 
				*/
				
				//数据 太多不能出现滚动条
				
		});
		 
		
	});
	 
	 
	</script>
</head>
<body>

<div class="ui-widget">
	
	如没有选择就提示，清空输入的 
	<label for="tags">Tags: </label>
	<input id="tags">
	
	<br/>
	 
	输入J 或Ja<br/>
	<label for="remote">Remote Data: </label>
	<input id="remote">

	
	<br/>
	
	
</div>

</body>
</html>