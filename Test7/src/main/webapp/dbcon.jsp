<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	 Connection con =null;
	 PreparedStatement pstmt = null ;
	 ResultSet rs  = null;
	 
     String  jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
     String  id = "ggozlo";
     String  pwd = "ggozlo";

	Class.forName("oracle.jdbc.driver.OracleDriver"); 
 	con = DriverManager.getConnection(jdbc,id,pwd); 
%>