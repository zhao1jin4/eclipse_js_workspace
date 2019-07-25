<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload plugin </title>

<style>
 
 
</style> 

<jsp:include page="commonHead.jsp"/>
<script type="text/javascript" src="js/fileupload/vendor/jquery.ui.widget.js"></script>
<script type="text/javascript" src="js/fileupload/jquery.fileupload.js"></script>

	
<script>

$(function(){
 
	//如果放在初始化中，选择文件 时双击可提交请求   
	uploadImg();
}); 

function uploadImg()
{

	 $("#returnInput_upload").fileupload({
		   url:'/S_jQuery/uploadServlet3', //localhost或127.0.0.1域名要相同
		   maxChunkSize: 20480000, // 20MB 文件尺寸限制
		   limitMultiFileUploads:3, //一次最多允许上传的文件数
		   limitMultiFileUploadSize:20480000,// 20MB 文件尺寸限制
		   acceptFileTypes : /(\.|\/)(gif|jpe?g|png)$/i,
		   loadImageMaxFileSize:20480000,// 20MB 文件尺寸限制
		   imageMinWidth:200, //图片最小宽度
		   imageMinHeight:150, //图片最小高度
		   imageMaxWidth: 2048,//超过此宽度的将被裁切至此宽度
		   imageMaxHeight: 1536,//超过此高度的将被裁切至此高度
		   imageCrop: true,//是否执行裁切
		   messages : function(){
			   acceptFileTypes : '123456789'
		   },
		   done:function(event,data){
				alter('返回数据'+data.result);
			}
		 });
}
</script>
</head>
<body>
 https://github.com/blueimp/jQuery-File-Upload
 <br/>
 files:   <input type=file id="returnInput_upload" name="attache1" multiple/>  选择文件 时双击可提交请求 ,要和服务器在一起 <br/>
 
 <input type=button  value="上传图片" onclick="uploadImg()"/>  
 如果不放在初始化中， 没有效果
   
   
   
</body>
</html>