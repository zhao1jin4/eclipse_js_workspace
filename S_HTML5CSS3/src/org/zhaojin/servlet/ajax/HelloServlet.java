package org.zhaojin.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/hello")
public class HelloServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException
	{

		doPost(arg0, arg1);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setCharacterEncoding("GBK");
		PrintWriter writer=response.getWriter();
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		writer.println("<user>");
		writer.println("<name>"+name+"</name>");
		writer.println("<password>"+password+"</password>");
		writer.println("</user>");

		//writer.println("<input type='text' siz3=20 />");
	}

}
