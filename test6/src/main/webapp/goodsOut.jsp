<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="ggozlo.GoodsDTO"%>
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
		
			<%! 
				
			%>
			<%
				request.setCharacterEncoding("UTF-8");
				
				GoodsDAO gdao = new GoodsDAO();
				List<GoodsDTO> gdtoList = gdao.getGoodsList();
				DecimalFormat df = new DecimalFormat("###,###");
				List<GoodsDTO> sortedList =  gdtoList.stream().sorted(Comparator.comparing(GoodsDTO::getRegDate)).collect(Collectors.toList());
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
				for(GoodsDTO d : sortedList)
				{
					String type = d.getClothType();
					String quantity = df.format( d.getQuantity());
					String price = df.format( d.getPrice());
					String profit = df.format( d.getQuantity() * d.getPrice());
					String writer = d.getWriter();
					String regdate = d.getRegDate();
					out.print("<tr>	<td>"+type+"</td> <td>"+quantity+"</td>	<td>"+price+"</td> <td>"+profit+"</td><td>"+writer+"</td><td>"+regdate+"</td>	</tr>" ); 
				}
			%>
			</table><br/>
			<a href="login.jsp">로그인 화면으로 복귀</a><br/>
			<a href='goodsInput.jsp'>상품 추가입력 하러가기</a><br/>
			<a href='goodsGroup.jsp'>그룹조회하기</a><br/>
			<a href='goodsDelete.jsp'>삭제하기</a><br/>
			<a href='goodsSearch.jsp'>검색하기</a><br/>
		</body>
	</html>