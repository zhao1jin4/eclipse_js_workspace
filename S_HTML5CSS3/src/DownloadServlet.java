import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= {"/download"})
public class DownloadServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fileId=req.getParameter("fileId");
		ServletOutputStream output=resp.getOutputStream();
		if("1".equals(fileId))
		{
			resp.setContentType("application/x-msdownload");
			resp.addHeader("Content-Disposition", "attachment;filename="+ new String("服务文件名.txt".getBytes("UTF-8"), "ISO-8859-1"));//attachment会提示下载
		
			output.write("文件内容".getBytes());
		}else
		{
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
			output.write("服务端不存在文件".getBytes("UTF-8"));
		}
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
