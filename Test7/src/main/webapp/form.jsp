<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력</title>
</head>
<body>
<section>
<br><br>
<font size=4 align="center"><u>[ - 성적을 입력해주세요 - ]</u></font>
<br><br>
<form name="form" action="input.jsp" method="post">
<table border=1 align="center" bgcolor="#4169E1" width="250" height="250" >

<tr>
	<td>이 름</td><td><input type="text" name="name" /></td>
</tr>
<tr>
	<td>국 어</td><td><input type="text" name="kor" /></td>
</tr>
<tr>
	<td>영 어</td><td><input type="text" name="eng" /></td>
</tr>
<tr>
	<td>수 학</td><td><input type="text" name="math" /></td>
</tr>

</table>
<br>
<input type="submit" value="저장" />
<input type="reset" value="다시입력" />
</form>

</section>

</body>
</html>
<%@ include file="footer.jsp" %>