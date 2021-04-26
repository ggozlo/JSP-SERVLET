package member;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/SD")
public class ScoreDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScoreDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		ScoreDAO sdao = new ScoreDAO();
		int n =sdao.scoreDelete(request.getParameter("name"));
		
		if(n==1)
		{
			response.sendRedirect("welcome.jsp");
		}
		else 
		{
			response.sendRedirect("scoreDeleteForm.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
