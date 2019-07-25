<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>BS Suggest 示例</title>
 
 	<jsp:include page="../head.jsp"></jsp:include>
 
	
	<script src="${pageContext.request.contextPath}/hplus/bootstrap-suggest.js" ></script>
	
	
	<script type="text/javascript">
	
	 $(document).ready(
	function() {
		
		
		//要放     $(function(){}中
        $("#testNoBtn").bsSuggest({
            url:'${pageContext.request.contextPath}/suggestJsonServlet',
            effectiveFieldsAlias:{name: "姓名",stuid:'学号'},
            ignorecase: true,
            showHeader: true,
            showBtn: false,
            delayUntilKeyup: true,
            idField: "name",  
            keyField: "stuid",//选中使用的
            clearable: true
        }) ;
		
		
		

		
    	$("#test").bsSuggest('init', { 
            clearable: true,
            url:'${pageContext.request.contextPath}/suggestJsonServlet',
            idField: "name",  
            keyField: "stuid" //选中使用的
        }).on('onDataRequestSuccess', function (e, result) {
            console.log('onDataRequestSuccess: ', result);
        }).on('onSetSelectValue', function (e, keyword, data) {
            console.log('onSetSelectValue: ', keyword, data);
        }).on('onUnsetSelectValue', function () {
            console.log('onUnsetSelectValue');
        });
    	
    	
    	
		 
	});
		
		
	 
	</script>
  </head>
  <body>
  
 http://lzw.me/pages/demo/bootstrap-suggest-plugin/demo/
<br/>

<table>
<tr valign="top">
	<td  >
		<label>标签  ：</label>想要下面在同一行
	</td>
	<td>
 
	<div style="width:200px;height:70px;background-color:pink"> <!-- 控制下拉表的宽度 -->
	    
	   <div class="input-group">
	        <input type="text" name="stuid" id="testNoBtn"/>
	        <div class="input-group-btn">
	            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                <span class="caret"></span>
	            </button>
	            <ul class="dropdown-menu dropdown-menu-right" role="menu">
	            </ul>
	        </div>
	        <!-- /btn-group -->
	    </div>
	        
	</div>
</td>
</tr>
</table>



<br/>

<div style="width:100px;height:70px;background-color:red;opacity:0.8;display:inline">
	text 1 in div
</div>
<div style="width:100px;height:70px;background-color:blue;opacity:0.8;display:inline">
	text 2 in div
</div>

<div></div>
<br/>
想要下面在同一行,div 如何不换行float:right,display:inline都不行,
float:left后所有左侧的组件都要float:lef
<label style="float:left" >标签  ：</label>

<div style="width:200px;height:70px;background-color:pink;float:left;" >  <!-- 控制输入框的宽度 -->


		 <div class="input-group">
		       <input type="text" class="form-control" id="test">
		       <div class="input-group-btn">
		           <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		               <span class="caret"></span>
		           </button>
		           <ul class="dropdown-menu dropdown-menu-right" role="menu">
		           </ul>
		       </div>
		       <!-- /btn-group -->
		   </div>
  
</div> 
 
                
  </body>
</html>
 