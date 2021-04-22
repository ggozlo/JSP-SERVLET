<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		
		<body>
		
		<%! String id, pw, tel, cn; %>
		<%
			id = request.getParameter("id");
			pw = request.getParameter("pw");
			tel = request.getParameter("tel");
			cn = request.getParameter("cn");
		%>
		
		</body>
	</html>