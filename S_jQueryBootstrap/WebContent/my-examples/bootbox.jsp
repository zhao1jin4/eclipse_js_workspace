<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>bootbox 示例</title>
 
 	<jsp:include page="head.jsp"></jsp:include>
 
	<script src="${pageContext.request.contextPath}/bootbox-4.4.0/bootbox.min.js" ></script>
	
	
	<script type="text/javascript">
	
	 $(document).ready(
	function() {
		
		 
	});
	
	
	 
	 function confirmDelete()
	 {
		 /*   bootbox.confirm({
		        message: "确认吗删除吗?",
		        buttons: {
		            confirm: {
		                label: '是',
		                className: 'btn-success'
		            },
		            cancel: {
		                label: '否',
		                className: 'btn-danger'
		            }
		        },
		        callback: function (result) {
		            console.log('选择了: ' + result);
		        }
		    });
		   */
		 bootbox.confirm("确认吗删除吗?", function (result){
			 console.log('选择了: ' + result);
		 });
	 }
	</script>
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    

    <h1>你好，bootbox</h1>
     
     <button id="confirmButtion" type="button" class="btn btn-default"  onclick=" bootbox.alert('操作成功'); ">提示成功 </button>
     <button id="confirmButtion" type="button" class="btn btn-default"  onclick=" confirmDelete() ">确认吗</button>
       
            
	<table>
		<tr>
			<td style="width=20">
				<a href=""> </a>
			</td>
			<td style="width=2000">
			 	<div id="body"></div>
			</td>
		</tr>
	</table>
  </body>
</html>
 