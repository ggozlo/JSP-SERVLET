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
					
					var pwFormat = /^[\d]{4}$/;
					if( !pwFormat.test(f.pw.value) )
					{
						alert("패스워드는 4자리 숫자여야 합니다!");
						f.pw.value = "";
						f.pw.focus();
						return false;
					}
					
					var pwFormat = /^[\d]{4}$/;
					if( !pwFormat.test(f.pw.value) )
					{
						alert("패스워드는 4자리 숫자여야 합니다!");
						f.pw.value = "";
						f.pw.focus();
						return false;
					}
					
					var nameFormat = /^[가-힣]*$/;
					if( !nameFormat.test(f.name.value) || f.name.value =="")
					{
						alert("이름는 한글문자여야 합니다!");
						f.name.value = "";
						f.name.focus();
						return false;
					}
					
					var emailFormat = /^[\w]([-_./%+]?[\w])+@[\w]+.[a-zA-Z]{2,6}$/;
					if( !emailFormat.test(f.email.value))
					{
						alert("이메일 양식이 잘못됬습니다!!");
						f.email.value = "";
						f.email.focus();
						return false;
					}
				}
			</script>
		</head>
		<body>
		
		
			<form action="regular1.jsp" name="form" method="post">
				아이디<input type="text" name="id"><br/>
				패스워드 <input type="password" name="pw"><br/>
				이름 <input type="text" name="name"><br/>
				이메일<input type="text" name="email"><br/>
				<input type="submit" value="전송" onclick="return check()">
			
			</form>
		</body>
	</html>