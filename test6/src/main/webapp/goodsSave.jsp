<%@page import="ggozlo.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdto" scope="page" class="ggozlo.GoodsDTO"/>
<jsp:setProperty property="clothType" name="gdto"/>
<jsp:setProperty property="quantity" name="gdto"/>
<jsp:setProperty property="price" name="gdto"/>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<%!
				GoodsDAO gdao = new GoodsDAO();
				int n=0;
			
			%>
			
			<%
				gdto.setWriter( (String)session.getAttribute("id"));
				n = gdao.goodsSave(gdto);
				
				if(n==1)
				{
					out.print("입력완료<br/>");
					response.sendRedirect("goodsOut.jsp");
				}
			%>
		</body>
	</html>