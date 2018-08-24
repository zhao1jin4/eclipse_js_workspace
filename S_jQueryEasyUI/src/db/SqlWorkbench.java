package db;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Writer;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
 
//没用的
@WebServlet("/SqlWorkbench")
public class SqlWorkbench extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		response.setContentType("applicatino/json;charset=utf-8");
		
		if(!request.getContentType().toLowerCase().contains("json"))
		{
			return ;
		}
		//select table_schema,table_name from information_schema.TABLES
		
		BufferedReader br =request.getReader();
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
//		EasyUIParam param=JSON.parseObject(sb.toString(),EasyUIParam.class);
//	 	String sql= param.sql.Ostrim().toLowerCase();
	 	

		EasyUIResult res=new EasyUIResult();
	 	
	 
	}
	  private void setOneMessage(EasyUIResult res,String str)
		{ 
			 Map<String,Object> row=new HashMap<String,Object>();
			 row.put("结果", str);
			List<Map<String,Object>>  resList = Collections.singletonList(row) ;
			 res.setRows(resList);
			 res.setTotal(1);
		 
		}

	  class EasyUIParam {
		 
			String sql;
			int skip;
			int pageSize;

			public void setSql(String sql) {
				this.sql = sql;
			}

			public String getSql() {
				return sql;
			}

			public int getSkip() {
				return skip;
			}
			public void setSkip(int skip) {
				this.skip = skip;
			}

			public int getPageSize() {
				return pageSize;
			}

			public void setPageSize(int pageSize) {
				this.pageSize = pageSize;
			}

			 
		}
	  class EasyUIResult 
		 {
			 int total;
			  
			 List<Map<String,Object>>  rows;
			String errorMsg;

			public String getErrorMsg() {
				return errorMsg;
			}

			public void setErrorMsg(String errorMsg) {
				this.errorMsg = errorMsg;
			}
	 
			public List<Map<String, Object>> getRows() {
				return rows;
			}
			public void setRows(List<Map<String, Object>> rows) {
				this.rows = rows;
			}
	 
			public void setTotal(int total) {
				this.total = total;
			}
			public int getTotal() {
				return total;
			}
		 }
			
}
