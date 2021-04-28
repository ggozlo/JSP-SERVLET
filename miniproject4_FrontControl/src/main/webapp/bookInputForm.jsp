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
				도서명 <input type="text" name="name"><br/>
				출판사<input type="text" name="publisher"><br/>
			 	가격<input type="text" name="price"><br/>
				판매량<input type="text" name="sales"><br/>
				<input type="submit" value="전송">
			</form>
		</body>
	</html>