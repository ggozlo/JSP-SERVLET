<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		</head>
		
		<body>
			<h1>정보 수정</h1>
			<form action="SM" method="post">
				변경할 대상:<input type="text" name="name"><br/>
				변경할 반:<input type="text" name="room"><br/>
				변경할 번호:<input type="text" name="num"><br/>
				변경할 국어:<input type="text" name="kor"><br/>
				변경할 영어:<input type="text" name="eng"><br/>
				변경할 수학:<input type="text" name="mat"><br/>
				<input type="submit" value="수정">
			</form>
		</body>
	</html>