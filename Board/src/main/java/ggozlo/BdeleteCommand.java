package ggozlo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BdeleteCommand implements Bcommand
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{
		bdao.deletePost( Integer.parseInt( request.getParameter("id")), request.getParameter("name"));
		return "list.do";
	}

}
