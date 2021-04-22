<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>로그인</h1>
		
			<form action="loginSave.jsp" method="post">
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
					<td><input type="submit" value="전송"></td> 
				</tr>
			</table>
			</form>
</body>
</html>