<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	<%@include file="style.css" %>
	</style>
	<meta charset="UTF-8">
	<title>회원관리</title>
</head>
<body>
	<header>
		<h1>[WELCOM!]</h1>
		사용자 : ${name}님
	</header>

	<nav>  

		<span> <a href="memberModify.jsp">회원정보 수정</a> </span> 
		<span><a href="logout.do">로그아웃</a></span> 
		<span><a href="memberJoin.jsp">회원가입 하러가기</a></span> 
		<span><a href="info.do">회원정보 조회</a></span> 
		<span><a href="list.do">회원목록 조회</a></span> 
		
	</nav>

