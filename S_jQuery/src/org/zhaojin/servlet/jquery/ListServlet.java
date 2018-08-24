package org.zhaojin.servlet.jquery;

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
 
@WebServlet("/listServlet")
public class ListServlet extends HttpServlet
{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
			System.out.println("doGet");
			System.out.println(new String(req.getParameter("one").getBytes("iso8859-1"),"UTF-8"));
			
			
			/*
			User u=new User();
			u.setUsername("lisi");
			u.setPassword("123");
			
			User u1=new User();
			u1.setUsername("wang");//chinese ERROR!!
			u1.setPassword("abc");
			
			List l=new ArrayList();
			l.add(u);
			l.add(u1);
			
			resp.getOutputStream().write(l.toString().getBytes());
			*/
			
			JsonBuilderFactory bf = Json.createBuilderFactory(null); 
			JsonArrayBuilder array=bf.createArrayBuilder();
			JsonObjectBuilder obj=bf.createObjectBuilder() ; 
			obj.add("id", 100);
			obj.add("username",URLEncoder.encode("¿Ó","UTF-8"));
			obj.add("password", 123);
			array.add(obj);
			
			JsonObjectBuilder obj1=bf.createObjectBuilder() ;  
			obj1.add("id", 101);
			obj1.add("username",true);
			obj1.add("password", 123);
			array.add(obj1);
			
			//resp.getOutputStream().write(array.toString().getBytes());
			resp.getWriter().write(array.build().toString());
			System.out.println(array.build().toString());
			
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("doPost");
		doGet(req,resp);
	
	}

}