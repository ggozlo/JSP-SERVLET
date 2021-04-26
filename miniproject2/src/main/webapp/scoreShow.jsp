<%@page import="java.text.DecimalFormat"%>
<%@page import="member.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>
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
				
				ArrayList<ScoreDTO> list = (ArrayList<ScoreDTO>) request.getAttribute("list");
				int cnt=1;
				DecimalFormat df =new DecimalFormat("#0.##");
				
			%>
			<table border="1px">
							<tr>
								<th>이름</th>
								<th>반</th>
								<th>번호</th>
								<th>국어</th>
								<th>영어</th>
								<th>수학</th>
								<th>총점</th>
								<th>평균</th>
								<th>등급</th>
								<th>석차</th>
								<th>등록자</th>
								<th>등록일</th>
							</tr>
			<%
				
			
				for(ScoreDTO dto : list)
				{
					char g;
					if(dto.getTot()/3. >= 90) g = 'A';
					else if(dto.getTot()/3. >= 80) g='B';
					else if(dto.getTot()/3. >= 70) g='C';
					else if(dto.getTot()/3. >= 60) g='D';
					else g='F';
					%>
							
							<tr>
								<td><%= dto.getName() %></td>
								<td><%= dto.getRoom() %></td>
								<td><%= dto.getNum() %></td>
								<td><%= dto.getKor() %></td>
								<td><%= dto.getEng() %></td>
								<td><%= dto.getMat() %></td>
								<td><%= dto.getTot() %></td>
								<td><%= df.format( dto.getTot()/3. ) %></td>
								<td><%= g %></td>
								<td><%= cnt++ %></td>
								<td><%= dto.getRegistrant() %></td>
								<td><%= dto.getRegdate() %></td>
							</tr>
						
						
					
					<% 
				}
			%>
			
			</table>
			<a href="welcome.jsp">돌아가기</a>
		</body>
	</html>