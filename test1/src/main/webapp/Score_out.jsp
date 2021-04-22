<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<style type="text/css">
				#tb{ border:solid 1px red; background-color: gray}
				#head{ color:blue; background-color:yellow }
				td{ border: solid 1px white;}
			</style>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		
		<body>
		
			<%! 
				Connection con;
				PreparedStatement psmt;
				ResultSet rs;
				String driver ="oracle.jdbc.driver.OracleDriver";
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String name;
				int kor, eng, mat;
			%>
			<%
				request.setCharacterEncoding("utf-8");
				Class.forName(driver);
				con=DriverManager.getConnection(url,"ggozlo","ggozlo");
				String sql ="SELECT * FROM score";
				psmt=con.prepareStatement(sql);
				rs=psmt.executeQuery();
				out.println("<table id='tb'>");
				out.println("<tr id='head'> <th>이름</th><th>국어</th><th>영어</th><th>수학</th></tr>");
				while(rs.next())
				{
					String name = rs.getString("name");
					int kor = rs.getInt("kor");
					int eng = rs.getInt("eng");
					int mat = rs.getInt("mat");
					out.print("<tr> <td>"+name+"</td><td>"+kor+"</td><td>"+eng+"</td><td>"+mat+"</tr>");
				}
			%>
		</body>
	</html>