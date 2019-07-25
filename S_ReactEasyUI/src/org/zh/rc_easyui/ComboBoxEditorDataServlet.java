package org.zh.rc_easyui;

import java.io.IOException;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/easyUI/comboBoxEditor")
public class ComboBoxEditorDataServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("doGet");
		System.out.println("ContentType="+request.getContentType());
		System.out.println("name="+request.getParameter("name"));
		System.out.println("value="+request.getParameter("value"));
		
		
  		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		JsonArrayBuilder array=bf.createArrayBuilder();
		 
		JsonObjectBuilder basketball=bf.createObjectBuilder() ;
		basketball.add("value", "B");
		basketball.add("name","蓝球");
		array.add(basketball);
		 
		JsonObjectBuilder football=bf.createObjectBuilder() ;
		football.add("value", "F");
		football.add("name","足球");
		array.add(football);
		
		//response.setCharacterEncoding("GBK");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(array.build().toString());
	 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		
		doGet(request,response);
	}

}
