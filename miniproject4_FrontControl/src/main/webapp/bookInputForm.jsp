<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<form action="input.do" method="post">
				도서명 <input type="text" name="name">
				출판사<input type="text" name="publisher">
			 	가격<input type="text" name="price">
				판매량<input type="text" name="sales">
				<input type="submit" value="전송">
			</form>
		</body>
	</html>