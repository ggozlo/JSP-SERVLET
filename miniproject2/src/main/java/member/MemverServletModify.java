package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.websocket.Session;




@WebServlet("/MSM")
public class MemverServletModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemverServletModify() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		Connection con;
		PreparedStatement psmt;
		DataSource dataSource;
		try
		{
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql = "UPDATE MEMBER SET PW=? WHERE NAME=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, request.getParameter("pw"));
			psmt.setString(2, (String)session.getAttribute("name"));
			int n = psmt.executeUpdate();
			if(n==1)
			{
				response.sendRedirect("loginForm.jsp");
				session.removeAttribute("name");
			}
			else
			{
				response.sendRedirect("welcome.jsp");
			}
			con.commit();
			psmt.close();
			con.close();
		} 
		catch (NamingException e)
		{
			e.printStackTrace();
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
