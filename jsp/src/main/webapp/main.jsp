<%@page import="java.util.Optional"%>
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
	<%
		Optional<String> name = Optional.ofNullable((String)session.getAttribute("name"));
		if(name.isEmpty())
		{
			response.sendRedirect("xloginForm.jsp");
		}
	%>
	<header>
		<h1>메인</h1>
	</header>

	<nav>

	</nav>
    
<section>

<a href="boardindex.jsp"><input type="button" value="게시판"></a>

<a href="scoreIndex.jsp"><input type="button" value="성적처리"></a>
</section>

	<footer>
		@
	</footer>
</body>
</html>