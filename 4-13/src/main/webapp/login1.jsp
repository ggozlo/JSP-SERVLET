<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		
		<body>
			
			<% 
				request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String password = request.getParameter("pw");
			session.setAttribute("idkey", id);
			session.setAttribute("pwkey", password);
			session.setMaxInactiveInterval(3); // 세션대기시간 특정시간 지나면 초기화
			%>
			
			<form action="login2.jsp" method="post">
				
				<input type="submit" value="인증">
			</form>
			
		</body>
		
	</html>