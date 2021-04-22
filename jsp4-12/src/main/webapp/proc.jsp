<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		</head>
		
		<body>
		
			<%! String name; int kor,eng,mat,tot; %>
			
			<% 
				request.setCharacterEncoding("utf-8");
				name = request.getParameter("name");
				kor = Integer.parseInt(request.getParameter("kor"));
				eng = Integer.parseInt(request.getParameter("eng"));
				mat = Integer.parseInt(request.getParameter("mat"));
				tot = kor + eng + mat;
				
				if(tot >= 270) response.sendRedirect("hotel.jsp");
				else response.sendRedirect("dog.jsp");
			%>
		</body>
	</html>