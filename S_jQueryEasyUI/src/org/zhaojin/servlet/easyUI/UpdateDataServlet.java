package org.zhaojin.servlet.easyUI;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;

import javax.json.Json;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

@WebServlet("/easyUI/updateData")//extension£¬myDatagrid use
public class UpdateDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateDataServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		String command= request.getParameter("command");
		if ("extensionSaveNew".equals(command) || "extensionSaveEdit".equals(command))
		{ 
			JsonObjectBuilder obj=bf.createObjectBuilder() ;
			long newId=500+(long)(400*Math.random());//500-900
			Object idVal= (request.getParameter("id")==null)?newId:request.getParameter("id");
			obj.add("id",idVal+"");
			obj.add("username", request.getParameter("username"));
			obj.add("language", request.getParameter("language"));
//			obj.add("isMan", request.getParameter("isMan"));
			obj.add("salary", request.getParameter("salary"));
			obj.add("birthday", request.getParameter("birthday"));
			obj.add("comment", request.getParameter("comment"));
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(obj.build().toString());
			System.out.println(obj.build().toString());
			return ;
		}
		String strId=request.getParameter("id");
		String username= request.getParameter("username");
		String language= request.getParameter("language");
		System.out.println(command+":"+strId+":"+username+":"+language);
		
		JsonObjectBuilder root=bf.createObjectBuilder() ;
		root.add("statusCode", 200);
		root.add("statusMessage","³É¹¦");
		
		if("save".equals(command) )
		{
			long newId=500+(long)(400*Math.random());//500-900
			root.add("additionObject",newId);
		}
		System.out.println(root.build().toString());
		response.getWriter().write(root.build().toString());
	}

}
