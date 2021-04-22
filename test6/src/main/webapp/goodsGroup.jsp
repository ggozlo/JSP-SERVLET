<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
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
				DecimalFormat df = new DecimalFormat("###,###");
				ResultSet rs = gdao.goodsGROUP();
				
			%>
				<table border="2px" style="border-color: blue"> 
				<caption><strong>그룹 테이블</strong></caption>
				<tr>
					<th>종류</th>
					<th>수량</th>
					<th>평균가격</th>
					<th>수익</th>
				</tr> 
				<%
				while(rs.next())
				{
					String TYPE = rs.getString("TYPE");
					String QTT = df.format(  rs.getInt("QTT"));
					String PRI = df.format(	rs.getInt("PRI"));
					String PRO = df.format( rs.getInt("PRO")) ;
				
					out.print("<tr>	<td>"+TYPE+"</td>	<td>"+QTT+"</td><td>"+PRI+"</td><td>"+PRO+"</td></tr>");
				}
				%>
				
			</table>
			<a href="login.jsp">로그인 화면으로 복귀</a><br/>
				<a href='goodsInput.jsp'>상품 추가입력 하러가기</a><br/>
				<a href='goodsOut.jsp'>상품 목록 확인</a><br/>
		</body>
	</html>