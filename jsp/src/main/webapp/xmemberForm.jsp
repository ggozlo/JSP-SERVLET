
	
	
	
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

	<header>
		<h1>회원가입</h1>
	</header>

	<nav>

	</nav>
    <section>
	<h1>회원가입</h1>
			<form action="join" method="post">
				아이디:<input type="text" name="id"><br/>
				PW :<input type="text" name="pw"><br/>
				이름 :<input type="text" name="name"><br/>
				<input type="submit" value="저장">
			</form> 
			
			<a href="xloginForm.jsp">로그인</a></section>
	<footer>
		@
	</footer>
</body>
</html>