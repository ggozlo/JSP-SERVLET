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
				request.setCharacterEncoding("utf-8");
				String id = (String) session.getAttribute("idkey");
				int time = session.getMaxInactiveInterval();
				
				if(id != null) 
				{
			%>
			<h2>아이디:<%=id %> 세션시간 : <%=time %></h2>
			<%
			session.invalidate(); //세션시간 만료시 종료
				}
				else
				{
					out.println("세션시간경과");
				}
			%>
		</body>
	</html>