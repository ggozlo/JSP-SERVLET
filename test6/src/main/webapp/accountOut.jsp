<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="ggozlo.AccountDTO"%>
<%@page import="ggozlo.AccountDAO"%>
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
				
			%>
			<%
				request.setCharacterEncoding("UTF-8");
				AccountDAO adao = new AccountDAO();
				List<AccountDTO> adtoList = adao.getAccountList();
				List<AccountDTO> sortedList =  adtoList.stream().sorted(Comparator.comparing(AccountDTO::getName)).collect(Collectors.toList());
			%>
			<table border="1px">
				<caption>회원정보</caption>
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
				</tr>
				
			
			<%
				for(AccountDTO d : sortedList)
				{
					out.print("<tr>	<td>"+d.getId()+"</td><td>"+d.getPw()+"</td>	<td>"+d.getName()+"</td>	</tr>" ); 
				}
			%>
			</table><br/>
			<a href="login.jsp">로그인 화면으로 복귀</a><br/>
			<a href='accountInput.jsp'>계정 추가입력 하러가기</a><br/>
		</body>
	</html>