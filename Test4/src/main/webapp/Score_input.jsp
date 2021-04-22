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
				Connection con; //연결
				PreparedStatement psmt; //sql 문장 저장 
				ResultSet res; //결과 저장 
				
				String drive="oracle.jdbc.driver.OracleDriver";
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String id, pw, phone;

			%>
			
			<%
				try
				{
				   request.setCharacterEncoding("utf-8");
				   Class.forName(drive);
				   con = DriverManager.getConnection(url, "ggozlo", "ggozlo");
				   id = request.getParameter("id");
				   pw = request.getParameter("pw");
				   phone = request.getParameter("phone");
				  
				   String sql="INSERT INTO ACCOUNT(ID, PASSWORD, PHONE) VALUES(?,?,?)";
				   psmt = con.prepareStatement(sql);
				   psmt.setString(1, id);
				   psmt.setString(2, pw);
				   psmt.setString(3, phone);

	
				   int n = psmt.executeUpdate(); //저장 성공 실패 여부 
				
				   if(n==1)//성공
				   {
					   
				      response.sendRedirect("Score_out.jsp");
				   }
				   else
				   {
				      response.sendRedirect("Data_input.jsp");
				   }
				}
				catch(Exception e)
				{
					out.print(e);
				 
				}   
			%>
		
		</body>
	</html>