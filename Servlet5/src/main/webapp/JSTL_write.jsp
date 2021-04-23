<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="sal" value="4000"/>
	<c:if test="${sal>=5000}" >
	내연봉은 : <c:out value="${sal}"></c:out>
	</c:if><br/>
	
	<c:remove var="sal"/>
	내연봉은 : <c:out value="${sal}"></c:out>
	
	<hr>
	<c:set var="sal" value="7000"/>
	
	<c:choose>
		<c:when test="${sal>=7000}">
			<c:out value="${sal}"></c:out> 내 연봉은 많다.
		</c:when>
		<c:when test="${sal>=5000}">
			<c:out value="${sal}"></c:out> 내 연봉은 적당하다.
		</c:when>
		<c:otherwise>
			<c:out value="${sal}"></c:out> 내 연봉은 작다.
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="0" end="100" step="5">
		${i}
	
	</c:forEach>
</body>
</html>	