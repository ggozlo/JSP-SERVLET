package ggozlo.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggozlo.BoardDAO;
import ggozlo.BoardDTO;

public class BreplyCommand implements Bcommand
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao)
	{
		int n  = bdao.addReply(new BoardDTO(
				Integer.parseInt(request.getParameter("bid")),
				request.getParameter("bname"),
				request.getParameter("btitle"),
				request.getParameter("bcontent"),
				null,
				Integer.parseInt(request.getParameter("bgroup")),
				Integer.parseInt(request.getParameter("bstep")),
				Integer.parseInt(request.getParameter("bindent")),
				0,
				null));
		
		if(n==1)
		{
			return "list.do";
		}
		else
		{
			return "error.jsp";
		}
	}
	
}
