package org.zh.servlet.jquery;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
@WebServlet("/jQuery/crossDomainJsonp")
public class CrossDomainJsonpServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String callback=request.getParameter("callback");//flightHandler
		System.out.println("callback="+callback); 
		String flight=request.getParameter("flight");
		System.out.println("flight="+flight); 
  
		//页面中jsonpCallback:flightHandler
		String strFunc=callback+
		"({ code: '"+flight+
		 "',  price: 1780,"+
		"    tickets: 5"+
		"});";
		response.getWriter().write(strFunc);  //要服务端为jquery定制的返回是不行的
	 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

}
