<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title> model dialog </title>

	<jsp:include page="../commonHead.jsp"/>
	
	
<script>
	$(function() {
		$( "#dialog" ).dialog({
			height: 140,
			//modal: true,//背景变化 
			autoOpen: false,//只对.dialog( "open" );方式打开有效
			show: {
				effect: "blind",
				duration: 1000
			},
			hide: {
				effect: "explode",
				duration: 1000
			}
		});

		$( "#opener" ).click(function() {
			$( "#dialog" ).dialog( "open" );
		});
		//--------
		$( "#dialog-confirm" ).dialog({
			resizable: true,
			height:220,
			width:520,
			modal: true,
			buttons: {
				"Delete all items": function() {
					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			}
		});
		//---------
		$( "#create-user" )
		.button()
		.click(function() {
			$( "#dialog-form" ).dialog( "open" );
		});
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
				"Create an account": function() {
					$( "#user_name" ).addClass( "ui-state-error" );//红边和底
					$( ".validateTips" ).addClass( "ui-state-highlight" );//黄边和底
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				$( "#user_name" ).removeClass( "ui-state-error" );
			}
		});
		
	});
	
	</script>
</head>
<body>

	<div id="dialog" title="Basic dialog">
		<p>This is an animated dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
	</div>
	
	<button id="opener">Open Dialog</button>



	<div id="dialog-confirm" title="Empty the recycle bin?">
		<p> <span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
			<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
			These items will be permanently deleted and cannot be recovered. Are you sure?
		</p>
	</div>
	
	

	<div id="dialog-form" title="Create new user">
		<p class="validateTips">All form fields are required.</p>
		<fieldset>
			<label for="name">Name</label>
			<input type="text" name="name" id="user_name" class="text ui-widget-content ui-corner-all" />
		</fieldset>
	</div>
	
	<table class="ui-widget ui-widget-content">
		<thead>
			<tr class="ui-widget-header ">
				<th>Name</th>
				<th>Password</th>
			</tr>
		</thead>
	</table>
	<button id="create-user">Create new user</button>
	
	
</body>
</html>



