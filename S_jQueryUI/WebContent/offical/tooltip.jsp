<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tooltip</title>

	<jsp:include page="../commonHead.jsp"/>
	
<style type="text/css">
	label {
		display: inline-block;
		width: 5em;
	}
	
	.notification {
			position: absolute;
			display: inline-block;
			font-size: 2em;
			padding: .5em;
			box-shadow: 2px 2px 5px -2px rgba(0,0,0,0.5);
		}
</style>
<script type="text/javascript">
	$(function() {
		
		//$( document ).tooltip();//所有表单 ,带title属性的做为提示信息
		//--------
		/*
		$( document ).tooltip({
			track: true//跟着鼠标动
		}); 
		*/
		//--------
		/*
		var tooltips = $( "[title]" ).tooltip();//所有带title属性的标签
		$( "<button>" )
			.text( "Show help" )
			.button()
			.click(function() {
				tooltips.tooltip( "open" );//open
			})
			.insertAfter( "form" );
		*/
		//--------
		
		$( "#show-option" ).tooltip({
			show: {
				effect: "slideDown",
				delay: 250
			}
		});
		$( "#hide-option" ).tooltip({
			hide: {
				effect: "explode",
				delay: 250
			}
		});
		$( "#open-event" ).tooltip({
			position: {
				my: "left top",//tooltip的顶端　对应#open-event　的底
				at: "left bottom"
			},
			open: function( event, ui ) {//open处理函数
				ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );//ui.tooltip.
			}
		});
		
		
		//--------
		$( document ).tooltip({
			items: "img, [data-geo], [title]",
			content: function() {//content:自定义 ,提示内容
				var element = $( this );
				if ( element.is( "[data-geo]" ) ) { //is 的使用
					var text = element.text();
					return "<img class='map' alt='" + text +
					"' src='http://maps.google.com/maps/api/staticmap?" +
					"zoom=11&size=350x350&maptype=terrain&sensor=false&center=" +
					text + "'>";
				}
				if ( element.is( "[title]" ) ) { 
					return element.attr( "title" );//attr 的使用
				}
				if ( element.is( "img" ) ) {
					return element.attr( "alt" );
				}
			}
		});
		//--------
		function notify( input ) {
			var msg = "Selected " + $.trim(  input.text() );
			$( "<div>" )
				.appendTo( document.body )
				.text( msg )
				.addClass( "notification ui-state-default ui-corner-bottom" )//ui-state-default
				.position({
					my: "center top",
					at: "center top",
					of: window
				})
				.show({
					effect: "blind"
				})
				.delay( 1000 )//delay
				.hide({
					effect: "blind",
					duration: "slow"
				}, function() {
					$( this ).remove();
				});
		}

		$( "button" ).each(function() {
			var button = $( this ).button({
				icons: {
					primary: $( this ).data( "icon" )//primary,还有secondary:
				},
				text: !!$( this ).attr( "title" )//!!的使用技巧 
			});
			button.click(function() {
				notify( button );
			});
		});
		$( ".set" ).buttonset({
			items: "button"
		});

		$( document ).tooltip({
			position: {
				my: "center top",
				at: "center bottom+5",
			},
			show: {
				duration: "fast"
			},
			hide: {
				effect: "hide"
			}
		});
		
	});
</script>
</head>
<body>

<div title="这是一个DIV的信息" style="width:200px;border: 1px dotted black;">
在Div中
</div>

<hr/>

<p>
	可跟着鼠标动
	<label for="age">Your age:</label>
	<input id="age" title="We ask for your age only for statistical purposes.">
</p>

<hr/>

<form>
	<fieldset>
		<div>
			<label for="firstname">Firstname</label>
			<input id="firstname" name="firstname" title="Please provide your firstname.">
		</div>
		<div>
			<label for="lastname">Lastname</label>
			<input id="lastname" name="lastname" title="Please provide also your lastname.">
		</div>
		<div>
			<label for="address">Address</label>
			<input id="address" name="address" title="Your home or work address.">
		</div>
	</fieldset>
</form>

<hr/>

<a id="show-option" href="#" title="slide down on show">show</a> and
<a id="hide-option" href="#" title="explode on hide">hide</a> options. 
<a id="open-event" href="#" title="move down on show">open event</a>. 

<hr/>

<div class="ui-widget photo">
	<div class="ui-widget-header ui-corner-all">
		<h2>St. Stephen's Cathedral</h2>
		<h3><a href="http://maps.google.com/maps?q=vienna,+austria&amp;z=11" data-geo>Vienna, Austria</a></h3>
	</div>
	<a href="http://en.wikipedia.org/wiki/File:Wien_Stefansdom_DSC02656.JPG">
		<img src="images/rocket.jpg" alt="St. Stephen's Cathedral" class="ui-corner-all">
	</a>
</div>
 
<hr/>

<span class="set">
		<button data-icon="ui-icon-circle-arrow-n" title="I like this">Like</button>
		<button data-icon="ui-icon-circle-arrow-s">I dislike this</button>
</span>
 
</body>
</html>