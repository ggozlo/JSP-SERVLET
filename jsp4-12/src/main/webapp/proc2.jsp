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
				
				session.setAttribute("tot", tot);
				session.setAttribute("name", name);
				//response.sendRedirect("calc.jsp");
			%>
			<jsp:forward page="calc.jsp">
			<jsp:param value="<%=tot %>" name="tot"/>
			</jsp:forward>
		</body>
</body>
</html>