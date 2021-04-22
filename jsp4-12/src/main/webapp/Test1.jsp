<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		
		<body>
			<% request.setCharacterEncoding("utf-8"); %>
			<jsp:forward page="to.jsp">
				<jsp:param value="텔레비전" name="name"/>
				<jsp:param value="12" name="quantity"/>
				<jsp:param value="120000" name="price"/>
			</jsp:forward>
			

		</body>
	</html>