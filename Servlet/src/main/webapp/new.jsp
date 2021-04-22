<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ST" method="get">
		<input type="text" name="name"> 
		<input type="submit" value="get"> 
	
	</form>
	
	<form action="ST" method="post">
		<input type="text" name="name"> 
		<input type="text" name="kor"> 
		<input type="text" name="eng"> 
		<input type="text" name="mat"> 
		<input type="submit" value="post"> 
	
	</form>
</body>
</html>