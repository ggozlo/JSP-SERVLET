<%@page import="ggozlo.MemberDTO"%>
<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="top.jsp" %>
	<%
		Optional<MemberDTO> mdto = Optional.ofNullable( (MemberDTO)request.getAttribute("mdto") );
		if(mdto.isEmpty())
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<section>

			<table>
				<caption> ${name} 회원정보 조회</caption>

				<tr> 
					<th>ID</th>
					<td>${mdto.id}</td>
				</tr>
				<tr>
					<th>PW</th>
					<td>${mdto.pw}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${mdto.name}</td> 
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${mdto.tel}</td> 
				</tr>
				<tr>
					<th>이메일 주소</th>
					<td>${mdto.email}</td> 
				</tr>
			</table>

	</section>

<%@include file="bottom.jsp" %>