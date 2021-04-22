<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bt" class="com.tj.BeanSample" scope="page"></jsp:useBean>
	<!DOCTYPE html>
		<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>

			

		<body>
			<jsp:setProperty property="name" name="bt" value="홍길동"/>
			<jsp:setProperty property="kor" name="bt" value="99"/>
			<jsp:setProperty property="eng" name="bt" value="87"/>
			<jsp:setProperty property="mat" name="bt" value="45"/>
			이름:<jsp:getProperty property="name" name="bt"/><br/>
			국어:<jsp:getProperty property="kor" name="bt"/><br/>
			영어:<jsp:getProperty property="eng" name="bt"/><br/>
			수학:<jsp:getProperty property="mat" name="bt"/>
		</body>
	</html>