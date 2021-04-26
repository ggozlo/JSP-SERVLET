<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		</head>
		<body>
			<h1>성적입력</h1>
			<form action="SI" method="post">
				이름:<input type="text" name="name"><br/>
				반:<input type="text" name="room"><br/>
				번호:<input type="text" name="num"><br/>
				국어:<input type="text" name="kor"><br/>
				영어:<input type="text" name="eng"><br/>
				수학:<input type="text" name="mat"><br/>
				<input type="submit" value="저장">
			</form>
		</body>
	</html>