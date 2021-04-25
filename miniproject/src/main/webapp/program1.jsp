<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<script type="text/javascript">
				
				function check()
				{
					var form= document.form;
					if(form.id.value == '')
					{
						alert("아이디를 입력하시오!");
						return false;
					}
					
					flag = false;
					for(var i=0 ; i< form.hobby.length ; i++) 
					{ 
						if(form.hobby[i].checked) 
						{
							flag = true;
						}
					}
					if(flag == false)
					{
						alert("최소 하나의 관심 분야를 지정하시오!");
						return false;
					}
					
					var emailExp = /^[\w\W]+@[\w\.]+$/;
					if( !emailExp.test(form.email.value) )
					{
						alert("이메일 양식이 잘못되었습니다!");
						return false;
					}
					
					var telExp = /^[\d]{3}-[\d]{4}-[\d]{4}$/;
					if( !telExp.test(form.tel.value) )
					{
						alert("전화번호 양식이 잘못되었습니다!");
						return false;
					}
					if(form.pw1.value != form.pw2.value)
					{
						alert("패스워드가 다릅니다!");
						return false;
					}
					
						
					return true;
				}
				
			</script>
			<style type="text/css">
				table{ border: 2px solid blue}
				th{ border: 1px solid blue; width: 100px;}
				td{ border: 1px solid blue}
				tr{ border: 1px solid blue; height: 30px;}
			</style>
			<meta charset="UTF-8">
			<title>회원가입</title>
		</head>
		<body>
			<form action="program2.jsp" method="post" name="form">
				<table >
					<tr>
						<th>아이디</th>
						<td><input type="text"  name="id" size="10"></td>
						<th >성명</th>
						<td width="150px"><input type="text" name="name" size="10"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="text" name="pw1" size="7"></td>
						<th>패스워드 확인</th>
						<td><input type="text" name="pw2" size="7"></td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td><input type="text" name="tel" size="15"></td>
						<th>성별</th>
						<td>
							<input type="radio" value="male" name="gender">남
							<input type="radio" value="female" name="gender">여
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3"><input type="text" name="email" size="50"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><input type="text" name="address" size="50"></td>
					</tr>
					<tr>
						<th>관심분야</th>
						<td colspan="3">
							<input type="checkbox" value="computer" name="hobby">컴퓨터
							<input type="checkbox" value="sports" name="hobby">스포츠
							<input type="checkbox" value="shopping" name="hobby">쇼핑
							<input type="checkbox" value="movie" name="hobby">영화감상
						</td>
					</tr>
					<tr>
						<th>남기고<br/>싶은 글</th>
						<td colspan="3"><textarea cols="40" rows="6" name="text">회원 가입 신청합니다.</textarea></td>
					</tr>
				</table><p>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="회원 등록"  onclick="return check();">&ensp;<input type="reset" value="다시 작성"></p>
			</form>
		</body>
	</html>