<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.net.URLDecoder"%>
<%
	System.out.println("Method:"+request.getMethod());

	String username=request.getParameter("username");
	
	
	System.out.println("noDecode_username:"+username);
	out.println("noDecode_username:"+username);
	
	String decode=URLDecoder.decode(username,"UTF-8");//js端两次encodeURI(encodeURI(user)),tomcat端一次URLDecoder.decode(username,"UTF-8");
	
	System.out.println("decode_username:"+decode);
	out.println("decode_username:"+decode);
	
	
	
	String tomcat=new String(username.getBytes("iso8859-1"),"UTF-8");//OK,js不编码,tomcat 要 new String(username.getBytes("iso8859-1"),"UTF-8");
	System.out.println("decode_tomcat:"+tomcat);
	out.println("decode_tomcat:"+tomcat);
 %>
