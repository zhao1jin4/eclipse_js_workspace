package org.zh.servlet.jquery;

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
 
@WebServlet("/jQueryAjaxJsonList")
public class jQueryAjaxJsonListServlet extends HttpServlet
{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
			System.out.println("one="+req.getParameter("one"));
			
			JsonBuilderFactory bf = Json.createBuilderFactory(null); 
			JsonArrayBuilder array=bf.createArrayBuilder();
			JsonObjectBuilder obj=bf.createObjectBuilder() ; 
			//obj.add("username",URLEncoder.encode("李","UTF-8"));
			obj.add("username","李");
			array.add(obj);
			
			JsonObjectBuilder obj1=bf.createObjectBuilder() ;  
			obj1.add("username",true);
			array.add(obj1);
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write(array.build().toString());
			System.out.println(array.build().toString());
			
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("doPost");
		doGet(req,resp);
	
	}

}