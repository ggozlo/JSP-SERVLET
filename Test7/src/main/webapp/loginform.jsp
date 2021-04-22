<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
	<br><br>
<form name="form" action="login.jsp" method="post">
<table border=1 align="center" bgcolor="#4169E1" width="250" height="100" >

<tr>
	<td>아이디</td><td><input type="text" name="id" /></td>
</tr>
<tr>
	<td>패스워드</td><td><input type="text" name="pw" /></td>
</tr>


</table>
<br>
<input type="submit" value="로그인" />
<input type="reset" value="다시입력" />

</form>

</section>
<%@ include file="footer.jsp" %>
