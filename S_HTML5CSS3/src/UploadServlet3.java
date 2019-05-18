 

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Collections;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet(urlPatterns="/uploadServlet3")
@MultipartConfig(maxFileSize=50*1024*1024) //用于支持文件上传 enctype="multipart/form-data"
public class UploadServlet3 extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("UploadServlet3 in doGet");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		System.out.println(req.getParameter("title"));
		
		Collection<Part> parts=req.getParts();//包括表单参数 <input type="file" multiple />
		//Part file1=req.getPart("attache1");//是<input type=file name="attache1"
		for(Part file1:parts) 
		{
			String name=file1.getName();//attache1 
			String fname=file1.getSubmittedFileName();
			if(fname==null)//表单域
				continue;
			
			
	//		Collection headers=file1.getHeaderNames();
	//		System.out.println(headers);
			String pairs=file1.getHeader("content-disposition");
	//		System.out.println(pairs);
			
			//form-data; name="attache1"; filename="中文测试.txt"  
			//form-data; name="attache2"; filename=""
			String nameHeader="filename=";
			String path=pairs.substring(pairs.indexOf(nameHeader)+nameHeader.length()+1,pairs.lastIndexOf("\""));
			if(!"".equals(path))
			{
				String filename=path.substring(path.lastIndexOf("\\")+1);//只IE是带C:\,和req.setCharacterEncoding("UTF-8")中文 OK
			//	file1.write("d:/temp/"+filename);//一个Part要调用一次write
				
				FileOutputStream output=new FileOutputStream("/tmp/"+filename);
				InputStream input = file1.getInputStream();
				byte[] buffer=new byte[1024];
				int len=0;
				while((len=input.read(buffer))!=-1 )
				{
					output.write(buffer,0,len);
				}
				output.close();
				input.close();
			}
			
			String type=file1.getContentType();
			long  size=file1.getSize();  
		}
		resp.setCharacterEncoding("utf-8");
		//resp.setContentType("text/plain");
		//resp.getWriter().println(name + "上传成功");
		resp.setContentType("application/json");
		resp.getWriter().println( "{\"resp\":\"上传成功\"}");
	}

}
