<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<%! String name ,address, phoneNumber;%>
			<%
				name = request.getParameter("name");
			phoneNumber = request.getParameter("phone");
			address = request.getParameter("add");
			%>
			
			<h2><%=name %></h2>
			<h2><%=phoneNumber %></h2>
			<h2><%=address %></h2>
		</body>
	</html>