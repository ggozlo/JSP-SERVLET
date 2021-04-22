<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		</head>
		<body>
		
			<%! String address; %>
			
			<%
				request.setCharacterEncoding("utf-8");
			address = request.getParameter("address");
			%>
			
			<h1>고객현황</h1>
			<jsp:include page="perform2.jsp">
				<jsp:param value="홍길동" name="name"/>
				<jsp:param value="010-1234-1234" name="phone"/>
				<jsp:param value="<%=address %>" name="add"/>
			</jsp:include>
			<h2><%=address %></h2>
		</body>
	</html>