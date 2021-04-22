<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		
		</head>
		<body>
		
		<%! String id, pw, name, email; %>
		
		<%
		request.setCharacterEncoding("utf-8");
			id= request.getParameter("id");
		pw= request.getParameter("pw");
		name= request.getParameter("name");
		email= request.getParameter("email");
		%>
		
		<h1>개인자료</h1>
		<h3>
			<ul>
				<li>아이디 : <%=id %></li>
				<li>패스워드 : <%=pw %></li>
				<li>이름 : <%=name %></li>
				<li>이메일 : <%=email %></li>
			</ul>
		</h3>
		</body>
	</html>