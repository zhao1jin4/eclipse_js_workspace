<%@ page language="java" contentType="text/event-stream; charset=UTF-8"  pageEncoding="UTF-8" 
%>
<%
response.addHeader("Content-Type", "text/event-stream");
response.addHeader("Cache-Control", "no-cache");
java.text.SimpleDateFormat format=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String str=format.format(new java.util.Date());
out.print("data:"+str);
System.out.print("data:"+str);
%>