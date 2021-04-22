<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<script type="text/javascript">
				function check()
				{
					var f = document.formName;
					if(f.id.value =="") 
					{
						alert("아이디를 입력하세요!");
						//f.id.select();
						f.id.focus();
						return false;
					}
					if(f.id.value.length<4 || f.id.value.length >12)
					{
						alert("아이디는 5~11자 이내입니다!");
						f.id.value="";
						f.id.focus();
						return false;
					}
					for(var i=0;i<f.id.value.length;i++)
					{
						 var a=f.id.value.charAt(i);
						 if( a>='a' && a<='z')
						{
							 
						}
						 else
						{
							 alert("아이디는 소문자만 가능합니다!");
							f.id.value="";
							f.id.focus();
							return false;
						}
					}
					// 패스워드
					if(f.pw.value =="") 
					{
						alert("패스워드를 입력하세요!");
						//f.id.select();
						f.pw.focus();
						return false;
					}
					if(f.pw.value.length<4 || f.pw.value.length >12)
					{
						alert("패스워드를 5~11자 이내입니다!");
						f.pw.value="";
						f.pw.focus();
						return false;
					}
					for(var i=0;i<f.pw.value.length;i++)
					{
						 var a=f.pw.value.charAt(i);
						 if( isNaN(f.pw.value) )
						{
							 alert("패스워드를 숫자만 가능합니다!");
								f.pw.value="";
								f.pw.focus();
								return false;
						}
						 else
						{
							 
						}
					}
					if( f.kor.value>=100 || f.kor.value<=0)
					{
						alert("국어점수는 0~100 사이로 입력하시오!");
						f.kor.value="";
						f.kor.focus();
						return false;
					}
					f.submit();
				}
			</script>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<form name="formName" action="form1.jsp" method="post">
			아이디 : <input type ="text" name="id"><br/>
			패스워드 : <input type ="password" name="pw"><br/>
			<input type ="button" value="전송" onclick="check()">
			<input type="reset" value="취소"><br/>
			국어:<input type="text" name="kor" size="10">
			</form>
		
		</body>
	</html>