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
		Cookie[] cookies = request.getCookies();
	for(Cookie C : cookies)
	{
		out.print("name : " + C.getName() + "<br/>");
		out.print("name : " + C.getValue() + "<br/>");
		out.print("============================");
	}
	%>
</body>
</html>