package ggozlo;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BpostCommand implements Bcommand
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{	
		Optional<BoardDTO> post = Optional.ofNullable( bdao.getPost( Integer.parseInt( request.getParameter("id"))));
		if(post.isEmpty())
		{
			System.out.println("오류");
		}
		else
		{		
			request.setAttribute("post", post.get());
		}
		
	}

}
