<%@page import="java.util.ArrayList"%>
<%@page import="ggozlo.MemberDTO"%>
<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="top.jsp" %>
	<%
	
		Optional<ArrayList<MemberDTO>> list = Optional.ofNullable( (ArrayList<MemberDTO>)request.getAttribute("list") );
		Optional<String> name = Optional.ofNullable( (String)session.getAttribute("name") );
		if(list.isEmpty() | name.isEmpty() )
		{
			response.sendRedirect("login.jsp");
		}

	%>
	<section>
		<table>
				<caption>회원 조회</caption>
				
				<tr>
					<th>ID</th>
					<th>이름</th>
				</tr>
			<%
			if(!name.isEmpty())
			{
				for(MemberDTO mdto : list.get() )
				{
					
			%>
				<tr> 
					<td><%= mdto.getId() %></td>
					<td><%= mdto.getName() %></td> 
				</tr>

				
				 <%
				}
			}
				 %>
			</table>

	</section>

<%@include file="bottom.jsp" %>