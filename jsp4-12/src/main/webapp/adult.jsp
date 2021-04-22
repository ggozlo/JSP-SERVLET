<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! int age ;
		%>
	<% age = (int)session.getAttribute("age");
		String name = request.getParameter("name");
		 %>
		 <%=name %>
		<h1>당신은 <%=age %>살 어른입니다.</h1>
	<a href="inputAge.html"> <img src="E:/WEB/image/fantasy.jpg" title="복귀"> </a>
</body>
</html>