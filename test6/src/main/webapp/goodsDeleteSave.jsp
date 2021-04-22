<%@page import="ggozlo.GoodsDAO"%>
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
			GoodsDAO gdao = new GoodsDAO();
			int n = gdao.goodsDelete( request.getParameter("deleteName"));
			
			if(n==1)
			{
				response.sendRedirect("goodsOut.jsp");
			}
		%>
	</body>
	</html>