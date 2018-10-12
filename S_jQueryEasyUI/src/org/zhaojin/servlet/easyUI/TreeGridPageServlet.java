package org.zhaojin.servlet.easyUI;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Random;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.zhaojin.servlet.PageServlet;

@WebServlet("/easyUI/treeGridPage")
public class TreeGridPageServlet extends PageServlet 
{
	private static final long serialVersionUID = 1L;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		

//		String[] selectStatus=request.getParameterValues("selectStatus[]");//收easyUI的数组
//		System.out.println("easyUI  array param:"+selectStatus);
//		String user=request.getParameter("user");
//		String date_from=request.getParameter("date_from");
//		String date_to=request.getParameter("date_to");
//		String lang=request.getParameter("lang");
//		
//		String my_custome_param=request.getParameter("my_custome_param");
		
		String reqPageNO=request.getParameter("page");//easyUI 固定
		String reqPageSize=request.getParameter("rows");//easyUI 固定
		String id=request.getParameter("id");//easyUI 固定,展开的ID  , 并不是idField的值
		//如页面没有设置为0，初始时(没展开时)这是null
		
		long totalCount=50;//查DB
		long[] range=super.submitPage(reqPageNO, reqPageSize, totalCount, request);
		long start=range[0];
		long end=range[1];
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		if("0".equals(id)   //0是 页面中设置的（当为空时设置为0），即第一次进入页时，没有手工展开
			 ||id ==null
		)
		{
			JsonArrayBuilder array=bf.createArrayBuilder();
			for(long i=start;i<=end*10;i+=10)
			{
				JsonObjectBuilder obj=bf.createObjectBuilder() ;
				obj.add("myid", 10+i+"");
				obj.add("name","李"+i);
				obj.add("name2","张"+i);
				if(i%20==0)
				{
					obj.add("state","closed");//表示文件夹关闭，否则是普通文件，open
					
					//也有数据，得到变化 (如没有数据editor也有???还得不到数据??)
					int quantity=new Random().nextInt();
					double price=new Random().nextDouble();
					
					obj.add("quantity",quantity);
					obj.add("price",price); 
					obj.add("total",price*quantity);
				}else
				 {
					 obj.add("checked",true); //表示是否复选
					 obj.add("iconCls","icon-ok"); //图标
					int quantity=new Random().nextInt();
					double price=new Random().nextDouble();
					
					obj.add("quantity",quantity);
					obj.add("price",price); 
					obj.add("total",price*quantity);
				 }
				array.add(obj);
			}

			JsonObjectBuilder root=bf.createObjectBuilder() ;
			root.add("rows", array);//easyUI 固定
			root.add("total",totalCount);//easyUI 固定
			System.out.println(root.build().toString());

			response.getWriter().write(root.build().toString());
			response.flushBuffer();
//			response.getOutputStream().write(root.build().toString().getBytes());
		}else
		{ //展开请求
			int idVal=Integer.parseInt(id);
			JsonArrayBuilder array=bf.createArrayBuilder();
			for(long i=idVal+1;i<=idVal+5;i+=1)
			{
				JsonObjectBuilder obj=bf.createObjectBuilder() ;
				obj.add("myid", i);
				
				if(i%20==0)
					obj.add("state","closed");//表示文件夹关闭，否则是普通文件，open
				 else
					 obj.add("checked",true); //表示是否复选
				
				obj.add("name","李"+i);
				obj.add("name2","张"+i);
				int quantity=new Random().nextInt();
				double price=new Random().nextDouble();
				
				obj.add("quantity",quantity);
				obj.add("price",price); 
				obj.add("total",price*quantity);
				array.add(obj);
			}
			 
			//单独展开的请求不能返回rows属性 ,只能是数组
			System.out.println(array.build().toString());
			response.getWriter().write(array.build().toString());
			response.flushBuffer();
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
