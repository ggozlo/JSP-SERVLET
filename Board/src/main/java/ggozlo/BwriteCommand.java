package ggozlo;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BwriteCommand implements Bcommand 
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, BoardDAO bdao) 
	{
		 int n = bdao.write( new BoardDTO(
		request.getParameter("bname"), 
		request.getParameter("btitle"),
		request.getParameter("bcontent")));
		 
		 if(n == 1)
		 {
			 return  "list.do";
		 }
		 else
		 {
			 return "error.jsp";
		 }
	}

}
