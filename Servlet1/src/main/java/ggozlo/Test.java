package ggozlo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test
 */
//@WebServlet("/TS")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html; charset=UTF-8");

		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>이름 : "+request.getParameter("name")+"</h2>");
		out.println("<h2>국어 : "+request.getParameter("kor")+"</h2>");
		out.println("<h2>영어 : "+request.getParameter("eng")+"</h2>");
		out.println("<h2>수학 : "+request.getParameter("mat")+"</h2>");
		out.println("</body>");
		out.println("</html>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>이름 : "+request.getParameter("name")+"</h2>");
		out.println("<h2>국어 : "+request.getParameter("kor")+"</h2>");
		out.println("<h2>영어 : "+request.getParameter("eng")+"</h2>");
		out.println("<h2>수학 : "+request.getParameter("mat")+"</h2>");
		out.println("</body>");
		out.println("</html>");

	}

}
