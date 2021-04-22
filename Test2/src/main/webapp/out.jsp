<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
			
	<%! 
		String name;
		int kor, eng, mat;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String  driver = "oracle.jdbc.driver.OracleDriver";
		Connection con;
		PreparedStatement psmt;
		ResultSet res;
	%>
	
	<%
		
			request.setCharacterEncoding("UTF-8");
			name = request.getParameter("name");			
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ggozlo", "ggozlo");
			String sql = "SELECT * FROM SCORE";
			psmt = con.prepareStatement(sql);
			res = psmt.executeQuery();
			
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
			con.commit();
			%>
			

		</table>
		<a href="input.jsp">추가입력하러 가기</a>
		</body>
	</html>