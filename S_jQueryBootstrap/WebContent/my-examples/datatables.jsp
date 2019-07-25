<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>datatables 示例</title>
 
 	<jsp:include page="head.jsp"></jsp:include>
 
<link rel="stylesheet" href="${pageContext.request.contextPath}/DataTables-1.10.15/media/css/jquery.dataTables.min.css" >
<script  type="text/javascript" src="${pageContext.request.contextPath}/DataTables-1.10.15/media/js/jquery.dataTables.min.js" ></script>


	<script type="text/javascript">
	
	 $(document).ready(
	function() {
		// $('#example').DataTable(); //html
		 
		
		
		
		 $('#myServerArrayTable').DataTable( {
		        "processing": true,
		        "serverSide": true,
		        "ajax": "${pageContext.request.contextPath}/datatablesArrayServlet",
		        
		        "oLanguage" : { // 汉化
		        	"sProcessing" : "正在加载数据...",
		        	"sLengthMenu" : "显示_MENU_条 ",
		        	"sZeroRecords" : "没有您要搜索的内容",
		        	"sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
		        	"sInfoEmpty" : "记录数为0",
		        	"sInfoFiltered" : "(全部记录数 _MAX_  条)",
		        	"sInfoPostFix" : "",
		        	"sSearch" : "搜索",
		        	"sUrl" : "",
		        	"oPaginate" : {
			        	"sFirst" : "第一页",
			        	"sPrevious" : " 上一页 ",
			        	"sNext" : " 下一页 ",
			        	"sLast" : " 最后一页 "
			        	}
		        },
		        "iDisplayLength" : 30,// 每页显示行数
		        
		    } );
		
		 $('#myServerJsonTable').DataTable( {
		        "processing": true,
		        "serverSide": true,
		        ajax:   "${pageContext.request.contextPath}/datatablesJsonServlet", 
				"columns": [
			            { "data": "stuid" },
			            { "data": "name" },
			            { "data": "score" },
			            { "data": "birthday" } 
			        ]
		 } );
		 
	});
	</script>
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    

    <h1>你好，datatables</h1>
    <!-- 
      <table id="example" class="display" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
        <tbody>
            <tr>
                <td>Tiger Nixon</td>
                <td>System Architect</td>
                <td>Edinburgh</td>
                <td>61</td>
                <td>2011/04/25</td>
                <td>$320,800</td>
            </tr>
            <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>63</td>
                <td>2011/07/25</td>
                <td>$170,750</td>
            </tr>
            <tr>
                <td>Ashton Cox</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td>66</td>
                <td>2009/01/12</td>
                <td>$86,000</td>
            </tr>
        </tbody>
    </table>
     -->
      
       <br/> ----------- Array table  -----------  <br/>
      
       <table id="myServerArrayTable" class="display" width="100%" cellspacing="0">
      	 <thead>
            <tr>
                <th>stuid</th>
                <th>name</th>
                <th>score</th>
                <th>birthday</th>
            </tr>
        </thead>
      </table>
      
      <br/> ----------- JSON table  -----------  <br/>
      
      <table id="myServerJsonTable" class="display" width="100%" cellspacing="0">
      	 <thead>
            <tr>
                <th>stuid</th>
                <th>name</th>
                <th>score</th>
                <th>birthday</th>
            </tr>
        </thead>
      </table>
      
  </body>
</html>
 