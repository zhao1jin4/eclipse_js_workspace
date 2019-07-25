package org.zh.layUI;


import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.json.JsonStructure;
 
@WebServlet("/layUI/queryJsonData")
public class LayUIJsonDataServlet extends PageServlet 
{
	private static final long serialVersionUID = 1L;
       
    public LayUIJsonDataServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String user=request.getParameter("user");
		String date_from=request.getParameter("date_from");
		String date_to=request.getParameter("date_to");
		String lang=request.getParameter("lang");
		
		String my_custome_param=request.getParameter("my_custome_param");
		
		String id=request.getParameter("id");
		System.out.println("收参数请求 id="+id);
		String reqPageNO=request.getParameter("page");
		String reqPageSize=request.getParameter("limit");
		long totalCount=50;//查DB
		long[] range=super.submitPage(reqPageNO, reqPageSize, totalCount, request);
		long start=range[0];
		long end=range[1];
		 
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		JsonArrayBuilder array=bf.createArrayBuilder();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		for(long i=start;i<=end;i++)
		{
			
			JsonObjectBuilder objBuilder=bf.createObjectBuilder();
			objBuilder.add("id", 100+i);
			objBuilder.add("username", "李"+i);
			objBuilder.add("language",(i%3==0)?"C":(i%2==0?"Java":"PLSQL"));
			objBuilder.add("salary",5000+i);
			objBuilder.add("isMan",i%2==0?true:false);
			objBuilder.add("birthday",format.format(new java.util.Date()));
			objBuilder.add("comment", "这是一个长文本...,这是一个长文本...,这是一个长文本...,这是一个长文本...,这是一个长文本...,这是一个长文本...,这是一个长文本...,");
			array.add(objBuilder);
			  
		} 
		JsonStructure root =bf.createObjectBuilder()
				  .add("code",0)
				  .add("msg","")
				  .add("count", totalCount)
	            .add("data",array)
	            .build();
		 
		
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Type","application/json; charset=utf-8");
		response.getWriter().write(root.toString());
		response.flushBuffer();
		//resp.getOutputStream().write(root.toString().getBytes());
		System.out.println(root.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
