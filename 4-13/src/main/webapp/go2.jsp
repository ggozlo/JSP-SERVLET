<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<%! String number,name; %>
			
			<%
				request.setCharacterEncoding("utf-8");
			name = request.getParameter("name");
			number = request.getParameter("number");
			%>
			
			<h1>현황</h1>
			<h2><%=name %></h2>
			<h2><%=number %></h2>
			<jsp:include page="go3.jsp">
				<jsp:param value="98" name="kor"/>
				<jsp:param value="85" name="eng"/>
			</jsp:include>
			
</body>
</html>