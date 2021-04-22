<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<script type="text/javascript">
			</script>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
		<h1>회원가입</h1>
			<form action="memberSave.jsp" method="post" name="form">
				아이디 :<input type="text" name="id" size="20"><br/> 
				패스워드:<input type="password" name="pw"size="20"> <br/>
				<input type="submit" value="전송"> 
				<input type="reset" value="취소"> 
			</form>
		</body>
	</html>