package org.zh.servlet.jqueryui;

import java.io.IOException;
import java.net.URLEncoder;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

@WebServlet("/queryLanguage_JSON")
public class AutocompleteServlet  extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("application/json; charset=utf-8");//���������������
		
		
		String startStr=req.getParameter("myStartWith");
		System.out.println("startStr="+startStr);
		
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		JsonArrayBuilder array=bf.createArrayBuilder();
	
		if(startStr==null || "".equals(startStr))//��ʱ�ã���
		{
			JsonObjectBuilder obj=bf.createObjectBuilder() ;
			obj.add("value", "JavaScript");
			obj.add("label","JavaScrip���� ");
			array.add(obj);
			
			JsonObjectBuilder obj1=bf.createObjectBuilder() ;
			obj1.add("value", "java");
			obj1.add("label", "Java����");
			array.add(obj1);
			
			JsonObjectBuilder obj2=bf.createObjectBuilder() ;
			obj2.add("value", "ObjectiveC");
			obj2.add("label", "ObjectiveC ����");
			array.add(obj2);
			
			JsonObjectBuilder obj3=bf.createObjectBuilder() ;
			obj3.add("value", "c");
			obj3.add("label",URLEncoder.encode("C����","UTF-8"));
			array.add(obj3);
			
		}else if(startStr.toLowerCase().startsWith("j"))
		{
			JsonObjectBuilder obj=bf.createObjectBuilder() ;
			obj.add("value", "JavaScript");
			obj.add("label","JavaScrip���� ");
			array.add(obj);
			
			JsonObjectBuilder obj1=bf.createObjectBuilder() ;
			obj1.add("value", "java");
			obj1.add("label", "Java����");
			array.add(obj1);
			
		}else if(startStr.toLowerCase().startsWith("o"))
		{
			JsonObjectBuilder obj2=bf.createObjectBuilder() ;
			obj2.add("value", "ObjectiveC");
			obj2.add("label", "ObjectiveC ����");
			array.add(obj2);
		}else if(startStr.toLowerCase().startsWith("c"))
		{
			JsonObjectBuilder obj3=bf.createObjectBuilder() ;
			obj3.add("value", "c");
			obj3.add("label",URLEncoder.encode("C����","UTF-8"));
			array.add(obj3);
		}
		
		
		
		//resp.getOutputStream().write(array.toString().getBytes());
		resp.getWriter().write(array.build().toString());
		System.out.println(array.build().toString());
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doGet(req,resp);
	}
}
