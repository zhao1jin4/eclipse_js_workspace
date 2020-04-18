package org.zh.servlet.ajax;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/jsonGet")
public class JSonGetServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		//request.getReader();
		
		InputStream  input=request.getInputStream();
		byte[] res=new byte[1024];
		int readed=input.read(res);
		input.close();
		System.out.println("收到请求体为:"+new String(res,0,readed,Charset.forName("UTF-8")));
	
		response.setContentType("application/json;charset=UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"age\":20}");
	}
}
