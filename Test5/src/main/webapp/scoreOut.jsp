
<%@page import="ggozlo.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
	<html>
		<head>
			<style type="text/css">
				th{ border: solid 1px green; background-color: yellow}
				td{ background: gray;})
			</style>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			

	<%
		
			request.setCharacterEncoding("UTF-8");			
			ScoreDAO sdao = new ScoreDAO();
			ResultSet res =  sdao.scorePrint();
			
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
				String name = res.getString("name");
				int kor = res.getInt("kor");
				int eng = res.getInt("eng");
				int mat = res.getInt("mat");
			
				out.print("<tr>	<td>"+name+"</td>	<td>"+kor+"</td><td>"+eng+"</td><td>"+mat+"</td></tr>");
			}
			%>
			

		</table>
		<a href="input.jsp">추가입력하러 가기</a><br/>
		<a href="scoreDelete.jsp">삭제하러 가기</a><br/>
		<a href="scoreUpdate.jsp">수정하러 가기</a>
		<a href="scoreSearch.jsp">검색하러 가기</a>
		</body>
	</html>