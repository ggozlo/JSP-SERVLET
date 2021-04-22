<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<h1>개인정보 입력</h1>
			<form action="accountSave.jsp" method="post">
			<table>
				<tr>
					<td>아이디 :</td> 
					<td><input type="text" name="id"></td> 
				</tr>
				<tr>
					<td>패스워드 :</td> 
					<td><input type="password" name="pw"></td> 
				</tr>
				<tr>
					<td>이름 :</td> 
					<td><input type="text" name="name"></td> 
				</tr>
				<tr>
					<td><input type="submit" value="전송"></td> 
				</tr>
			</table>
			</form>
		</body>
	</html>