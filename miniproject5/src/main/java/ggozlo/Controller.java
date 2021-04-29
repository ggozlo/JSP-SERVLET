package ggozlo;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		Path path = Paths.get( request.getRequestURI() );
		String filename = path.getFileName().toString();	
		MemberDAO mdao = new MemberDAO();
		HttpSession session = request.getSession();
		
		//------------------------------------------------------------------------------------------------------------------
		if(filename.equals("join.do"))
		{
			int n =mdao.memberJoin(new MemberDTO(
					request.getParameter("id"),
					request.getParameter("pw"),
					request.getParameter("name"),
					request.getParameter("tel"),
					request.getParameter("email")));
			if(n == 1)
			{
				response.sendRedirect("login.jsp");
			}
			else
			{
				response.sendRedirect("join.jsp");
			}
						
		}
		//------------------------------------------------------------------------------------------------------------------
		else if(filename.equals("login.do"))
		{
			Optional<String> name = Optional.ofNullable(mdao.memberLogin(request.getParameter("id"), request.getParameter("pw")));
			if( name.isEmpty() )
			{
				response.sendRedirect("login.jsp");
			}
			else
			{
				session.setAttribute("id", request.getParameter("id") );
				session.setAttribute("name", name.get() );
				session.setMaxInactiveInterval(30);
				response.sendRedirect("index.jsp");
			}
						
		}
		//------------------------------------------------------------------------------------------------------------------
		else if(filename.equals("modify.do"))
		{
			int n = mdao.memberModify(new MemberDTO(
					(String)session.getAttribute("id"),
					request.getParameter("pw"),
					request.getParameter("name"),
					request.getParameter("tel"),
					request.getParameter("email")));
			if(n == 1)
			{
				session.setAttribute("name", request.getParameter("name"));
				session.setMaxInactiveInterval(30);
				response.sendRedirect("info.do");
			}
			else
			{
				response.sendRedirect("memberModify.jsp");
			}
						
		}
		//------------------------------------------------------------------------------------------------------------------
		else if(filename.equals("logout.do"))
		{
			Optional<String> name = Optional.ofNullable((String)session.getAttribute("name"));
			if(!name.isEmpty())
			{
				session.removeAttribute("name");
				response.sendRedirect("login.jsp");
			}
			else
			{
				response.sendRedirect("login.jsp");
			}
		}
		//------------------------------------------------------------------------------------------------------------------
		else if(filename.equals("info.do"))
		{
			Optional<MemberDTO> mdto = Optional.ofNullable( mdao.memberInfo( (String)session.getAttribute("id")));
			if(mdto.isEmpty())
			{
				response.sendRedirect("login.jsp");
			}
			else
			{
				request.setAttribute("mdto", mdto.get());
				RequestDispatcher dispatcher = request.getRequestDispatcher("memberInfo.jsp");
				dispatcher.forward(request, response);
			}
		
		}
		//------------------------------------------------------------------------------------------------------------------
				else if(filename.equals("list.do"))
				{
					Optional<ArrayList<MemberDTO>> list = Optional.ofNullable( mdao.memberList());
					if( list.isEmpty() )
					{
						response.sendRedirect("index.jsp");
					}
					else
					{
						request.setAttribute("list", list.get());
						RequestDispatcher dispatcher = request.getRequestDispatcher("memberList.jsp");
						dispatcher.forward(request, response);
					}
				
				}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
