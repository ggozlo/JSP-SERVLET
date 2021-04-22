<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Comparator"%>
<%@page import="ggozlo.AccountDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ggozlo.AccountDTO"%>
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
		
		<table border="2px" style="border-color: blue"> 
			<caption><strong>회원 테이블</strong></caption>
			<tr>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>전화번호</th>
			</tr> 
		<%
			List<AccountDTO> list = new ArrayList<>();
			AccountDAO adao = new AccountDAO();
			list = adao.getAccountDTO();
			
			List<AccountDTO> slist = list.stream().sorted(Comparator.comparing( AccountDTO:: getName )).collect(Collectors.toList());
			for(AccountDTO ad : slist)
			{
				out.print("<tr>	<td>"+ad.getId()+"</td>	<td>"+ad.getPw()+"</td><td>"+ad.getName()+"</td><td>"+ad.getTel()+"</td></tr>");
			}
			
		%>
		
		</table>
		</body>
	</html>