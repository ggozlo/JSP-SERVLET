package ggozlo;



import java.util.List;
import java.util.Optional;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BlistCommand implements Bcommand
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao)
	{
		Optional<List<BoardDTO>> list = Optional.ofNullable( bdao.getList());
		if(list.isEmpty())
		{
			System.out.println("오류");
		}
		else
		{
			request.setAttribute("list", list.get());
		}
		
	}

}
