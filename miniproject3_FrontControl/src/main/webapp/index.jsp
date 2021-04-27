<%@page import="javax.websocket.Session"%>
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
				String name = (String)session.getAttribute("name");
			%>
			<h1>어서오세요! <%=name %>님!</h1>
			<a href="scoreModifyForm.jsp">수정하러 가기</a>
			<a href="scoreInputForm.jsp">성적입력하러 가기</a>
			<a href="scorePrint.do">성적조회하러 가기</a>
			<a href="scoreDeleteForm.jsp">성적삭제하러 가기</a><br/>
			<a href="accountModifyForm.jsp">계정 패스워드 변경하기</a>
		</body>
	</html>