<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<section>
	<br><br>
<font size=4 align="center"><u>[ - 변경될 대상과 성적을 입력해주세요 - ]</u></font>
<br><br>
<form name="form" action="modify.jsp" method="post">
<table border=1 align="center" bgcolor="#4169E1" width="300" height="200" >

<tr>
	<td>변경될 이 름</td><td><input type="text" name="name" /></td>
</tr>
<tr>
	<td>변경할 국 어</td><td><input type="text" name="kor" /></td>
</tr>
<tr>
	<td>변경할 영 어</td><td><input type="text" name="eng" /></td>
</tr>
<tr>
	<td>변경할 수 학</td><td><input type="text" name="mat" /></td>
</tr>

</table>
<br>
<input type="submit" value="저장" />
<input type="reset" value="다시입력" />
</form>
	
</section>

<%@ include file="footer.jsp" %>