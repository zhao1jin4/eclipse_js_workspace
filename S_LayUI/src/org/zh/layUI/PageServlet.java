package org.zh.layUI;


import static org.zh.layUI.Constant.DEF_PAGE_SIZE;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public abstract class  PageServlet extends HttpServlet
{
	public void initPage(HttpServletRequest request)
	{
		request.setAttribute("pageNO", 1);
		request.setAttribute("pageCount", 1);
		request.setAttribute("allPageSize",this.generatePageSize());
		this.getSessionPageSize(null,request.getSession());//存储session PAGE_SIZE
	}
	public long[] submitPage(String reqPageNO,String reqPageSize,long totalCount,HttpServletRequest request)
	{
		int pageSize=this.getSessionPageSize(reqPageSize,request.getSession()); //存储session PAGE_SIZE
		
		int pageCount=(int)(totalCount/pageSize) + 1;
		int pageNO=1;
		if(reqPageNO!=null && ! "".equals(reqPageNO) && Pattern.matches("[0-9]{0,2}",reqPageNO ))
		{
			pageNO=Integer.parseInt(reqPageNO);
		} 
		if(pageNO>pageCount)
			pageNO=pageCount;
		request.setAttribute("pageNO", pageNO);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("allPageSize",this.generatePageSize());
		
		//为Oracle传参数
		long start=(pageNO-1)*pageSize+1;//pageNO*pageSize-pageSize+1
		long end=pageNO*pageSize;
		long[] range=new long[2];
		range[0]=start;
		range[1]=end;
		return range;
	}
	//只为子类使用
    protected int  getSessionPageSize(String reqPageSize,HttpSession session)
	{
		int pageSize=DEF_PAGE_SIZE;
	    if(reqPageSize!=null && ! "".equals(reqPageSize) && Pattern.matches("[0-9]{0,2}",reqPageSize ))
	    {
	    	pageSize=Integer.parseInt(reqPageSize);
	    	session.setAttribute(SessionKey.PAGE_SIZE,pageSize);
	    }else
	    {
	    	 Object sessionPage =session.getAttribute(SessionKey.PAGE_SIZE);
	 	    if(sessionPage!=null)
	 	    	pageSize=Integer.parseInt(sessionPage.toString());
	 	    else
	 	    	session.setAttribute(SessionKey.PAGE_SIZE,pageSize);
	    }
	    return pageSize;
	}
    private List<Integer> generatePageSize()
	{
		List<Integer> allPageSize=new ArrayList<Integer>();
		allPageSize.add(DEF_PAGE_SIZE-10);
		allPageSize.add(DEF_PAGE_SIZE);
		allPageSize.add(DEF_PAGE_SIZE+10);
		allPageSize.add(DEF_PAGE_SIZE+30);
		return allPageSize;
	}
}
