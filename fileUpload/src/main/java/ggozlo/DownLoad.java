package ggozlo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadAction")
public class DownLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DownLoad() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String filename = request.getParameter("file");
		String dir = this.getServletContext().getRealPath("/upLoad");
		
		File file = new File(dir+"/"+filename);
		String mimeType = getServletContext().getMimeType(file.toString());
		
		if(mimeType.equals(null))
		{
			response.setContentType("application/octet-stream");
		}
		
		String downLoadName = null;
		if(request.getHeader("user-agent").indexOf("MSIE")==-1)
		{
			downLoadName = new String(filename.getBytes("UTF-8"),"8859_1");
		}
		else
		{
			downLoadName = new String(filename.getBytes("EUC-KR"),"8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=\""+downLoadName+"\";");
		
		FileInputStream fis = new FileInputStream(file);
		
		ServletOutputStream sos = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0 ;
		while((data =(fis.read(b,0,b.length)))!=-1)
		{
			sos.write(b, 0 ,data);
		}
		
		sos.flush();
		sos.close();
		fis.close();
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
