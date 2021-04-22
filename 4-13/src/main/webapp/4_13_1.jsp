<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<script type="text/javascript">
				function check() 
				{
					var t = document.form;
					for(var i=0;i<t.id.value.length;i++)
					{
						if(t.id.value.charAt(1) <'A' ||  t.id.value.charAt(1) >'Z')
						{
							alert("아이디는 대문자만 가능합니다");
							t.id.value="";
							t.id.focus();
							return false;
						}
					}
					if(t.id.value.length<5||t.id.value.length>12)
					{
						alert("아이디는 5~12자 만 가능함니다.");
						t.id.value="";
						t.id.focus();
						return false;
					}
					if( (isNaN(t.pw.value)) || t.pw.value.length != 4 )
					{
						alert("패스워드는 4자리 숫자만가능합니다.");
						t.pw.value="";
						t.pw.focus();
						return false;
					}
					if( t.tel.value.length != 11  || (isNaN(t.tel.value))  )
					{
						alert("전화번호는 11자리 숫자만가능합니다.");
						t.tel.value="";
						t.tel.focus();
						return false;
					}
					if( t.cn.value.length != 14   )
					{
						alert("주민번호는 14자리 를 입력해야합니다.");
						t.cn.value="";
						t.cn.focus();
						return false;
					}
					for(var i=0;i<t.name.value.length;i++)
					{
						if(t.name.value.charAt(1) <'A' ||  t.id.value.charAt(1) >'Z' || t.name.value.charAt(1) <'a' ||  t.id.value.charAt(1) >'z')
						{
							alert("아이디는 대문자만 가능합니다");
							t.name.value="";
							t.name.focus();
							return false;
						}
					}
					return true;
				}
			</script>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
		
			<form action="4_13_2.jsp" method="post" name="form">
			
				아이디 <input type="text" name="id"><br/>
				패스워드<input type="password" name="pw"><br/>
				전화번호<input type="text" name="tel"><br/>
				주민번호<input type="password" name="cn"><br/>
				이름<input type="text" name="name"><br/>
				<input type="submit" value="전송" onclick="return check()">
			</form>
		</body>
	</html>