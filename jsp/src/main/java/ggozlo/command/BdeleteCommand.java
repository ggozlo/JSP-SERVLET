package ggozlo.command;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggozlo.BoardDAO;
import ggozlo.BoardDTO;

public class BdeleteCommand implements Bcommand
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{
		BoardDTO bdto = bdao.getPost(Integer.parseInt(request.getParameter("id")));
		int n = bdao.deletePost( Integer.parseInt( request.getParameter("id")), request.getParameter("name"));
		
		String filename = bdto.getFilename();
		String path = request.getServletContext().getRealPath("file").toString() + "\\"+filename;
		File file = new File(path);
		if(file.exists()) file.delete();
		
		
		if(n==1)return "list.do";
		else return "postError.jsp";
	}

}
