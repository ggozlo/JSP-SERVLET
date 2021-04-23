<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="ggozlo.DTO" scope="page"/>
<jsp:setProperty property="id" name="dto"/>
<jsp:setProperty property="pw" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	String id = dto.getId();
	String pw = dto.getPw();
%>

<h2>EL표기법</h2>
아이디 : ${dto.id}
패스워드 : ${dto.pw}
<br/>
<h2>bean표기법</h2>
아이디 : <jsp:getProperty property="id" name="dto"/>
패스워드 :<jsp:getProperty property="pw" name="dto"/>
<br/>
<h2>EL - 공유자원 표기법</h2>
  아이디 : ${initParam.id}
   비밀번호 : ${initParam.pw}
</body>
</html>