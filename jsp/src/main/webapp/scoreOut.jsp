

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="scoreTop.jsp"%>
	<section>
				
			<table border="1px" style="text-align: center; width: 500px" >
			<caption><strong>성적 테이블</strong></caption>
			<tr>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
			</tr> 
			<c:forEach items="${list }" var="sdto">
				<tr>
					<td>${sdto.name }</td>
					<td>${sdto.kor }</td>
					<td>${sdto.eng }</td>
					<td>${sdto.mat }</td>
				</tr>
			
			</c:forEach>
			

		</table>
	
	</section>
	<%@ include file="scoreBottom.jsp"%>