package org.zh.servlet.ajax;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
 
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
@WebServlet("/xmlServlet")
public class XMLServlet extends HttpServlet
{

	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws IOException  
	{
		System.out.println("doGet");
		response.setContentType("text/xml;charset=UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		
		req.setCharacterEncoding("UTF-8");
		String username=req.getParameter("username");
		//js两次encodeURI，java一次URLDecoder.decode  (不做req.setCharacterEncoding("UTF-8"))
		//js一次encodeURI， java不用 URLDecoder.decode 做req.setCharacterEncoding("UTF-8") 
		 
		System.out.println("username:"+ username);
		System.out.println("username decode:"+URLDecoder.decode(username,"UTF-8"));

		// java Dom XML
		try {
		
			TransformerFactory tFactory = TransformerFactory.newInstance();
			System.getProperty("javax.xml.transform.TransformerFactory");// org.apache.xalan.processor.TransformerFactoryImpl
	
			Transformer transformer = tFactory.newTransformer();// new StreamSource("")可传文件,可把Stream->Source
			transformer.setOutputProperty("encoding", "UTF-8"); // OutputKeys.ENCODING
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");// 只换行不缩进
			transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");// 不要XML声明
			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "3");// 对于使用使用Xalan-J,要和indent=yes一起使用
	
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();// javax
			DocumentBuilder db = factory.newDocumentBuilder();
			Document doc = db.newDocument();// 建立
			Element root = doc.createElement("root");
			//Attr attr = doc.createAttribute("name");
			//attr.setValue("lisi");
			//root.setAttributeNode(attr);
			
			Element status = doc.createElement("status");
			status.setTextContent("OK");
			root.appendChild(status); 
			
			Element description = doc.createElement("description");
			description.setTextContent("中文");
			root.appendChild(description); 
			
			doc.appendChild(root);
	
			DOMSource source = new DOMSource(doc);// 如写Element 会丢失namespace,dom4j会保留namespace
			StreamResult stream = new StreamResult(response.getOutputStream());
			transformer.transform(source, stream);
			
//			StreamResult streamOut = new StreamResult("/tmp/file.xml");
//			transformer.transform(source, streamOut);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		/* 
		//dom4j  
		Document document = DocumentHelper.createDocument();
		
	    Element root = document.addElement("root");
	    Element status=root.addElement("status");
	    Element desc=root.addElement("description");
	    status.addText("OK");
	    desc.addText(URLEncoder.encode("中文","UTF-8"));
	   
	    //dom4j writer 1
	    System.out.println("Ajax  no <?xml  result is:"+root.asXML());
	    root.write(new OutputStreamWriter(System.out));
	    root.write(response.getWriter());
	    
	   //dom4j writer 2
	   
//	    OutputFormat xmlFormat = new OutputFormat();  
//        xmlFormat.setEncoding("UTF-8");  
//        XMLWriter xmlWriter;
//        System.out.println("Ajax have <?xml  result is:");
//        xmlWriter=new XMLWriter(System.out,xmlFormat);
//        xmlWriter.write(document); 
//        xmlWriter = new XMLWriter(response.getWriter(),xmlFormat);
//        xmlWriter.write(document);  
//        xmlWriter.close();  
       */
		
		
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("doPost");
		doGet(req,resp);
	}
}