package ggozlo;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.sco")
public class ScoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScoController() {
        super();
        // TODO Auto-generated constructor stub
    }

    ScoreDAO sdao;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String page = null;
		
		Path path = Paths.get( request.getRequestURI() );
		String filename = path.getFileName().toString();
		
		sdao = new ScoreDAO();
		
		if(filename.equals("scoreDelete.sco"))
		{
			int n  = sdao.scoreDelete(request.getParameter("deleteName"));
			if(n ==1)
			{
				page = "scoreOut.jsp";
			}
			else
			{
				page = "scoreError.jsp";
			}
		}
		else if(filename.equals("scoreOut.sco"))
		{
			List<ScoreDTO> list  = sdao.scorePrint();
			if(!list.isEmpty())
			{
				request.setAttribute("list", list);
				page = "scoreOut.jsp";
			}
			else
			{
				page = "scoreError.jsp";
			}
		}
		else if(filename.equals("scoreSave.sco"))
		{
			int n = sdao.addScoreDAO(new ScoreDTO(
					request.getParameter("name"),
					Integer.parseInt(request.getParameter("kor")),
					Integer.parseInt(request.getParameter("eng")),
					Integer.parseInt(request.getParameter("mat"))));
			if(n==1)
			{
				
				page = "scoreOut.sco";
			}
			else
			{
				page = "scoreError.jsp";
			}
		}
		else if(filename.equals("scoreSearch.sco"))
		{
			List<ScoreDTO> list = sdao.scoreSearch(request.getParameter("SearchName"));

				request.setAttribute("list", list);
				page = "scoreOut.jsp";
	
		}
		else if(filename.equals("scoreUpdate.sco"))
		{
			int n = sdao.scoreUpdate(new ScoreDTO(
						request.getParameter("name"),
						Integer.parseInt(request.getParameter("kor")),
						Integer.parseInt(request.getParameter("eng")),
						Integer.parseInt(request.getParameter("mat"))));

			if(n ==1)
			{
				page = "scoreOut.sco";
			}
			else
			{
				page = "scoreError.jsp";
			}
	
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
