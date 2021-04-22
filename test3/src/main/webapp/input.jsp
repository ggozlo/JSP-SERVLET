<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script type="text/javascript">
				function check() 
				{
					var f = document.form;
					
					var idFormat = /^[a-zA-Zㄱ-ㅎ]*$/;
					if( !idFormat.test(f.id.value) )
					{
						alert("아이디는 문자여야 합니다!");
						f.id.value = "";
						f.id.focus();
						return false;
					}
					
					var telFormat = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
					if( !telFormat.test(f.tel.value) )
					{
						alert("전화번호 양식이 불일치 합니다!");
						f.tel.value = "";
						f.tel.focus();
						return false;
					}
					
					var pwFormat = 
					if( !pwFormat.test(f.pw.value) )
					{
						alert("패스워드 양식이 불일치 합니다!");
						f.pw.value = "";
						f.pw.focus();
						return false;
					}
					
				}
			</script>
		</head>
		
		<body>
			
			<form action="save.jsp" method="post" name="form">
				<table>
				<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
				<tr><td>패스워드</td><td><input type="text" name="pw"></td></tr>
				<tr><td>이름</td><td><input type="text" name="name"></td></tr>
				<tr><td>전화번호</td><td><input type="text" name="tel"></td></tr>
				<tr><td><input type="submit"  value="전송" onclick="return check()"></td><td><input type="reset" value="취소"></td></tr>
				</table>
			</form>
			
		
		</body>
	</html>