<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="top.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp" %>

<section>

<hr>
<br><br>
<%
	String delName = request.getParameter("name"); 

	

	String sql = "delete from SCORE where name=?";
	 pstmt = con.prepareStatement(sql);
	 pstmt.setString(1,delName);
     int n = pstmt.executeUpdate();
     
     if(n==1)
     {
     	out.print("이 름 : "+delName+" [삭제되었습니다.]");
     }
     else
     {
    	 	out.print("이 름 : "+delName+" [없는대상입니다.]");     
     }
	%>
<br><br>
<hr>
<a href="list.jsp"><button>목록으로</button></a>
</section>

<%@ include file ="footer.jsp" %>