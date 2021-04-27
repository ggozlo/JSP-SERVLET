package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

/**
 * Servlet implementation class memberServletLogin
 */
@WebServlet("/MSL")
public class memberServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public memberServletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Connection con;
		PreparedStatement psmt;
		DataSource dataSource;
		ResultSet res;
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		try 
		{
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			String sql="SELECT * FROM member WHERE ID=? and PW=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, request.getParameter("id"));
			psmt.setString(2, request.getParameter("pw"));
			res = psmt.executeQuery();
			if(res.isBeforeFirst())
			{
				while(res.next())
				{
				session.setAttribute("name", res.getString("NAME"));
				response.sendRedirect("index.jsp");
			
				}
			}
			else
			{
				response.sendRedirect("signUpform.jsp");
			}
			psmt.close();
			con.close();
		} 
		catch (NamingException e) 
		{

			e.printStackTrace();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
