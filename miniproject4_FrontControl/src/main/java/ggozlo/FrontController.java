package ggozlo;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Path path = Paths.get( request.getRequestURI() );
		String filename =  path.getFileName().toString();
		BookDAO bdao = new BookDAO();
		
		//-----------------------------------------------------------------------
		if(filename.equals("input.do"))
		{
			int n = bdao.bookInput( new BookDTO(
					request.getParameter("name"),
					request.getParameter("publisher"),
					Integer.parseInt(request.getParameter("price")),
					Integer.parseInt(request.getParameter("sales"))));
			if(n==1)
			{
				response.sendRedirect("print.do");
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
		//-----------------------------------------------------------------------
		else if(filename.equals("print.do"))
		{
			ArrayList<BookDTO> list = bdao.bookPrint();
			ArrayList<BookDTO> slist = (ArrayList<BookDTO>) list.stream()
					.sorted(Comparator.comparing(BookDTO::getName)).collect(Collectors.toList());
			if(slist.equals(null))
			{
				response.sendRedirect("error.jsp");
				
			}
			else
			{
				request.setAttribute("list", slist);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/bookPrint.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		//-----------------------------------------------------------------------
		else if(filename.equals("delete.do"))
		{
			int n = bdao.bookDelete( request.getParameter("name"));
			if(n==1)
			{
				response.sendRedirect("print.do");
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
		//-----------------------------------------------------------------------
		else if(filename.equals("modify.do"))
		{
			int n = bdao.bookModify(new BookDTO(
					request.getParameter("name"),
					request.getParameter("publisher"),
					Integer.parseInt(request.getParameter("price")),
					Integer.parseInt(request.getParameter("sales"))));
			if(n==1)
			{
				response.sendRedirect("print.do");
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
