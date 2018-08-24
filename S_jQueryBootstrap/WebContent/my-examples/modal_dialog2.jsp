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
  
	 
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    
 
  <hr/>
  另一个版本 同事的版本,未测试好，有tabIndex="-1" 也可以
  
  <script>

  function siteShow(siteSource){
	  
	  //$("#siteSource").val(siteSource);
      $("#myModalSite").show();//子窗口可以
      //$("#myModalSite").modal('show');//子窗口不行
  }

  
  </script>
  
   <a class="add" data-toggle="modal" data-target="#myModalRouteInfo"   ><b></b>新增</a>
  
  <!--新增弹框-->
    <div class="modal fade in " id="myModalRouteInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
        <form id="myModalRouteCodeInfoForm" action="">
        <div class="modal-dialog add-modal-dialog">
            <div class="modal-content add-modal" style="min-width: 1000px">
                <div class="modal-header">
                	<input type="hidden" id="lineId" name="lineId">
                	<input type="hidden" id="prevSite" name="prevSite">
                    <p class="modal-title">基本信息</p>
                    <a class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" onclick="validationHide('#myModalRouteCodeInfoForm')"></span>
                    </a>
                </div>
                <div class="modal-body " style="max-height: 500px;overflow: auto">
                    <div class="  clearfix">
                        <div  >
                            <label for="wayStationadd" required>途径场站:</label>
                            <input type="text" id="wayStationadd"  class="validate[required]" readonly>
                            <i class="search" onclick="siteShow(1)" data-toggle="modal" data-target="#myModalSite">显示子框</i></input>
                        </div>
                        <div  >
                            <label for="transforModal" required>运输方式:</label>
                            <select name="" id="transforModal" class="validate[required]" >
                                <option value="汽运">汽运</option>
                                <option value="航空">航空</option>
								<option value="水运">水运</option>
                                <option value="铁运">铁运</option>
                            </select>
                        </div>
                        <div class="form-control fl">
                            <label for="bindLine">关联车线:</label>
                            <input type="text" id="bindLine" readonly><i class="search" onclick="lineShow(2)" ></i></input>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="selRowNum" />
                <input type="hidden" id="appendlRowNum" />
                <div class="modal-footer">
                    <a href="#" class="save" id="saveWays">确定</a>
                    <a href="#" class="empty" data-dismiss="modal" onclick=" $('#myModalRouteInfo').modal('show') ">取消</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
        </form>
    </div>
    
    
    
    
    <div class="modal fade in" data-backdrop="static" id="myModalSite"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
	    <div class="modal-dialog add-modal-dialog"  style="width:700px;">
	    	<div class="modal-content add-modal" >
		<div class="modal-header">
           <p class="modal-title">
                        下属网点查询</p>
			<input type="hidden" id="siteSource" name="siteSource">
            <a class="close" data-dismiss="modal" aria-label="Close" id="btnSiteClose" >
                <span aria-hidden="true" style="left:680px;"></span>
            </a>
        </div>
		
		<div class="modal-body form-box">
			<div class="form-box clearfix">
			<div class="form-box clearfix">
				<div class="form-control fl">
					<label for="site">关键字</label>
					<input type="text" id="siteStr" name="siteStr">
					<input type="hidden" id="siteCode" name="siteCode" value="${siteCode}"/>
					<img id="siteSearch" alt="查询" src=" ${pageContext.request.contextPath}/img/search.png" style="cursor: pointer;">
				</div>
	              
	            <div class="modal-footer">
                    <a href="#" class="diaConfirm" id="btnSite">确定</a>
                     <a href="#" class="diaConfirm" onclick="$('#myModalSite').modal('hide') " >关闭</a>
                    
                </div>
			</div>
			
			<!-- 绘制明细表格 -->
			<div class="table-box2" id="siteDiv" style="height:300px;overflow-y:scroll;overflow-x:hidden;">
				<table  id="siteGrid">
					
				</table>
			</div>  
		</div>
		</div>
	</div>
	    </div>
	</div>
	
	
  </body>
</html>
 