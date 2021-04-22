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
	<form action="scoreUpdateSave.jsp" method="post">
		변경할 대상: <input type="text" name="updateName"><br/>
		국어점수: <input type="text" name="kor"><br/>
		영어점수: <input type="text" name="eng"><br/>
		수학점수: <input type="text" name="mat"><br/>
		<input type="submit" value="수정">
		
	</form>
</body>
