<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%! int age; String name = "Kim"; %>
		<%  

		age = Integer.parseInt( request.getParameter("age"));
		session.setAttribute("age", age);
		
		if(age>19)response.sendRedirect("adult.jsp?name="+name );
		else response.sendRedirect("child.jsp");
		
		%>
		<%  %>
	</body>
	</html>