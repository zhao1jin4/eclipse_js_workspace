<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
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
			var  root="/S_jQueryUI";
			 	$( "#remote" ).autocomplete({//<input type="text"
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
					change: function( event, ui )//如没有选择就提示，清空输入的 
					{ 
	            		if(ui.item == null){
	            			$( "#remote" ).val(""); 
	            		}
	            	},
	            	select: function( event, ui ) 
					{ 
						 alert("select :"+ui.item.label+"val :"+ui.item.value); 
					},
					open: function() {
					},
					close: function() {
					}
					
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