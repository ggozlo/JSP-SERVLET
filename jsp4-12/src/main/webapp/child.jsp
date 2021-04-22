<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  int age = (int)session.getAttribute("age"); 
	 %>
		<h1>당신은 <%=age %>살 미성년자입니다.</h1>
	<a href="inputAge.html"><img src="E:/WEB/image/flame.jpg"  title="복귀"></a>
</body>
</html>