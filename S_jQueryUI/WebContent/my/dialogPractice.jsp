<%@page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <jsp:include page="../commonHead.jsp"/> 

<style type="text/css">
/*
	#man_selectable .ui-selecting { background: #FECA40; }
	#man_selectable .ui-selected { background: #F39814; color: white; }
	#man_selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
	.my{ background: #F39814; color: white;  }
*/	
</style>

<script type="text/javascript">
		
var tempManChoose="";
	$(function() 
	{
		$("#man_selectable").selectable	(
		{
			stop: function()
			{
				$(".ui-selected", this).each(function()
				{
					var index = $("#man_selectable li").index(this);
					var val =  $("#man_selectable li").get(index).value;
					tempManChoose=+val+",";
				});
			}
		});
	});

var chooseInputs=$("#manuID");//hidden,split by ,
var allMan="";
function doQueryManu()
{
try
{
	 var divManu= $("#manuList");
	 divManu.css("display",'');
	  $("#dialog").dialog("destroy");
	  divManu.dialog({ draggable: true,
				modal: true,
				width:400,
				height:300,
	    		buttons: 
	    		{
					'提交': function() 
					{
						//save choose
						chooseInputs.value=tempManChoose;
						tempManChoose="";
						$(this).dialog('close');
					},
					'全选':  function() 
						{
							//choose ALL
							chooseInputs.value=allMan;
							
							ul.empty();
							$(allMan).each(function(i)
							{
								ul.append("<li id='man_li_"+i+"' class='ui-widget-content'  value='"+allMan[i].id+">sel|"+decodeURI(allMan[i].username)+"</li>");
								//$(ul.children(i)).trigger('click'); //如何选中呢???
								//ul.children(i).trigger('click');
								alert($("#man_li_"+i).value);//undefined?????
								$("#man_li_"+i).trigger('click');
							});
						},
					'取消': function() 
					{
						$(this).dialog('close');
					}
				}		
	     	});
	    
	
	
	var ul=$("#man_selectable");
	if(chooseInputs.value == undefined )//not appear value in <hidden>,first time is undefined 
	{
		chooseInputs.value ="";

		var  root="/S_jQueryUI";
		$.ajax({
			//async:false,
		   type: "POST",
		   url:root+"/modelDailogDataServlet",
		   dataType:"json",
		//	data: "method=dojQueryManu",
		  	success: function(allMan)
		   	{
				$(allMan).each(function(i)
				{
					ul.append('<li class="ui-widget-content" value='+allMan[i].id+'> '+decodeURI(allMan[i].username)+'</li>');
				});
		  	},error:function(e){
				alert(e.responseText) 
			} 
		});
		/*
		allMan=[
		         {id:100,username: encodeURI("张三")},
				 {id:101,username: "Frank"}
				];
		*/
	}else if(chooseInputs.value=="-1")
	{
		chooseInputs.value=allMan;
	}else
	{
		ul.empty();
		$(allMan).each(function(i)
			{
				var isSelect=false;
				chooseInputs.each(function(j)
				{
					if(chooseInputs[j]==allMan[j])
					{
						ul.append("<li class='ui-widget-content' value='"+allMan[i].id+">sel|"+decodeURI(allMan[i].username)+"</li>");
						//如何选中呢???
						
						isSelect=true;
						return false;
					}	
				});
				if(!isSelect)
					ul.append('<li class="ui-widget-content" value='+allMan[i].id+'> '+decodeURI(allMan[i].username)+'</li>');
			});
	}
//	divManu.dialog('open');
}catch(e)
{
	alert('ERROR IS:'+e);
}	
}			


	
	</script>
</head>
<body>
	<input type="hidden" id="manuID"/>
	<input type="button" value="showModelDialog" id="dlg" onclick="doQueryManu();"/>
	<div  id="manuList" title ="create" >
		<ul id="man_selectable">
			<li class="ui-widget-content" value='xxx'> yyy</li>
		</ul>
	</div>
	
</body>
</html>



