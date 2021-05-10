<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
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
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	
	
	Context context = new InitialContext();
	DataSource dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
	con = dataSource.getConnection();
	String sql = "SELECT * FROM USERS WHERE ID=? AND PW=? AND TYPE=?";
	psmt = con.prepareStatement(sql);
	psmt.setString(1, request.getParameter("id"));
	psmt.setString(2, request.getParameter("pw"));
	psmt.setString(3, request.getParameter("type"));
	res = psmt.executeQuery();
	
	res.next();
	String id  = res.getString("id");
	String type  = res.getString("type");
	String name  = res.getString("name");
	
	res.close();
	psmt.close();
	con.close();
	
	session.setAttribute("id", id);
	session.setAttribute("name", name);
	if(type.equals("admin")) response.sendRedirect("managerMain.jsp");
	else response.sendRedirect("userMain.jsp");
%>
</body>
</html>