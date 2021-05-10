<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%
		Optional<String> name = Optional.ofNullable((String)session.getAttribute("name"));
		if(name.isEmpty())
		{
			response.sendRedirect("xloginForm.jsp");
		}
	%>
	<header>
		<h1>성적처리</h1>
	</header>

	<nav>
		<span><a href="boardindex.jsp">게시판으로</a></span>
		<span><a href="scoreForm.jsp">성적입력</a></span>
		<span><a href="scoreOut.sco">목록으로</a></span>
		<span><a href="scoreUpdate.jsp">성적수정</a></span>
		<span><a href="scoreDelete.jsp">성적삭제</a></span>
		<span><a href="scoreSearch.jsp">성적검색</a></span>
		<span><a href="logout.do">로그아웃</a></span>
	</nav>
