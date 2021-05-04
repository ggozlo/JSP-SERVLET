<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>
<section>
			<form action="search.do" method="post">
			<table>
				<caption>검색하기</caption>
				
				<tr>
					<td>검색할 제목</td>
					<td><input type="text" name="title" ></td>
				</tr>
				<tr>
					<td><input type="submit" value="검색"></td>
					<td><input type="reset" value="다시입력"></td>
				</tr>
				

			</table>
			
		</form>

</section>

<%@ include file="bottom.jsp" %>