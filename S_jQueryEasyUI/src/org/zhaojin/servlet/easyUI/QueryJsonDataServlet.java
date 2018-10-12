package org.zhaojin.servlet.easyUI;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.zhaojin.servlet.PageServlet;

@WebServlet("/easyUI/queryJsonData")
public class QueryJsonDataServlet extends PageServlet 
{
	private static final long serialVersionUID = 1L;
       
    public QueryJsonDataServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String[] selectStatus=request.getParameterValues("selectStatus[]");//收easyUI的数组
		System.out.println("easyUI  array param:"+selectStatus);
		String user=request.getParameter("user");
		String date_from=request.getParameter("date_from");
		String date_to=request.getParameter("date_to");
		String lang=request.getParameter("lang");
		
		String my_custome_param=request.getParameter("my_custome_param");
		
		String reqPageNO=request.getParameter("page");//easyUI 固定
		String reqPageSize=request.getParameter("rows");//easyUI 固定
		long totalCount=50;//查DB
		long[] range=super.submitPage(reqPageNO, reqPageSize, totalCount, request);
		long start=range[0];
		long end=range[1];
		
		
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		JsonArrayBuilder array=bf.createArrayBuilder();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		for(long i=start;i<=end;i++)
		{
			JsonObjectBuilder obj=bf.createObjectBuilder() ;
			obj.add("id", 100+i);
			obj.add("username","李"+i);
			obj.add("language",(i%3==0)?"C":(i%2==0?"Java":"PLSQL"));
			obj.add("salary",5000+i);
			obj.add("isMan",i%2==0?true:false);
			obj.add("birthday",format.format(new java.util.Date()));
			obj.add("comment", "这是一个长文本...,这是一个长文本...,这是一个长文本...,这是一个长文本...,这是一个长文本...,这是一个长文本...,这是一个长文本...,");
			array.add(obj);
		}
		JsonObjectBuilder root=bf.createObjectBuilder() ;
		root.add("rows", array);//easyUI 固定
		root.add("total",totalCount);//easyUI 固定
		
		System.out.println(root.build().toString());
		

		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(root.build().toString());
		response.flushBuffer();
//		response.getOutputStream().write(root.build().toString().getBytes());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
