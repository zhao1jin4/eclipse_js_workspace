package org.zh.servlet.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/jsonPost")
public class JSonPostServlet extends HttpServlet
{
 
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		 //"Content-Type": "application/json", 服务端request拿不到数据  ,"application/x-www-form-urlencoded"也不行？？？？
		System.out.println("name:"+request.getParameter("name")); 
		System.out.println("answer:"+request.getParameter("answer"));
		 
		InputStream input=request.getInputStream();
		 BufferedReader reader =new BufferedReader(new InputStreamReader(input));
		String line=null;
		 while((line=reader.readLine())!=null)
		{
			System.out.println(line);
		}
		response.setContentType("application/json;charset=UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"agePost\":20}");
	}
}
