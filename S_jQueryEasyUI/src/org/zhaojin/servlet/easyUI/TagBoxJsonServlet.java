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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.zhaojin.servlet.PageServlet;

/**
 * 也为tagbox选人组件用 
 *
 */
@WebServlet("/easyUI/tagBoxJson")
public class TagBoxJsonServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String searchName=request.getParameter("input");
		System.out.println("input="+searchName);  
		
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		JsonArrayBuilder array=bf.createArrayBuilder();
		for(long i=1;i<=3;i++)
		{
			JsonObjectBuilder obj=bf.createObjectBuilder() ;
			obj.add("id", searchName.hashCode()+i);
			obj.add("text",searchName+i);
			array.add(obj);
		} 
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		System.out.println(array.build().toString());
		response.getWriter().write(array.build().toString());
		 
	 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
