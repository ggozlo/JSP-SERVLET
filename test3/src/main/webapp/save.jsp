<%@page import="ggozlo.AccountDAO"%>
<%@page import="ggozlo.AccountDTO"%>
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
				AccountDTO adto = 
					new AccountDTO( request.getParameter("id"), request.getParameter("pw"), request.getParameter("name"), request.getParameter("tel") );
				AccountDAO adao = new  AccountDAO();
				int n =  adao.addAccount(adto);
				if(n==1)
				{
					out.print("입력 성공!");
				}
				else
				{
					out.print("입력 실패!");
				}
				out.print("<a href='print.jsp'>목록조회</a>");
				out.print("<a href='input.jsp'>추가입력</a>");
			
			
			%>
		</body>
	</html>