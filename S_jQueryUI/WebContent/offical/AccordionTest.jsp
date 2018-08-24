<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<jsp:include page="../commonHead.jsp"/>
	
<script>
	$(function() {
		//$( "#accordion" ).accordion();//是div,子级有多个 <hx>和<div>
		
		var icons = {
			header: "ui-icon-circle-arrow-e", //east 
			activeHeader: "ui-icon-circle-arrow-s" //south
			};
		$( "#accordion" ).accordion({
			icons: icons //加图标
		});
		
		
		//-----------------
		$(function() {
			$( "#accordion1" ).accordion({
				heightStyle: "fill"
			});
		});
		$(function() {
			$( "#accordion-resizer" ).resizable({ //可变大小的
				minHeight: 140,
				minWidth: 200,
				resize: function() {
					$( "#accordion1" ).accordion( "refresh" );
				}
			});
		});
		//-----------------
			
	});
</script>
</head>
<body>


<div id="accordion">
	<h3><a href="#">Section 1</a></h3>
	<div>
		<p>
		Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
		ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
		amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
		odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
		</p>
	</div>
	<h3><a href="#">Section 2</a></h3>
	<div>
		<p>
		Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
		purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
		velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
		suscipit faucibus urna.
		</p>
	</div>
</div>



<style>
#accordion-resizer {
	padding: 10px;
	width: 350px;
	height: 220px;
}
</style>
<div id="accordion-resizer" class="ui-widget-content"> <!-- class="ui-widget-content" 样式 -->
	<div id="accordion1">
		<h3>Section 1</h3>
		<div>
			<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
		</div>
		<h3>Section 3</h3>
		<div>
			<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui. </p>
			<ul>
				<li>List item one</li>
				<li>List item two</li>
				<li>List item three</li>
			</ul>
		</div>
	</div>
</div>
 
 
 
 
 
 
 
 
 
 
 

</body>
</html>
 
