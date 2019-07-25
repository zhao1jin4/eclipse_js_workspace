<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	  <title>Search Category - jQuery EasyUI Demo</title>
	<jsp:include page="../../commonHead.jsp"  />
</head>
<body>
	    <h2>Search Category</h2>
    <p>Select a category and click search button or press enter key in input box to do searching.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <input class="easyui-searchbox" data-options="prompt:'Please Input Value',menu:'#mm',searcher:doSearch" style="width:100%">
    </div>
    <div id="mm">
        <div data-options="name:'all',iconCls:'icon-ok'">All News</div>
        <div data-options="name:'sports'">Sports News</div>
    </div>
    <script>
        function doSearch(value,name){
            alert('You input: ' + value+'('+name+')');
        }
    </script>
</body>
</html>