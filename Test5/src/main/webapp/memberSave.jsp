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
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String driver = "oracle.jdbc.driver.OracleDriver";
		%>
		
		<%
			request.setCharacterEncoding("UTF-8");
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ggozlo", "ggozlo");
			String sql = "INSERT INTO MEMBER VALUES (?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, request.getParameter("id"));
			psmt.setString(2, request.getParameter("pw"));
			int n = psmt.executeUpdate();
			con.commit();
			con.close();
			
			if(n==1) out.print("전송완료");
			else out.print("전송실패");
			
			
		%>
		<a href="memberIn.jsp">추가입력</a><br/>
		<a href="login.jsp">로그인창</a>
		</body>
	</html>