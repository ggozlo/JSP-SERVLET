package ggozlo.command;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggozlo.BoardDAO;

public class BdownloadCommand implements Bcommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{
		try {
			System.out.println(request.getRequestURL());
			String filename = request.getParameter("file");
			System.out.println(filename);
			String dir = request.getServletContext().getRealPath("/file");
			
			File file = new File(dir+"/"+filename);
			String mimeType = request.getServletContext().getMimeType(file.toString());
			
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
		catch
		(Exception e) 
		{
			System.out.println(e);
		}
			
		return null;
	}

}
