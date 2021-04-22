<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbcon.jsp" %>
<%@ page import="java.sql.*" %>
<section>
	<% 
		request.setCharacterEncoding("utf-8");
		String sql = "SELECT * FROM MEMBER WHERE id=? and pw=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		pstmt.setString(2, request.getParameter("pw"));
		rs = pstmt.executeQuery(); 
		
		if( rs.next()  )
		{
			session.setMaxInactiveInterval(30);
			response.sendRedirect("index.jsp");
		}
		else
		{
			
			out.print("계정이 없습니다!<br/> <a href='member.jsp'>회원가입 하기</a><br/>");
		}
	%>



</section>
<jsp:include page="footer.jsp"/>