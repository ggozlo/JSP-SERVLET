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
				ResultSet res =  gdao.goodsSearch(request.getParameter("searchType"));
				DecimalFormat df = new DecimalFormat("###,###");
			%>
			<table border="1px">
				<caption>상품정보</caption>
				<tr>
					<th>옷종류</th>
					<th>수량</th>
					<th>가격</th>
					<th>수익</th>
					<th>등록자</th>
					<th>등록일</th>
				</tr>
				
			
			<%
				while(res.next())
				{
					String type = res.getString("TYPE");
					String quantity = df.format(res.getInt("QUANTITY"));
					String price = df.format( res.getInt("PRICE"));
					String profit = df.format( res.getInt("QUANTITY") *res.getInt("PRICE"));
					String writer = res.getString("WRITER");
					String regdate =res.getString("REGDATE");
					out.print("<tr>	<td>"+type+"</td> <td>"+quantity+"</td>	<td>"+price+"</td> <td>"+profit+"</td><td>"+writer+"</td><td>"+regdate+"</td>	</tr>" ); 
				}
			%>
			</table><br/>
		</body>
	</html>