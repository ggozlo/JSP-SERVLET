<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<%! int kor, eng;
				int sum; %>
			<%  
			kor = Integer.parseInt( request.getParameter("num1"));
			eng = Integer.parseInt( request.getParameter("num2"));
			sum = kor + eng ; 
		
			%>

			<ul type="square">
				<li>국어 : <%=kor %></li>
				<li>영어 : <%=eng %></li>
				<li>합계 : <%=sum %></li>
			</ul>
			
			<%@include file ="addInclude.jsp" %>

			<!--  <a href="4-12.html">처음으로 이동</a> -->
			<% response.sendRedirect("4-12.html");// 인식되면 해당 url로 보내벌미 %>

		</body>
	</html>