package org.zh.servlet.ajax;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * 服务端代理方式，处理跨域 
 *
 */
//@WebFilter(urlPatterns = {"/cors"})//如果为/*，还要过虑静态内容，*.do好很多
//@WebFilter(urlPatterns = {"/*"})
public class CorsFilter implements Filter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException
	{
		try
		{
			String protol=req.getProtocol();
			System.out.println("protol为:"+protol);//HTTP/1.1
			/*
			对于拦截所有请求的*
			String contentType=req.getContentType();
			if(contentType==null || !contentType.contains("application/json"))
				//application/x-www-form-urlencoded 
				//multipart/form-data
				//Get请求就不行了
			{
				chain.doFilter(req, resp);
				return;
			}
			*/
			
			HttpServletRequest httpReq= (HttpServletRequest)req;
			String url=httpReq.getRequestURI();// /S_HTML5CSS3/cors
			String remotePrefix="http://127.0.0.1:8080";
			/* 
			//对于拦截所有请求的*   根据请求context转发
			if("/".equals(url))//对于部署在ROOT目录下
			{
				chain.doFilter(req, resp);
				return;
			}
			StringTokenizer tokenizer=new StringTokenizer(url,"/");
			String context=tokenizer.nextToken();//  值为 S_HTML5CSS3 
			if("S_HTML5CSS3".equals(context))
			{
				remotePrefix="http://127.0.0.1:8080";
				url=url.replace("/S_HTML5CSS3/","/");
			}
			*/
		
			String mycors=httpReq.getHeader("mycors");
			if("frontend".equals(mycors))
			{
				String requestBody=MyIOUtils.readFully(req.getInputStream(),req.getContentLength());
				String log=String.format("代理请求URL=%s,Method=%s,ContentType=%s,收到Body为%s",  httpReq.getRequestURI(),httpReq.getMethod(),req.getContentType(),requestBody);
				System.out.println(log); 
				
				
				URLConnection conn=new URL(remotePrefix+url).openConnection();
			 
				//conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				conn.setRequestProperty("Content-Type", req.getContentType());
				
				//conn.setReadTimeout(10000);//设置读取超时时间          
				//conn.setConnectTimeout(10000);//设置连接超时时间    
				
				HttpURLConnection httpConn=(HttpURLConnection)conn;
				httpConn.setRequestMethod(httpReq.getMethod()); 
				conn.setDoOutput(true);//如要先写要调用这个
				OutputStream out = conn.getOutputStream();
				if(requestBody!=null)
				{
					out.write(requestBody.getBytes(Charset.forName("UTF-8")));
				}
				out.close();
				
				conn.connect();    
			    long  code = httpConn.getResponseCode();//这里才真正的发起请求
	            if(code!=200)
	            {
	            	log=String.format("代理响应URL=%s 返回错误码:%s",  httpReq.getRequestURI(),code);
	            	System.err.println(log);
	            	resp.getWriter().write(httpReq.getRequestURI()+",return code:"+code);
	            }
	            else
	            {
	    			String connetResBody=MyIOUtils.readFully(conn.getInputStream());// conn.getContentLength() 是-1
	    			log=String.format("代理响应URL=%s 返回Body为:%s",  httpReq.getRequestURI(),connetResBody);
	    			System.out.println(log);
	    			resp.getWriter().write(connetResBody);
	            }
			}else
			{
				chain.doFilter(req, resp);
			}
		
		}catch(Exception e)
		{
			e.printStackTrace();
			throw  e;
		}
	}

}
