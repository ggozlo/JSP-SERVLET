
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
			<%! 
				String name;
				int kor, eng, mat;
			%>

			
			<%
				request.setCharacterEncoding("UTF-8");
				ScoreDAO sdao = new ScoreDAO();
					
				ResultSet res =  sdao.scoreSearch(request.getParameter("SearchName"));
			%>
			
			<table border="2px" style="border-color: blue"> 
			<caption><strong>성적 테이블</strong></caption>
			<tr>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
			</tr> 
			<%
			while(res.next())
			{
				name = res.getString("name");
				kor = res.getInt("kor");
				eng = res.getInt("eng");
				mat = res.getInt("mat");
			
				out.print("<tr>	<td>"+name+"</td>	<td>"+kor+"</td><td>"+eng+"</td><td>"+mat+"</td></tr>");
			}

			%>
			

		</table>
				
				<%
					out.println("검색 완료! <br/><a href='out.jsp'>목록보러 가기</a><br/><a href='scoreSearch.jsp'>검색하러 가기</a>" );
					
				

			%>
		</body>
	</html>