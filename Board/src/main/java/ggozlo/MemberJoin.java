package ggozlo;

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
import javax.sql.DataSource;



@WebServlet("/MS")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberJoin() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection con;
		PreparedStatement psmt;
		String sql = "INSERT INTO MEMBER VALUES (?,?,?)";
		DataSource dataSource;
		int n=0;
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		try
		{
			Context context = new InitialContext();
			dataSource =  (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setString(1, request.getParameter("id") );
			psmt.setString(2, request.getParameter("pw") );
			psmt.setString(3, request.getParameter("name") );
			n = psmt.executeUpdate();
			
			if(n==1)
			{
				response.sendRedirect("xloginForm.jsp");
			}
			else
			{
				response.sendRedirect("xmemberForm.jsp");
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
			e.printStackTrace();
		}

		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
