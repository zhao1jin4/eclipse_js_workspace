<%@ page language="java" contentType="text/event-stream; charset=UTF-8"  pageEncoding="UTF-8" 
%>
<%
response.addHeader("Content-Type", "text/event-stream");
response.addHeader("Cache-Control", "no-cache");
java.text.SimpleDateFormat format=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

while(true){
	String dateStr=format.format(new java.util.Date());
	String jsonStr="{'time':'"+dateStr+"'}";
	
	response.getWriter().print("event: ping\n");
	response.getWriter().print("data:"+jsonStr);
	response.getWriter().flush();
	System.out.println("data:"+jsonStr);
 	Thread.sleep(2000);
}


%>