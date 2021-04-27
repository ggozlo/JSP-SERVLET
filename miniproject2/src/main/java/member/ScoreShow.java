package member;

import java.io.IOException;
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


@WebServlet("/Show")
public class ScoreShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ScoreShow() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
				
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		ScoreDAO sdao = new ScoreDAO();
		ArrayList<ScoreDTO> list = sdao.scoreShow();
		ArrayList<ScoreDTO> slist = (ArrayList<ScoreDTO>)list.stream()
				.sorted(Comparator.comparing(ScoreDTO::getTot).reversed()).collect(Collectors.toList());
		request.setAttribute("list", slist);
		
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/scoreShow.jsp");
		dispatcher.forward(request, response);

		response.sendRedirect("scoreShow.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
