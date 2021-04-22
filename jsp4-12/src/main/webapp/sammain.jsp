<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>
	<h1>나는 샘플 메인이다</h1>
	<a href = "Test.jsp">링크</a>
	<hr/>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:forward page="Test.jsp">
		<jsp:param name="name" value="한국인"/>
		<jsp:param name="kor" value="90" />
		<jsp:param name="eng" value="67" />
		<jsp:param name="mat" value="57" />
	</jsp:forward>
	
</body>
</html>