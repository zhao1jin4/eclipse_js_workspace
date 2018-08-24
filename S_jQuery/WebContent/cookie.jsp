<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie plugin </title>
 
<jsp:include page="commonHead.jsp"/>

<script type="text/javascript" src="js/jquery.cookie.js"></script>
	
<script>
 
function getCookieUser()
{
	 var username=$.cookie('username');
	 alert(username);
}

//---------------------
function getCookie(c_name)
{
if (document.cookie.length>0)
{
  c_start=document.cookie.indexOf(c_name + "=")
  if (c_start!=-1)
    { 
	    c_start=c_start + c_name.length+1 
	    c_end=document.cookie.indexOf(";",c_start)
	    if (c_end==-1) 
	    	c_end=document.cookie.length
	    return unescape(document.cookie.substring(c_start,c_end))
    } 
  }
	return ""
}

function setCookie(c_name,value,expiredays)
{
	var exdate=new Date()
	exdate.setDate(exdate.getDate()+expiredays)
	document.cookie=c_name+ "=" +escape(value)+
					((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}

function checkCookie()
{
	username=getCookie('username')
	if (username!=null && username!="")
  	{
		alert('Welcome again '+username+'!');
	}
	else 
	{
		 username=prompt('Please enter your name:',"")
		 if (username!=null && username!="")
		 {
		 	setCookie('username',username,365)
		 }
	}
}
</script>
 
</head>
<body> 
https://plugins.jquery.com/cookie/
<br/>
1.4.1
<br/>


<input type="button" value="JS 检查cookie" onclick="checkCookie()"/><br/>
 
  
<input type="button" value="jQuery显示cookie" onclick="getCookieUser()"/>
 

<body  >
</body>
  
</html>