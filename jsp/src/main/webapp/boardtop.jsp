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
		<h1>게시판</h1>
	</header>

	<nav>
		<span><a href="scoreIndex.jsp">성적처리시스템으로</a></span>
		<span><a href="postForm.jsp">글쓰기</a></span>
		<span><a href="list.do">목록으로</a></span>
		<span><a href="postModify.jsp">글수정</a></span>
		<span><a href="postDelete.jsp">글삭제</a></span>
		<span><a href="postSearch.jsp">글검색</a></span>
		<span><a href="logout.do">로그아웃</a></span>
	</nav>
