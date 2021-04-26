package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SM")
public class modifyScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public modifyScore() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ScoreDTO sdto = new ScoreDTO(request.getParameter("name"),
				Integer.parseInt( request.getParameter("room") ),
				Integer.parseInt( request.getParameter("num") ),
				Integer.parseInt( request.getParameter("kor") ),
				Integer.parseInt( request.getParameter("eng") ),
				Integer.parseInt( request.getParameter("mat") ));
		
		ScoreDAO sdao = new ScoreDAO();
		int n =sdao.scoreModify(sdto, (String) session.getAttribute("name"));
		if(n ==1)
		{
			response.sendRedirect("welcome.jsp");
		}
		else
		{
			response.sendRedirect("scoremodifyForm.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
