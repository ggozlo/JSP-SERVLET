<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		
		<body>
			<%! String name; int qtt, price, profit; %>
			<%
				request.setCharacterEncoding("utf-8");
				name = request.getParameter("name");
				qtt = Integer.parseInt(request.getParameter("quantity"));
				price = Integer.parseInt(request.getParameter("price"));
				profit = qtt * price;
			%>
		
			<ul>
				<li><%=name %></li>
				<li><%=qtt %></li>
				<li><%=price %></li>
				<li><%=profit %></li>
			
			</ul>
		</body>
	</html>