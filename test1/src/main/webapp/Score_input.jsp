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
				String name;
				int kor, eng, mat;
			%>
			
			<%
				try
				{
				   request.setCharacterEncoding("utf-8");
				   Class.forName(drive);
				   con = DriverManager.getConnection(url, "ggozlo", "ggozlo");
				   name = request.getParameter("name");
				   kor = Integer.parseInt(request.getParameter("kor"));
				   eng = Integer.parseInt(request.getParameter("eng"));
				   mat = Integer.parseInt(request.getParameter("mat"));
				  
				   String sql="INSERT INTO SCORE(NAME, KOR, ENG, MAT) VALUES(?,?,?,?)";
				   psmt = con.prepareStatement(sql);
				   psmt.setString(1, name);
				   psmt.setInt(2, kor);
				   psmt.setInt(3, eng);
				   psmt.setInt(4, mat);
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