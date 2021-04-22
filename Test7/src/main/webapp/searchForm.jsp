<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>
<section>
<br><br>
<font size=4 align="center"><u>[ - 검색할 이름을 입력해주세요 - ]</u></font>
<br><br>
<form name="form" action="search.jsp" method="post">
<table border=1 align="center" bgcolor="#4169E1" width="250" height="50" >

<tr>
	<td>이 름</td><td><input type="text" name="name" /></td>
</tr>


</table>
<br>
<input type="submit" value="저장" />
<input type="reset" value="다시입력" />
</form>


</section>
<%@ include file="footer.jsp" %>