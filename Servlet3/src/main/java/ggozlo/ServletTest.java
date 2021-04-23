package ggozlo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




//@WebServlet("/ServletTest")

public class ServletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html; charset=UTF-8");
		request.getParameter("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<head>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h2> 이름 :"+getInitParameter("name")+"</h2><br/>");
		out.print("<h2>번호 :"+getInitParameter("tel")+"</h2><br/>");
		out.print("<h2>주소 :"+getInitParameter("address")+"</h2><br/>");
		out.print("<h2>대표번호 :"+getServletContext().getInitParameter("stel")+"</h2><br/>");

		out.print("</body>");
		out.print("</html>");
	}

}
