<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Position - Image Cycler</title>

	
	<jsp:include page="../commonHead.jsp"/>
	
	<style>
	body {
		margin: 0;
	}
	#container {
		overflow: hidden;
		position: relative;
		height: 400px;
	}

	img {
		position: absolute;
	}
	</style>
	<script>
	$(function() {
		// TODO refactor into a widget and get rid of these plugin methods
		$.fn.left = function( using ) {
			return this.position({
				my: "right middle",
				at: "left+25 middle",
				of: "#container",
				collision: "none",
				using: using
			});
		};
		$.fn.right = function( using ) {
			return this.position({
				my: "left middle",
				at: "right-25 middle",
				of: "#container",
				collision: "none",
				using: using
			});
		};
		$.fn.center = function( using ) {
			return this.position({
				my: "center middle",
				at: "center middle",
				of: "#container",
				using: using
			});
		};

		$( "img:eq(0)" ).left();
		$( "img:eq(1)" ).center();
		$( "img:eq(2)" ).right();

		function animate( to ) {
			$( this ).stop( true, false ).animate( to );
		}
		function next( event ) {
			event.preventDefault();
			$( "img:eq(2)" ).center( animate );
			$( "img:eq(1)" ).left( animate )
			$( "img:eq(0)" ).right().appendTo( "#container" );
		}
		function previous( event ) {
			event.preventDefault();
			$( "img:eq(0)" ).center( animate );
			$( "img:eq(1)" ).right( animate );
			$( "img:eq(2)" ).left().prependTo( "#container" );
		}
		$( "#previous" ).click( previous );
		$( "#next" ).click( next );

		$( "img" ).click(function( event ) {
			$( "img" ).index( this ) === 0 ? previous( event ) : next( event );
		});

		$( window ).resize(function() {
			$( "img:eq(0)" ).left( animate );
			$( "img:eq(1)" ).center( animate );
			$( "img:eq(2)" ).right( animate );
		});
	});
	</script>
</head>
<body>

<div id="container">
	<img src="images/earth.jpg" width="458" height="308" alt="earth">
	<img src="images/flight.jpg" width="512" height="307" alt="flight">
	<img src="images/rocket.jpg" width="300" height="353" alt="rocket">

	<a id="previous" href="#">Previous</a>
	<a id="next" href="#">Next</a>
</div>

<div class="demo-description">
<p>A photoviewer prototype using Position to place images at the center, left and right and cycle them.
<br>Use the links at the top to cycle, or click on the images on the left and right.
<br>Note how the images are repositioned when resizing the window.
</div>
</body>
</html>
