package ggozlo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletTest
 */
//@WebServlet("/ST")
public class ServletTest extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       

    public ServletTest()
    {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>get method area :"+name+"</h1>");
		out.println("</body>");
	
		out.println("</html>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	
;
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>name :"+request.getParameter("name")+"</h2>");
		out.println("<h2>kor :"+request.getParameter("kor")+"</h2>");
		out.println("<h2>eng :"+request.getParameter("eng")+"</h2>");
		out.println("<h2>mat :"+request.getParameter("mat")+"</h2>");
		out.println("</body>");
	
		out.println("</html>");
	}

}
