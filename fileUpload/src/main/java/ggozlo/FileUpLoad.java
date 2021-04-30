package ggozlo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUpLoad
 */
@WebServlet("/FileUpLoad")
public class FileUpLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpLoad() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String dir = getServletContext().getRealPath("./upLoad/");
		int size = 1024*1024*50; // 50MB
		MultipartRequest multi = new MultipartRequest(request, dir, size, "UTF-8", new DefaultFileRenamePolicy());
		
		String filename = multi.getOriginalFileName("fname");
		String fileRealName = multi.getOriginalFileName("fname");
		
		FileDAO fDao = new FileDAO();
		fDao.upLoad(filename, fileRealName);
		
		response.sendRedirect("fileList.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
