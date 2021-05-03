package ggozlo;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BwriteCommand implements Bcommand 
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{
		 bdao.write( new BoardDTO(
		request.getParameter("bname"), 
		request.getParameter("btitle"),
		request.getParameter("bcontent")));
	}

}
