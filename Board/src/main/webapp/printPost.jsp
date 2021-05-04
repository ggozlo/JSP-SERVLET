
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>
<section>
	
<table border="1px" width="500px">
	<tr>
		<td>${post.bid}</td>
		<td>${post.btitle}</td>
		<td>${post.bname}</td>
	</tr>
	<tr>
		<td colspan="2">${post.bdate}</td>
		<td>${post.bhit}</td>
	</tr>

	<tr>
		<td colspan="3" height="250px">${post.bcontent}</td>
	
	</tr>
	<tr>
		<td><a href="modifyPost.do?id=${post.bid}"><input type="button" value="수정하기"></a></td>
		<td><a href="delete.do?id=${post.bid }"><input type="button" value="삭제하기"></a></td>
	</tr>
</table>
		

</section>

<%@ include file="bottom.jsp" %>