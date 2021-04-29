<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="top.jsp"/>
	<%
		Optional<String> name = Optional.ofNullable((String)session.getAttribute("name"));
		if(name.isEmpty())
		{
			response.sendRedirect("login.jsp");
		}
	%>
<section>
	<h1>어서오세요! ${name} 님!</h1>

</section>

<jsp:include page="bottom.jsp"/>
