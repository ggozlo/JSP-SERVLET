package ggozlo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BmodifyCommand implements Bcommand
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao)
	{
		BoardDTO bdto = new BoardDTO();
		bdto.setBid( Integer.parseInt(request.getParameter("bid")));
		bdto.setBtitle(request.getParameter("btitle"));
		bdto.setBname(request.getParameter("bname"));
		bdto.setBcontent(request.getParameter("bcontent"));
		int n  = bdao.modifyPost(bdto);
		
		if(n==1)
		{
			return  "post.do?id="+request.getParameter("bid");
		}
		else
		{
			return "error.jsp";
		}
		
		
	}

}
