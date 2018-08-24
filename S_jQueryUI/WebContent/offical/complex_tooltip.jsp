<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<jsp:include page="../commonHead.jsp"/>
 
<script type="text/javascript">
$(function() {
	
	$( document ).tooltip({
		position: {
			my: "center bottom-20",
			at: "center top",
			using: function( position, feedback ) {
				$( this ).css( position );
				$( "<div>" )
					.addClass( "arrow" )
					.addClass( feedback.vertical )
					.addClass( feedback.horizontal )
					.appendTo( this );
			}
		}
	});
	
});
</script>
<style>
	.ui-tooltip, .arrow:after {
		background: grey;
		border: 2px solid green;
	}
	.ui-tooltip {
		padding: 10px 20px;
		color: red;/* 文字颜色*/
		border-radius: 20px;/*圆角*/
		font: bold 14px "Helvetica Neue", Sans-Serif;
		text-transform: uppercase;/*字母变大写*/
	 	box-shadow: 0 0 7px yellow;/*加阴影*/
	}
	.arrow {
		width: 70px;/*容器大小*/
		height: 16px;
		border: 1px dotted red;
		overflow: hidden;/*隐藏多于部分*/
		position: absolute;
		bottom: -16px; /* 向下移一点*/
		left: 50%;/*水平居中*/
		margin-left: -35px; /*向左一些 */
	}
	
	/* 在DIV后加一方块元素,旋转45度,是一个倒三角形 ,在IE8中不行的 */
	.arrow:after {
		content: "3";
		position: absolute;
		/*旋转方块只要下半部分 */
		left: 20px;
		top: -20px;
		border: 1px dotted orange;
		
		width: 25px;/* 旋转方块的大小 */
		height: 25px;
		
		box-shadow: 6px 5px 9px -9px black;
		-webkit-transform: rotate(45deg);
		-moz-transform: rotate(45deg);
		-ms-transform: rotate(45deg);
		-o-transform: rotate(45deg);
		tranform: rotate(45deg);
	}
	
	/* 没用
	.arrow.top {
		top: -16px;
		bottom: auto;
	}
	.arrow.left {
		left: 20%;
	}
	.arrow.top:after {
		bottom: -20px;
		top: auto;
	}
	*/
	</style>
</head>
<body>


<div style="height:200px;">增加空间</div>
<span >增加空间          ---------</span>

<label for="age">Your age:</label>
<input id="age" title="We ask for your age only for statistical purposes.">



</body>
</html>