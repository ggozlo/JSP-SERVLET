package ggozlo;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Controller extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

    public Controller() 
    {
        super();
        // TODO Auto-generated constructor stub
    }
    
    Bcommand comm;
    String vpage;
    BoardDAO bdao = new BoardDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		Path path = Paths.get( request.getRequestURI() );
		String filename = path.getFileName().toString();	
		
		//--------------------------------------------------------------------------------------작성
		if(filename.equals("write.do"))
		{
			comm = new BwriteCommand();
			comm.execute(request, response, bdao);
			vpage = "writeForm.jsp";
		}
		//--------------------------------------------------------------------------------------리스트출력ㄴ
		else if(filename.equals("list.do"))
		{
			comm = new BlistCommand();
			comm.execute(request, response, bdao);
			vpage = "printList.jsp";
			  
		}
		//--------------------------------------------------------------------------------------게시글출력
		else if(filename.equals("post.do"))
		{
			comm = new BpostCommand();
			comm.execute(request, response, bdao);
			vpage = "printPost.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(vpage);
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
