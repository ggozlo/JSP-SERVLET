<%@page import="ggozlo.BookDTO"%>
<%@page import="java.util.ArrayList"%>
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
			request.setCharacterEncoding("UTF-8");
			ArrayList<BookDTO> list = (ArrayList<BookDTO>) request.getAttribute("list");
			
		%>
		<table border="1px">
			<tr>
				<th>도서명</th>
				<th>출판사</th>
				<th>가격</th>
				<th>판매량</th>
			</tr>
		<%
			for(BookDTO b : list)
			{
				out.print("<tr><td>"+b.getName()+"</td>	<td>"+b.getPublisher()+
						"</td><td>"+b.getPrice()+"</td><td>"+b.getSales()+"</td></tr>");
			}
		%>
		</table>
		<a href="index.jsp">돌아가기</a>
	</body>
	</html>