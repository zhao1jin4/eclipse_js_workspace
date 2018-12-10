/*
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

 
// commons-fileupload-1.3.2.jar -> commons-io-2.4.jar
@WebServlet(description = "文件上传", urlPatterns = { "/commonsUpload" })
public class CommonsUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String filePath;
   // private int maxFileSize = 1024 * 1024;//1MB
    private int maxFileSize =100 * 1024 * 1024;//100 MB
    public void init() {
      //  filePath = this.getServletContext().getRealPath("/") + File.separator + "upload";
    	  filePath = "/tmp/upload";
    	     
    	File file = new File(filePath);
        if (!file.exists()) {
            file.mkdirs();
        }
    }
 
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(maxFileSize);
 
        try {
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();
            while (i.hasNext()) 
            {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField())
                {
                	String fieldName = fi.getFieldName();//form 的名字
        			String pathName = fi.getName();//只有IE 带C:/   浏览器可以和request.setCharacterEncoding("UTF-8");一起使用
        			String correctName=pathName.substring(pathName.lastIndexOf(File.separator)+1);//浏览器对中文名OK
         			//String contentType = item.getContentType();
        			//long sizeInBytes = item.getSize();

        			//File uploadedFile = new File("d:/temp/"+correctName);//快速方式
        			//item.write(uploadedFile);

        			//为进度条方式
        			FileOutputStream output=new FileOutputStream(new File(filePath + File.separator +correctName));
        			InputStream input = fi.getInputStream();
        			byte[] buffer=new byte[1024];
        			int len=0;
        			while((len=input.read(buffer))!=-1 )
        			{
        				output.write(buffer,0,len);
        			}
        			output.close();
        			input.close();
        			
                    String fileName = fi.getName();
//                    File file = new File(filePath + File.separator + fileName);
//                    fi.write(file);
                    
                    out.println(fileName + "上传成功");
                }
            }
        } catch (Exception ex) {
            out.println("上传文件失败:" + ex.getMessage());
        } finally {
            out.close();
        }
    }
} * 
 */
