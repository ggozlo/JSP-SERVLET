
<%@page import="java.util.List"%>
<%@page import="ggozlo.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>
<section>
			<table border="1px" style="text-align: center; width: 700px" >

			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th colspan="2">수정/삭제</th>
			</tr>
			<c:forEach items="${list}" var="bdto">
				<tr>
					<td>${bdto.bid}</td>
					<td>${bdto.bname}</td>
					<td><a href="post.do?id=${bdto.bid}"> ${bdto.btitle}</a></td>
					<td>${bdto.bdate}</td>
					<c:set var="hit" value="&#8361;${bdto.bhit}"/>
					<td> ${hit}</td>
					<td><a href="modifyPost.do?id=${bdto.bid}"><input type="button" value="수정하기"></a></td>
					<td><a href="delete.do?id=${bdto.bid }"><input type="button" value="삭제하기"></a></td>
				</tr>
				
			</c:forEach>
			<tr>
				<td colspan="6"></td>
				<td><a href="writeForm.jsp"><input type="button" value="글쓰기"></a></td>
			<tr>

	</table>

</section>

<%@ include file="bottom.jsp" %>