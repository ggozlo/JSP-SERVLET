<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbcon.jsp" %>
<%@ page import="java.sql.*" %>
<section>
<br><br>
<hr>
	<%
		String sql = "UPDATE SCORE SET KOR=?, ENG=?, MAT=? WHERE NAME=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt( request.getParameter("kor")) );
		pstmt.setInt(2, Integer.parseInt( request.getParameter("eng")) );
		pstmt.setInt(3, Integer.parseInt( request.getParameter("mat")) );
		pstmt.setString(4, request.getParameter("name"));
		int n = pstmt.executeUpdate();
		if(n==1)
		{
			out.print("변경 완료");
		}
		else
		{
			out.print("변경 실패");
		}
	%>
<br><br>
<hr>
<a href="list.jsp"><button>목록으로</button></a>
</section>

<%@ include file="footer.jsp" %>