<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Basic DateTimeBox - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
	<script type="text/javascript">
	
 /*
	$.fn.datebox.defaults.formatter = function(date){  //全部是今天的值????,不能选？？？？？？？？/
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		m=(m<10)?'0'+m:m;
		//return m+'/'+d+'/'+y;
		return y+'='+m+'='+d;
	}
	*/ 
    var buttons = $.extend([], $.fn.datebox.defaults.buttons);
    buttons.splice(1, 0, {
        text: '清除',
        handler: function(target){ 
          $(target).combo('setText',''); 
        }
    });
	</script>
</head>
<body>
    <h2>Basic DateBox</h2>
    <p>Click the calendar image on the right side.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <div style="margin-bottom:20px">
            <input class="easyui-datebox" label="Start Date:" labelPosition="top" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-datebox" label="End Date:" labelPosition="top" style="width:100%;">
        </div>
        
     <input class="easyui-datebox" label="Date With 3 Buttons:" labelPosition="top" data-options="buttons:buttons" style="width:100%;">
  
  
    </div>
    <script type="text/javascript">
		
    </script>
</body>
</html>