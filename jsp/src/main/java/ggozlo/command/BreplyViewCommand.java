package ggozlo.command;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggozlo.BoardDAO;
import ggozlo.BoardDTO;

public class BreplyViewCommand implements Bcommand
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{
		Optional<BoardDTO> bdto =  
				Optional.ofNullable( bdao.getReply(Integer.parseInt(request.getParameter("id"))));
//		if(bdto.isEmpty())
//		{
//			return "replyView.jsp";
//		}
//		else
//		{
			request.setAttribute("reply_view", bdto.get());
			return "replyView.jsp";
//		}
		
		
	}

}
