<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 示例</title>
 
	<jsp:include page="head.jsp"></jsp:include>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-daterangepicker-2.1.25/daterangepicker.css" >
	<script src="${pageContext.request.contextPath}/bootstrap-daterangepicker-2.1.25/moment.min.js" ></script>
	<script src="${pageContext.request.contextPath}/bootstrap-daterangepicker-2.1.25/daterangepicker.js" ></script>

	
	<script type="text/javascript">
	
	 $(document).ready(
	function() {
		
		
		  $('#singleDate').daterangepicker({
	            singleDatePicker: true,
	            startDate: moment(),
	            //timePicker: true,
	            format:'YYYY-MM-DD'  //无效?
	            	 
	            		
	        }
		  /*, function(start, end, label) {
	        	alert( start.format('YYYY-MM-DD'))
	        	$('#singleDate').val( start.format('YYYY-MM-DD')) //无效?
			}
	        */
		  );
		 
		var now=new Date();
		var monthAgo=new Date();
		monthAgo.setDate(now.getDate()-31);
		  
		  $('#entryTime').daterangepicker({
	            locale : {
	                applyLabel : '确定',
	                cancelLabel : '取消',
	                fromLabel : '起始时间',
	                toLabel : '结束时间',
	                customRangeLabel : '自定义',
	                daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
	                monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
	                    '七月', '八月', '九月', '十月', '十一月', '十二月' ],
	                firstDay : 1
	            }
		  ,
		  //format:'YYYY-MM-DD' , //无效?
		   	 "startDate":monthAgo,
		     "endDate": moment(),
		     "minDate":monthAgo,
		     "maxDate": moment()
	        }, function(start, end, label) {
	            console.log(start.toISOString(), end.toISOString(), label);
	        });

		  
		 $('#searchTimeStr').daterangepicker({
		        timePicker: true,
		       // timePickerIncrement: 30,
		        separator:'到',//无效?
		        format: 'YYYY-MM-DD hh:mm:ss'  //选择后无效?
		    }, function(start, end, label) {
		      	//
		    });
	});
	

	 
	 
	</script>
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    

    <h1>你好，daterange</h1>
    
 
  日期范围 　<input type="text" id="searchTimeStr"  style="margin-left: 0" size='30'/> <br/>
   日期范围中文 <input type="text" id="entryTime"  placeholder="2017-5-16"  size='30'> <br/>
    单个日期     <input type="text"  id="singleDate"/> <br/>
            
 <input type="button" onclick="$('#singleDate').val('2017-12-12')" value="设置值"/>
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
 