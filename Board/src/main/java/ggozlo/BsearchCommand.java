package ggozlo;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BsearchCommand implements Bcommand
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao)
	{
		Optional<List<BoardDTO>> list  = Optional.ofNullable( bdao.getSearchList( request.getParameter("title")));
		if(list.isEmpty())
		{
			return "error.jsp";
		}
		else
		{
			request.setAttribute("list", list.get());
			return "printList.jsp";
		}
	}

}
