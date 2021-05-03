
<%@page import="java.util.List"%>
<%@page import="ggozlo.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
		<table border="1px" style="text-align: center; width: 500px" >
		<caption><h3>게시판</h3></caption>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="bdto">
				<tr>
					<td>${bdto.bid}</td>
					<td>${bdto.bname}</td>
					<td><a href="post.do?id=${bdto.bid}"> ${bdto.btitle}</a></td>
					<td>${bdto.bdate}</td>
					<td>${bdto.bhit}</td>
					
				</tr>
				
			
			</c:forEach>
			<tr>
				<td colspan="4"></td>
				<td><a href="writeForm.jsp"><input type="button" value="글쓰기"></a></td>
			<tr>

	</table>
	</body>
</html>