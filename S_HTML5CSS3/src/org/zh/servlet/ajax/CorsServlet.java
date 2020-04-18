package org.zh.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cors")
public class CorsServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		System.out.println("doGet  not allowed..");
 
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
		
		//Cookie可以包含在请求中，一起发给服务器,默认情况下，Cookie不包括在CORS请求之中
		//必须在AJAX请求中打开withCredentials属性。var xhr = new XMLHttpRequest(); xhr.withCredentials = true;
		//如果要发送Cookie，Access-Control-Allow-Origin就不能设为星号
		//response.addHeader("Access-Control-Allow-Credentials", "true");
		
		
		//XMLHttpRequest对象的getResponseHeader()方法只能拿到6个基本字段：Cache-Control、Content-Language、Content-Type、Expires、Last-Modified、Pragma
		//如果想拿到其他字段，就必须在Access-Control-Expose-Headers里面指定
		//response.addHeader("Access-Control-Expose-Headers", "FooBar");
		
		
		response.setContentType("application/json;charset=UTF-8");
		String json="{\"name\":\"请求名为"+name+"\"}";
		System.out.println("POST resp \n"+json);
		response.getWriter().write(json);
		
	}
}
