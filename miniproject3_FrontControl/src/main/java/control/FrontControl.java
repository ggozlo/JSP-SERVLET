package control;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.do")
public class FrontControl extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public FrontControl() 
    {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
    	response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ScoreDAO sdao = new ScoreDAO();
		
		//URI - FileName 분리--------------------------------------------------------- 
    	Path path = Paths.get( request.getRequestURI() );
		String fileName = "/"+path.getFileName().toString();
		// ScoreInput----------------------------------------------------------------
		if(fileName.equals("/scoreinput.do"))
		{
			ScoreDTO sdto = new ScoreDTO(request.getParameter("name"),
					Integer.parseInt( request.getParameter("room") ),
					Integer.parseInt( request.getParameter("num") ),
					Integer.parseInt( request.getParameter("kor") ),
					Integer.parseInt( request.getParameter("eng") ),
					Integer.parseInt( request.getParameter("mat") ));
			int n = sdao.scoreInput(sdto, (String)session.getAttribute("name") );
			if(n == 1)
			{
				response.sendRedirect("scorePrint.do");
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
		// ScorePrint----------------------------------------------------------------
		else if(fileName.equals("/scorePrint.do"))
		{
			ArrayList<ScoreDTO> list = sdao.scorePrint();
			ArrayList<ScoreDTO> slist = (ArrayList<ScoreDTO>)list.stream()
					.sorted(Comparator.comparing(ScoreDTO::getTot).reversed()).collect(Collectors.toList());
			if(slist != null)
			{
				request.setAttribute("list", slist);
				ServletContext context = getServletContext();
				RequestDispatcher dispatcher = context.getRequestDispatcher("/scorePrint.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
		// ScoreModify----------------------------------------------------------------
		else if(fileName.equals("/scoreModify.do"))
		{
			ScoreDTO sdto = new ScoreDTO(request.getParameter("name"),
					Integer.parseInt( request.getParameter("room") ),
					Integer.parseInt( request.getParameter("num") ),
					Integer.parseInt( request.getParameter("kor") ),
					Integer.parseInt( request.getParameter("eng") ),
					Integer.parseInt( request.getParameter("mat") ));
			int n =sdao.scoreModify(sdto, (String) session.getAttribute("name"));
			if(n==1)
			{
				response.sendRedirect("scorePrint.do");
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
		// ScoreDelete----------------------------------------------------------------
		else if(fileName.equals("/scoreDelete.do"))
		{
			int n =sdao.scoreDelete(request.getParameter("name"));
			if(n==1)
			{
				response.sendRedirect("index.jsp");
			}
			else 
			{
				response.sendRedirect("error.jsp");
			}
		}
		// Default----------------------------------------------------------------
		else
		{
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		doGet(request, response);
	}

}
