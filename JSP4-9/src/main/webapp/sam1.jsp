<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<html>
	
		<head>

			<meta charset="UTF-8">
			<title>Insert title here</title>
			
		</head>
		
		<body>
			<%!
				
				String name, Id , Pw,Pwr, email, phone;
				String gender;
				String []  hobby ;

			%> <!-- 선언부 -->
			
			<%
				request.setCharacterEncoding("utf-8");
				name = request.getParameter("name");// html에서 받는 변수를 ""로 묶어서 선언된 스트릭에 넣음
				Id = request.getParameter("id");
				Pw = request.getParameter("pwd");
				Pwr = request.getParameter("pwdr");
				email = request.getParameter("email");
				phone = request.getParameter("phoneNumber");
				gender = request.getParameter("gender");
				hobby = request.getParameterValues("hobby");
				
				
			%> <!-- 스크립틀릿(구현) -->
			
			
			
			
			
			
			<table border =1 >
				<thead>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>패스워드,</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>성별</th>
						<th>취미</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=name%></td>
						<td><%=Id%></td>
						<td><%=Pw%></td>
						<td><%=email%></td>
						<td><%=phone%></td>
						<td><%=gender%></td>
						<% for(String k :hobby){ out.print("<td>"+k+"</td>"); } %>
					</tr>
	
				</tbody>
				
			</table>
			
			
		</body>
		
	</html>
	
	