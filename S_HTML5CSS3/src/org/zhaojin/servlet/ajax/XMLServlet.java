package org.zhaojin.servlet.ajax;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
@WebServlet("/xmlServlet")
public class XMLServlet extends HttpServlet
{

	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException
	{
		
		System.out.println("doGet");
		
		String username=req.getParameter("username");
		System.out.println("username:"+URLDecoder.decode(username,"UTF-8"));
			
		Document document = DocumentHelper.createDocument();
	    Element root = document.addElement("root");
	    Element status=root.addElement("status");
	    Element desc=root.addElement("description");
	    status.addText("OK");
	    desc.addText(URLEncoder.encode("中文","UTF-8"));
	    
	    response.setContentType("text/xml;charset=UTF-8"); 
	    
	   System.out.println("Ajax  no <?xml  result is:"+root.asXML());
	    root.write(new OutputStreamWriter(System.out));
	    root.write(response.getWriter());
	  
	    
	    /*
	    OutputFormat xmlFormat = new OutputFormat();  
        xmlFormat.setEncoding("UTF-8");  
        XMLWriter xmlWriter;
        System.out.println("Ajax have <?xml  result is:");
        xmlWriter=new XMLWriter(System.out,xmlFormat);
        xmlWriter.write(document); 
        xmlWriter = new XMLWriter(response.getWriter(),xmlFormat);
        xmlWriter.write(document);  
        xmlWriter.close();  
        */ 
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("doPost");
		doGet(req,resp);
	}
}