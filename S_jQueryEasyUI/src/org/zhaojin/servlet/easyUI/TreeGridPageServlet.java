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
		

//		String[] selectStatus=request.getParameterValues("selectStatus[]");//��easyUI������
//		System.out.println("easyUI  array param:"+selectStatus);
//		String user=request.getParameter("user");
//		String date_from=request.getParameter("date_from");
//		String date_to=request.getParameter("date_to");
//		String lang=request.getParameter("lang");
//		
//		String my_custome_param=request.getParameter("my_custome_param");
		
		String reqPageNO=request.getParameter("page");//easyUI �̶�
		String reqPageSize=request.getParameter("rows");//easyUI �̶�
		String id=request.getParameter("id");//easyUI �̶�,չ����ID  , ������idField��ֵ
		//��ҳ��û������Ϊ0����ʼʱ(ûչ��ʱ)����null
		
		long totalCount=50;//��DB
		long[] range=super.submitPage(reqPageNO, reqPageSize, totalCount, request);
		long start=range[0];
		long end=range[1];
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		
		JsonBuilderFactory bf = Json.createBuilderFactory(null); 
		if("0".equals(id)   //0�� ҳ�������õģ���Ϊ��ʱ����Ϊ0��������һ�ν���ҳʱ��û���ֹ�չ��
			 ||id ==null
		)
		{
			JsonArrayBuilder array=bf.createArrayBuilder();
			for(long i=start;i<=end*10;i+=10)
			{
				JsonObjectBuilder obj=bf.createObjectBuilder() ;
				obj.add("myid", 10+i+"");
				obj.add("name","��"+i);
				obj.add("name2","��"+i);
				if(i%20==0)
				{
					obj.add("state","closed");//��ʾ�ļ��йرգ���������ͨ�ļ���open
					
					//Ҳ�����ݣ��õ��仯 (��û������editorҲ��???���ò�������??)
					int quantity=new Random().nextInt();
					double price=new Random().nextDouble();
					
					obj.add("quantity",quantity);
					obj.add("price",price); 
					obj.add("total",price*quantity);
				}else
				 {
					 obj.add("checked",true); //��ʾ�Ƿ�ѡ
					 obj.add("iconCls","icon-ok"); //ͼ��
					int quantity=new Random().nextInt();
					double price=new Random().nextDouble();
					
					obj.add("quantity",quantity);
					obj.add("price",price); 
					obj.add("total",price*quantity);
				 }
				array.add(obj);
			}

			JsonObjectBuilder root=bf.createObjectBuilder() ;
			root.add("rows", array);//easyUI �̶�
			root.add("total",totalCount);//easyUI �̶�
			System.out.println(root.build().toString());

			response.getWriter().write(root.build().toString());
			response.flushBuffer();
//			response.getOutputStream().write(root.build().toString().getBytes());
		}else
		{ //չ������
			int idVal=Integer.parseInt(id);
			JsonArrayBuilder array=bf.createArrayBuilder();
			for(long i=idVal+1;i<=idVal+5;i+=1)
			{
				JsonObjectBuilder obj=bf.createObjectBuilder() ;
				obj.add("myid", i);
				
				if(i%20==0)
					obj.add("state","closed");//��ʾ�ļ��йرգ���������ͨ�ļ���open
				 else
					 obj.add("checked",true); //��ʾ�Ƿ�ѡ
				
				obj.add("name","��"+i);
				obj.add("name2","��"+i);
				int quantity=new Random().nextInt();
				double price=new Random().nextDouble();
				
				obj.add("quantity",quantity);
				obj.add("price",price); 
				obj.add("total",price*quantity);
				array.add(obj);
			}
			 
			//����չ���������ܷ���rows���� ,ֻ��������
			System.out.println(array.build().toString());
			response.getWriter().write(array.build().toString());
			response.flushBuffer();
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
