<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	
		<head>
			<meta charset="utf-8">
			<title>Insert title here</title>

		</head>
		
		<body>
			<%! String name; 
			int kor, eng ,mat;  %>
			
			<%
				request.setCharacterEncoding("UTF-8");
				name = request.getParameter("name");
				kor= Integer.parseInt(request.getParameter("kor"));
				eng= Integer.parseInt(request.getParameter("eng"));
				mat= Integer.parseInt(request.getParameter("mat"));
				
			
			%>
			<img src="E:/WEB/image/fantasy.jpg">
			 <ul>
				<li>이름 :<%= name %></li>
				<li>국어 :<%= kor %></li>
				<li>영어 :<%= eng %></li>
				<li>수학 :<%= mat %></li>
			</ul> 
		</body>
	</html>