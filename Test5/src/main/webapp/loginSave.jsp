<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
		
			<%! 
				Connection con;
				PreparedStatement psmt;
				ResultSet res;
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String driver = "oracle.jdbc.driver.OracleDriver";
				String sql = "SELECT ID, PW FROM MEMBER WHERE ID=? and PW=?";
				String id,pw;
			%>
			
			<%
				request.setCharacterEncoding("UTF-8");
				
				Class.forName(driver);
				con = DriverManager.getConnection(url, "ggozlo", "ggozlo");
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id=request.getParameter("id"));
				psmt.setString(2, pw=request.getParameter("pw"));
				res = psmt.executeQuery();
				
				if(res.next())
				{
					session.setAttribute("id", id);
					session.setMaxInactiveInterval(30);
					
					response.sendRedirect("input.jsp");
				}
				else
				{
					response.sendRedirect("memberIn.jsp");
				}
			%>
			
			
		</body>
	</html>