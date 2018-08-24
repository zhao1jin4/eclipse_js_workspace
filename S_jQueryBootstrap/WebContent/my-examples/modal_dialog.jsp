<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>dialog 示例</title>
 
 	<jsp:include page="head.jsp"></jsp:include>
  
	
	<script type="text/javascript">
	 function showChildDialog()
	 {
		//$('#childDialog').show();
		 $('#childDialog').modal('show');
	 }
	</script>
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    

    <h1>你好，dialog</h1>
      
       <a href="#" class="add" data-toggle="modal" data-target="#addModal">新建</a>
      
         <!--新增弹窗   复制美工，自己的功能 ， tabindex="-1" 
         aria-hidden="true"表示初始是隐藏的就不用 style="display: none;"
          -->
    <div class="modal fade" id="addModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="min-width: 1000px"> <!-- 控制窗口宽度 --> 
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       				<h4 class="modal-title"  >新建e</h4>
                </div>
                <div class="modal-body" style="max-height: 500px;overflow: auto"> <!-- 控制内容滚动条，限高--> 
                    <div class="main-form-box clearfix">
                        <div class="main-form-control fl">
                            <label>姓名：</label>
                            <input type="text" name="name" onclick="showChildDialog()"  />
                        </div>
                        <div class="main-form-control fl">
                            <label>日期：</label>
                            <input type="text"   name="departTime" id="newDepartTime"/>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <a href="#"   aria-label="Close"  >确认</a>
                    <a href="#"   data-dismiss="modal" aria-label="Close">取消</a>
                    
                    <a href="#"    onclick="$('#addModal').modal('hide') ">消失</a>
      
                </div>
            </div>
        </div>
    </div>
    
    
   <!-- 子弹窗   如要dialog上再显示二级子dialog，要在 class中去fade   不用加 style="z-index:30" -->
  <div class="modal " id="childDialog"  role="dialog"   aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                   header
                </div>
                <div class="modal-body">
                     body 
                     <input type="text" value="如要在这里可以输入值，要在第一个框去 tabIndex"/>
                </div>
                <div class="modal-footer">
                    footer
                      <a href="#"    onclick="$('#childDialog').hide(); ">消失</a>
                </div>
            </div>
        </div>
    </div>
  
  <hr/> 
	
	
	
	官方示例
	
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
        	自己加的测试,子窗口 出 
        <input type="text" name="name" onclick="showOfficalChildDialog()"  />
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="officalChildDialog"  role="dialog" aria-labelledby="myModalLabel2">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel2">Modal title</h4>
      </div>
      <div class="modal-body">
        
      子窗口，弹 出
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	 function showOfficalChildDialog()
	 {
		 $('#officalChildDialog').modal('show');//不要用jqueryUI的 .show() 要用boostrap的.modal('show');
	 }
	</script>

  </body>
</html>
 