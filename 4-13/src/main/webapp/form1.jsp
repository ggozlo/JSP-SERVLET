<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		
		<body>
			<%! String id, pw;  %>
			
			<% 
				request.setCharacterEncoding("utf-8");
				id = request.getParameter("id");
				pw = request.getParameter("pw");
			%>
			<h1>고객현황</h1>
			<h2>
				아이디 : <%=id %><br/>
				패스워드 : <%=pw %>
			</h2>
		</body>
	</html>