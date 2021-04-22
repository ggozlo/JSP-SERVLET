<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<section>
<br><br>
<font size=4 align="center"><u>[ - 성적을 입력해주세요 - ]</u></font>
<br><br>
<form name="form" action="delete.jsp" method="post">
<table border=1 align="center" bgcolor="#4169E1" width="250" height="50" >

<tr>
	<td>이 름</td><td><input type="text" name="name" /></td>
</tr>


</table>
<br>
<input type="submit" value="삭제" />
<input type="reset" value="다시입력" />
</form>

</section>

<%@ include file="footer.jsp" %>