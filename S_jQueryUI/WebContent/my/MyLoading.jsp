<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我自己写的 加载中 </title>
	
	<jsp:include page="../commonHead.jsp"/>	

	<style type="text/css">
		 body,td,th{ font-size: 12; }
		input[type="button"],input[type="submit"],input[type="reset"] { font-size: 12; }
		table {  border-collapse: collapse;table-layout:fixed;word-wrap:break-word}
		table td{ border: 1px solid #EEEEEE; padding: .6em 10px; }
	</style>
	
	<script type="text/javascript">
	$(function() {
		 $( "input[type=submit],input[type=reset],input[type=button],button" ).button();
		 
		$( "#birthday" ).datepicker({dateFormat: "yy-mm-dd"});
		//滚动条动时图像也动
		$( window ).scroll(function() {
			 if($("#loadingImage").css("display") == "block")
			 {
			 		var vtop = (document.body.clientHeight  - $("#loadingImage").height())/2; 
					var vleft = (document.body.clientWidth - $("#loadingImage").width())/2; 
					var sTop = $(document).scrollTop(); 
					var sLeft = $(document).scrollLeft(); 
					$("#loadingImage").offset( { top: vtop+sTop , left: vleft+sLeft});
			 }
		});
	});
	//window.onscroll = function(){ }
	
	function showPopupWindow(parentId)
	{
		//----加不可操作背景
		var bgGreyDiv=$("<div></div>");
		bgGreyDiv.css("z-index","2").css("position","absolute").css("background-color","grey").css("opacity",0.2)
		.css("width",$(document).width()).css("height",$(document).height());
		$(document.body).append(bgGreyDiv);
		bgGreyDiv.offset( { top: 0, left:0});
		 
		/* 
		var bgGreyDiv=$("<div style='background:grey;opacity:0.2;z-index:2;position:absolute;left:0;top:0'></div>");
		bgGreyDiv.css("width",$(document).width()).css("height",$(document).height());
		$(document.body).append(bgGreyDiv);
		*/
		
		//----屏幕中心
		$("#loadingImage").css("z-index","3").css("position","absolute");
		var vtop = ( document.body.clientHeight  - $("#loadingImage").height())/2; 
		var vleft = (document.body.clientWidth - $("#loadingImage").width())/2; 
		var sTop = $(document).scrollTop(); 
		var sLeft = $(document).scrollLeft(); 
		$("#loadingImage").offset( { top: vtop+sTop , left: vleft+sLeft});
		$("#loadingImage").css("display","block");
		//----
		/*
		//一个页面中不能有两次 jQuery.js的引入,
		$.ajax
		({
			type:"GET",
			url:'${webRoot}/freemarkerRegister/initRegister.mvc',
			async:false,//是否异步
			//data:"id="+parentId,
			//dataType:"xml",
			success:function (data)
			{
				$("#dialog").html(data);
			},
			error:function(err){
				alert(err.responseText);
			}
		});
		*/
		 $("#dialog").html("非ajax");
		$("#loadingImage").css("display","none");
		bgGreyDiv.css("display","none");
		$("#dialog").css("display","block");
		$("#dialog").dialog({
				height: 300,
				width: 500,
				modal: true
				});
		//window.open('${webRoot}/freemarkerRegister/initRegister.mvc' ,'','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=750,height=470,left=80,top=40');
	}
	
	function goURL(url)
	{
		window.location=url;
	}
	 
	</script>
 </head>
 
 <body>
	<div id="dialog" title="弹出窗口" style="display:none" > 
	</div>
	
	<image src="../images/loading.gif" id="loadingImage"  style="display:none"   /> 

	<input type="text" id="birthday" />
	<button type="button" onclick="showPopupWindow(0)"> 加载弹出对话框 </button>
	
	
	<table width="500">
		<tr>
			<td width="20">内容1</td>
			<td width="20">内容1</td>
			<td width="20">内容1</td>
			<td width="20">内容1</td>
		</tr>
		<tr>
			<td>内容1</td>
			<td>内容1内容1,内容1,内容1,内容1,内容1内容1,内容1,内容1,</td>
			<td>内容1</td>
			<td>内容1</td>
		</tr>
		<tr>
			<td>内容1</td>
			<td>内容1</td>
			<td>内容1</td>
			<td>内容1</td>
		</tr>
		
	</table>
</body>
</html>
 
