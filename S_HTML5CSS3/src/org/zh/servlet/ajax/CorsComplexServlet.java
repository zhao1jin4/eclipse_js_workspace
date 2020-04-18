package org.zh.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/corsComplex")
public class CorsComplexServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		System.out.println("doGet  not allowed..");
	}


	@Override
	protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String origin=req.getHeader("Origin");//http://localhost:8080
		String method=req.getHeader("Access-Control-Request-Method");//POST
		String headers=req.getHeader("Access-Control-Request-Headers");//content-type
		if(origin.contains("localhost") && "POST".equals(method) && headers.contains("content-type") )
		{
			resp.addHeader("Access-Control-Allow-Methods", "POST");
			resp.addHeader("Access-Control-Allow-Headers", "Content-Type");
			resp.addHeader("Access-Control-Allow-Origin", "http://localhost:8080");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		System.out.println("origin="+request.getHeader("Origin")+",feferer="+request.getHeader("Referer"));
		
		System.out.println("ContentType="+request.getContentType());
		String reqBody=MyIOUtils.readFully(request.getInputStream(),request.getContentLength());
		//解析请求json
		String name="aa";
		
		//response.addHeader("Access-Control-Allow-Origin", "*");//“*”号表示允许任何域向我们的服务端提交请求：
		//这里假127.0.0.1是远程,浏览器用localhost打开
		response.addHeader("Access-Control-Allow-Origin", "http://localhost:8080");
		 

		//response.addHeader("Access-Control-Allow-Methods", "POST,OPTIONS");
		//response.addHeader("Access-Control-Allow-Headers", "Content-Type,mycors");
		//Access-Control-Allow-Credentials,Access-Control-Max-Age
		
		response.setContentType("application/json;charset=UTF-8");
		String json="{\"name\":\"请求名为"+name+"\"}";
		System.out.println("POST resp \n"+json);
		response.getWriter().write(json);
		
	}
}
