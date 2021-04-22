<%@page import="ggozlo.AccountDAO"%>
<%@page import="ggozlo.AccountDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="accountDto" scope="page" class="ggozlo.AccountDTO"/>
<jsp:setProperty property="id" name="accountDto"/>
<jsp:setProperty property="pw" name="accountDto"/>
<jsp:setProperty property="name" name="accountDto"/>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<%!
				AccountDAO adao = new AccountDAO();;
				int n;
			%>
			
			<%
				
				request.setCharacterEncoding("UTF-8");
				n =	adao.AccountSave(accountDto);
			
				if(n==1)
				{
					out.print("입력완료<br/>");
					out.print("<a href='accountInput.jsp'>계정 추가입력 하러가기</a><br/>");
					out.print("<a href='accountOut.jsp'>계정목록 보러가기</a><br/>");
					out.print("<a href='login.jsp'>로그인 하러가기</a>");
				}
			%>
		</body>
	</html>