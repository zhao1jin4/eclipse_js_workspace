<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Spinner - Time</title>


	<jsp:include page="../commonHead.jsp"/>
 
	<script>
	$.widget( "ui.timespinner", $.ui.spinner, {
		options: {
			// seconds
			step: 60 * 1000,
			// hours
			page: 60
		},

		_parse: function( value ) {
			if ( typeof value === "string" ) {
				// already a timestamp
				if ( Number( value ) == value ) {
					return Number( value );
				}
				return +Globalize.parseDate( value );
			}
			return value;
		},

		_format: function( value ) {
			return Globalize.format( new Date(value), "t" );
		}
	});

	$(function() {
		$( "#spinner" ).timespinner();

		$( "#culture" ).change(function() {
			var current = $( "#spinner" ).timespinner( "value" );
			Globalize.culture( $(this).val() );
			$( "#spinner" ).timespinner( "value", current );
		});
	});
	</script>
</head>
<body>

<p>
	<label for="spinner">Time spinner:</label>
	<input id="spinner" name="spinner" value="08:30 PM">
</p>
<p>
	<label for="culture">Select a culture to use for formatting:</label>
	<select id="culture">
		<option value="en-EN" selected="selected">English</option>
		<option value="de-DE">German</option>
	</select>
</p>

<div class="demo-description">
<p>
	A custom widget extending spinner. Use the Globalization plugin to parse and output
	a timestamp, with custom step and page options. Cursor up/down spins minutes, page up/down
	spins hours.
</p>
</div>
</body>
</html>
