<%@page import="ggozlo.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	<h1>검색결과!</h1>
		<table border="1px">
			<tr>
				<th>도서명</th>
				<th>배급사</th>				
				<th>가격</th>
				<th>판매량</th>
			</tr>
			<tr>
				<td>${bookDto.name}</td>
				<td>${bookDto.publisher}</td>				
				<td>${bookDto.price}</td>
				<td>${bookDto.sales}</td>
			</tr>
		
		</table>
		
		
	</body>
</html>