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
		<h1>${name}님 어서오세요!</h1>
	</header>
	<hr>
	<nav>
		<span><a href="writeForm.jsp">글쓰기</a></span>
		<span><a href="list.do">목록으로</a></span>
		<span><a href="modifyPost.jsp">글수정</a></span>
		<span><a href="deletePost.jsp">글삭제</a></span>
		<span><a href="searchPost.jsp">글검색</a></span>
		<span><a href="logout.do">로그아웃</a></span>
	</nav>
	<hr>