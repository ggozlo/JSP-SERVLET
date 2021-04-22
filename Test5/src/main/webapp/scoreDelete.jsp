<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이름으로 삭제하기</h1>
	<form action="scoreDeleteSave.jsp" method="post">
		삭제할 이름: <input type="text" name="deleteName"><br/>
		<input type="submit" value="삭제">
		
	</form>
</body>
</html>