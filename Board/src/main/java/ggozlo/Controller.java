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
import javax.websocket.Session;

import ggozlo.command.Bcommand;
import ggozlo.command.BdeleteCommand;
import ggozlo.command.BdownloadCommand;
import ggozlo.command.BlistCommand;
import ggozlo.command.BmodifyCommand;
import ggozlo.command.BpostCommand;
import ggozlo.command.BreplyCommand;
import ggozlo.command.BreplyViewCommand;
import ggozlo.command.BsearchCommand;
import ggozlo.command.BwriteCommand;


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
		
		HttpSession session;

		
		//--------------------------------------------------------------------------------------작성
		if(filename.equals("write.do"))
		{
			comm = new BwriteCommand();
			vpage = comm.execute(request, response, bdao);
			
		}
		//--------------------------------------------------------------------------------------리스트출력
		else if(filename.equals("list.do"))
		{
			comm = new BlistCommand();
			vpage =  comm.execute(request, response, bdao);
		}
		//--------------------------------------------------------------------------------------게시글출력
		else if(filename.equals("post.do"))
		{
			comm = new BpostCommand();
			vpage = comm.execute(request, response, bdao);
		}
		//--------------------------------------------------------------------------------------게시굴 수정
		else if(filename.equals("modify.do"))
		{
			comm = new BmodifyCommand();
			vpage = comm.execute(request, response, bdao);
		}
		//--------------------------------------------------------------------------------------게시글수정용 출력
		else if(filename.equals("modifyPost.do"))
		{
			comm = new BpostCommand();
			comm.execute(request, response, bdao);
			vpage = "modifyPost.jsp";
		}
		//--------------------------------------------------------------------------------------게시글삭제
		else if(filename.equals("delete.do"))
		{
			comm = new BdeleteCommand();
			vpage =  comm.execute(request, response, bdao);
			
		}
		//--------------------------------------------------------------------------------------게시글검색
		else if(filename.equals("search.do"))
		{
			comm = new BsearchCommand();
			vpage =  comm.execute(request, response, bdao);
			
		}
		//--------------------------------------------------------------------------------------답글 보기
		else if(filename.equals("replyView.do"))
		{
			comm = new BreplyViewCommand();
			vpage =  comm.execute(request, response, bdao);
			
		}
		//--------------------------------------------------------------------------------------답글추가
		else if(filename.equals("addReply.do"))
		{
			comm = new BreplyCommand();
			vpage =  comm.execute(request, response, bdao);
			
		}
		//--------------------------------------------------------------------------------------로그아웃
		else if(filename.equals("logout.do"))
		{
			session = request.getSession();
			session.removeAttribute("name");
			vpage = "xloginForm.jsp";
			
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
