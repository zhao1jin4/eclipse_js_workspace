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
 

@WebServlet("/modelDailogDataServlet")
public class ModelDailogDataServlet  extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		JsonArrayBuilder array=bf.createArrayBuilder();
		JsonObjectBuilder obj=bf.createObjectBuilder() ; 
		obj.add("id", 100);
		obj.add("username",URLEncoder.encode("����","UTF-8"));
		obj.add("password", 123);
		array.add(obj);
		JsonObjectBuilder obj1=bf.createObjectBuilder() ; 
		obj1.add("id", 101);
		obj1.add("username","Frank");
		obj1.add("password", 123);
		array.add(obj1);

		resp.setContentType("application/json;charset=UTF-8");
		//resp.getOutputStream().write(array.toString().getBytes());
		resp.getWriter().write(array.build().toString());
		System.out.println(array.build().toString());
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doGet(req,resp);
	}
}
