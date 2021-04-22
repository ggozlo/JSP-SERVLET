<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		
		<body>
			
			<form action="Score_input.jsp" method="post">
	
			   이름 : <input type ="text" name="name" size="10"><p>
			   국어 : <input type ="text" name="kor" size="10"><p>
			   영어 : <input type ="text" name="eng" size="10"><p>
			   수학 : <input type ="text" name="mat" size="10"><p>
		      <input type ="submit" value="전송"><p>
		      <input type ="reset" value="취소"><p>
			</form>
		</body>
	</html>