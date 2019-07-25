package org.zh.servlet.jquery;

import java.io.IOException;
import java.io.Writer;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/jQuery/Ajax")
public class jQueryAjaxServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		Writer writer=response.getWriter();
		System.out.println("Method:"+request.getMethod());

		String username=request.getParameter("username");
		System.out.println("username:"+username); //js�� encodeURI(user),encodeURIComponent �Ͳ�����,��������
		
		String decode=URLDecoder.decode(username,"UTF-8");//js�� encodeURI(user),encodeURIComponent �Ͳ�����,��������
		System.out.println("decode_username:"+decode);
		writer.write("decode_username:"+decode);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Writer writer=response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		System.out.println("setCharacterEncoding_username:"+username); 
		
		String tomcat=new String(username.getBytes("iso8859-1"),"UTF-8"); 
		System.out.println("decode_tomcat:"+tomcat);
		writer.write("decode_tomcat:"+tomcat);
	}

}
