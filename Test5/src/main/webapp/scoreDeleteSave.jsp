<%@page import="ggozlo.ScoreDAO"%>
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
		

			
			<%
				request.setCharacterEncoding("UTF-8");
				ScoreDAO sdao = new ScoreDAO();
				int n = (int)sdao.scoreDelete( request.getParameter("deleteName"));
				
				if(n==1)
				{
					out.println("삭제 완료! <br/><a href='out.jsp'>목록보러 가기</a><br/><a href='scoreDelete.jsp'>삭제하러 가기</a>" );
					
				}

			%>
		</body>
	</html>