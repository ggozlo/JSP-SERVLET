<%@page import="java.util.Arrays"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
<h1>설문 조사 결과</h1>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	
	Context context = new InitialContext();
	DataSource dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
	con = dataSource.getConnection();
	String sql = "INSERT INTO RESEARCH VALUES (?,?,?)";
	psmt = con.prepareStatement(sql);
	psmt.setString(1, request.getParameter("name"));
	psmt.setString(2, request.getParameter("gender"));
	psmt.setString(3, Arrays.toString(request.getParameterValues("season")));
	psmt.executeUpdate();
	con.commit();
	psmt.close();
	con.close();
%>
	
<%
	context = new InitialContext();
	dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
	con = dataSource.getConnection();
	sql = "SELECT * FROM RESEARCH";
	psmt = con.prepareStatement(sql);
	res = psmt.executeQuery();
	res.next();
	
%>
이름: <strong> <%=res.getString(1) %> </strong><br/>
성별: <strong> <%=res.getString(2) %> </strong><br/>
당신이 좋아하는 계절은 
<%
	

	if(res.getString(3).contains("spring"))
	{
		out.print("<strong> 봄 </strong>입니다.");
	}
	if(res.getString(3).contains("summer"))
	{
		out.print("<strong> 여름 </strong>입니다.");
	}
	if(res.getString(3).contains("fall"))
	{
		out.print("<strong> 가을 </strong>입니다.");
	}
	if(res.getString(3).contains("winter"))
	{
		out.print("<strong> 겨울 </strong>입니다.");
	}
	res.close();
	psmt.close();
	con.close();
%><br/>
<a href="researchForm.jsp">다시</a>
</body>
</html>