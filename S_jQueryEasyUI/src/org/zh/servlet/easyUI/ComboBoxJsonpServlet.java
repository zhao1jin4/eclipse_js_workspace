package org.zh.servlet.easyUI;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zh.servlet.PageServlet;

@WebServlet("/easyUI/comboBoxJsonp")
public class ComboBoxJsonpServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String searchName=request.getParameter("input");
		System.out.println("input="+searchName); 
		String callback=request.getParameter("callback");
		System.out.println("callback="+callback); 
		
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		JsonArrayBuilder array=bf.createArrayBuilder();
		for(long i=1;i<=3;i++)
		{
			JsonObjectBuilder obj=bf.createObjectBuilder() ;
			obj.add("value", 100+i);
			obj.add("name",searchName+i);
			array.add(obj);
		}
		String respStr=callback+"( "+array.build().toString() +");";
		System.out.println(respStr);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(respStr);
	 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
