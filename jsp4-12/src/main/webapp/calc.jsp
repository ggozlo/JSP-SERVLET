<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%! int tot; double avg; char grades; String name; %>
		<% 
			name = (String)session.getAttribute("name");
			//tot =  (int)session.getAttribute("tot");
			tot =  Integer.parseInt( request.getParameter("tot"));
			avg = tot /3.;//(Math.round( (tot /3.)  * 10.)) /10.   ;
			if(avg >= 90) grades = 'A';
			else if(avg >= 80) grades = 'B';
			else if(avg >= 80) grades = 'C';
			else if(avg >= 80) grades = 'D';
			else grades ='F';
		%>

		<ul>
			<li>총점 : <%=tot %></li>
			<li>총점 : <fmt:formatNumber type="number" pattern="#,##0.#"><%=avg %></fmt:formatNumber></li>
			<li>총점 : <%=tot %></li>
			
		</ul>
		

	</body>
</html>