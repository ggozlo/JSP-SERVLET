package ggozlo.command;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggozlo.BoardDAO;
import ggozlo.BoardDTO;

public class BsearchCommand implements Bcommand
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao)
	{
		Optional<List<BoardDTO>> list  = Optional.ofNullable( bdao.getSearchList( request.getParameter("title")));
		if(list.isEmpty())
		{
			return "postError.jsp";
		}
		else
		{
			request.setAttribute("list", list.get());
			return "printList.jsp";
		}
	}

}
