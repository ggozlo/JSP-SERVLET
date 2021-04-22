<%@page import="ggozlo.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="accountDto" scope="page" class="ggozlo.AccountDTO"/>
<jsp:setProperty property="id" name="accountDto"/>
<jsp:setProperty property="pw" name="accountDto"/>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		
		<body>
		
			<%! int n; 
				AccountDAO adao = new AccountDAO(); 
			%>
			
			<%
				request.setCharacterEncoding("UTF-8");
				n = adao.AccountLogin(accountDto.getId(), accountDto.getPw());
				if(n==1)
				{
					session.setAttribute("id", accountDto.getId() );
					response.sendRedirect("goodsOut.jsp");
				}
				else
				{
					response.sendRedirect("accountInput.jsp");
				}
			%>
		</body>
	</html>