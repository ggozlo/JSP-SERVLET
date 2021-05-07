
<%@page import="ggozlo.BoardDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="top.jsp" %>
<section>
	
<table border="1px" width="500px">
	<tr>
		<td><input type="text" name="bid" value="${post.bid}" readonly="readonly"></td>
		<td><input type="text" name="btitle" value="${post.btitle}" readonly="readonly"></td>
		<td><input type="text" name="bname" value="${post.bname}" readonly="readonly"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="bdate" value="${post.bdate}" readonly="readonly"></td>
		<td><input type="text" name="bhit" value="${post.bhit}" readonly="readonly"></td>
	</tr>
	<tr>
		
		<td><img src="./file/${post.filename}" width="100px" height="100px" ></td>
		
 
		
	</tr>
	
	<tr>
		<td colspan="3"><textarea rows="15" cols="60" readonly="readonly">${post.bcontent}</textarea></td>
	
	</tr>
	<tr>
		<td><a href="replyView.do?id=${post.bid }"><input type="button" value="댓글달기"></a></td>
		<td><a href="modifyPost.do?id=${post.bid}"><input type="button" value="글 수정하기"></a></td>
		<td><a href="delete.do?id=${post.bid }"><input type="button" value="글 삭제하기"></a></td>
	</tr>

</table>
		
		
	</section>

<%@ include file="bottom.jsp" %>