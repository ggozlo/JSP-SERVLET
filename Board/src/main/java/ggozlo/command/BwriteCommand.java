package ggozlo.command;


import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ggozlo.BoardDAO;
import ggozlo.BoardDTO;


public class BwriteCommand implements Bcommand 
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{
		
		ServletContext context = request.getServletContext();
		String dir = context.getRealPath("file");
		int size = 1024 * 1024 * 10;
		String filename = null;
		
		int n = 0;
		try
		{
			MultipartRequest multi = new MultipartRequest(
					request, 
					dir, 
					size, 
					"UTF-8",
					new DefaultFileRenamePolicy());
			filename = multi.getFilesystemName("upload");
			
			n = bdao.write( new BoardDTO(
					multi.getParameter("bname"), 
					multi.getParameter("btitle"),
					multi.getParameter("bcontent"),
					filename));
			
			
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}

		 if(n == 1)
		 {
			 return  "list.do";
		 }
		 else
		 {
			 return "error.jsp";
		 }
	}

}
