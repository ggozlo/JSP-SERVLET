<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../top.jsp" %>

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
			
			var nameFormat = /^[가-힣]{2,5}$/;
			if( !nameFormat.test(form.name.value) )
			{
				alert("이름은 한글 2~5자리!");
				return false;
			}
			
			var telFormat = /^[\d]{3}-[\d]{4}-[\d]{4}$/;
			if( !telFormat.test(form.tel.value) )
			{
				alert("전화번호는 -포함!");
				return false;
			}
			
			var emailFormat = /^[\w]+@(\w+\.)+[\w]+$/;
			if( !emailFormat.test(form.email.value) )
			{
				alert("이메일이 양식에 맞지 않습니다!");
				return false;
			}
			return true;
		}
	</script>
	<%
		Optional<String> name = Optional.ofNullable((String)session.getAttribute("name"));
		if(!name.isEmpty())
		{
			session.removeAttribute("name");
		}
	%>
	<section>
		<form action="join.do" method="post" name="form">
			
			<table>
				<caption>회원가입</caption>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" size="20"></td> 
				</tr>
				<tr> 
					<td>패스워드</td>
					<td><input type="password" name="pw" size="20"></td> 
				</tr>
				<tr> 
					<td>이름</td>
					<td><input type="text" name="name" size="20"></td> 
				</tr>
				<tr> 
					<td>전화번호</td>
					<td><input type="text" name="tel" size="20"></td> 
				</tr>
				<tr> 
					<td>이메일</td>
					<td><input type="text" name="email" size="20"></td> 
				</tr>
				<tr> 
					<td><input type="submit" value="회원가입" onclick="return check()"></td> 
					<td><input type="reset" value="다시입력"></td> 
				</tr>
			</table>
		</form>

	</section>

<%@include file="../bottom.jsp" %>