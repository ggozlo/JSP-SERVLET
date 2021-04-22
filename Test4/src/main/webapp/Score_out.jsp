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
				String id, pw, phone;
			%>
			<%
				request.setCharacterEncoding("utf-8");
				Class.forName(driver);
				con=DriverManager.getConnection(url,"ggozlo","ggozlo");
				String sql ="SELECT * FROM ACCOUNT";
				psmt=con.prepareStatement(sql);
				rs=psmt.executeQuery();
				out.println("<table id='tb'>");
				out.println("<tr id='head'> <th>아이디</th><th>패스워드</th><th>전화번호</th></tr>");
				while(rs.next())
				{
					String id = rs.getString("ID");
					String pw = rs.getString("PASSWORD");
					String phone = rs.getString("PHONE");

					out.print("<tr> <td>"+id+"</td><td>"+pw+"</td><td>"+phone+"</td></tr>");
				}
			%>
		</body>
	</html>