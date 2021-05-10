package ggozlo.command;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggozlo.BoardDAO;
import ggozlo.BoardDTO;

public class BpostCommand implements Bcommand
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{	
		Optional<BoardDTO> post = Optional.ofNullable( bdao.getPost( Integer.parseInt( request.getParameter("id"))));
		if(post.isEmpty())
		{
			return "postError.jsp";
		}
		else
		{		
			request.setAttribute("post", post.get());
			return "printPost.jsp";
		}
		
	}

}
