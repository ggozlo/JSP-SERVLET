<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../top.jsp" %>
<section>
	<script type="text/javascript">
		function check()
		{
			var form = document.form;
			
			var idFormat = /^[\w]{4,8}$/;
			if( !idFormat.test(form.id.value) )
			{
				alert("아이디는 영문숫자 4~8자리!");
				return false;
			}
			
			var pwFormat = /^[\d]{4,10}$/;
			if( !pwFormat.test(form.pw.value) )
			{
				alert("패스워드는 숫자 4~10자리!");
				return false;
			}
			return true;
		}
	</script>
	<form action="login.do" method="post" name="form">
		
		<table>
			<caption>로그인</caption>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" size="10"></td> 
			</tr>
			<tr> 
				<td>패스워드</td>
				<td><input type="password" name="pw" size="10"></td> 
			</tr>
			<tr> 
				<td><input type="submit" value="로그인" onclick="return check()"></td> 
				<td><input type="reset" value="다시입력"></td> 
			</tr>
		</table>
	</form>

</section>

<%@include file="../bottom.jsp" %>
