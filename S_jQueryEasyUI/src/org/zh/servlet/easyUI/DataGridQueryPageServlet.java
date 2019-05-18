package org.zh.servlet.easyUI;

import java.io.IOException;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonBuilderFactory;
import javax.json.JsonStructure;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zh.servlet.PageServlet;

@WebServlet("/easyUI/queryPage")
public class DataGridQueryPageServlet extends PageServlet 
{
	private static final long serialVersionUID = 1L;
       
    public DataGridQueryPageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if("init".equals(request.getParameter("action") ))
		{
			super.initPage(request);//PAGE_SIZE, allPageSize 从服务端取
	    	
			JsonBuilderFactory bf = Json.createBuilderFactory(null); 
			JsonArray array=bf.createArrayBuilder()
				.add(bf.createObjectBuilder()
					.add("langValue", "C")
					.add("langLabel", "C 语言"))
				.add(bf.createObjectBuilder()
					.add("langValue", "Java")
					.add("langLabel", "Java 语言"))
				.add(bf.createObjectBuilder()
						.add("langValue", "Scala ")
						.add("langLabel", "Scala  语言"))
				.build();  
			request.setAttribute("myLanguages", array.toString());//服务端服其它数据
			request.getRequestDispatcher("../my/dataGrid.jsp").forward(request, response);
			return ;
		}
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
