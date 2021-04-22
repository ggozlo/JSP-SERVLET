
<%@page import="ggozlo.ScoreDAO"%>
<%@page import="ggozlo.ScoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <jsp:useBean id="scoreDto" class="ggozlo.ScoreDTO" scope="page"/><!-- 자바 빈(jsp에서 클래스 파일 사용)  scoreDto 이름의 ScoreDTO 객체 생성 -->
   <jsp:setProperty property="name" name="scoreDto" /> <!--받은 변수값을 scoreDto의 name 프로퍼티(필드 - 메소드 중간) 저장 -->
   <jsp:setProperty property="kor" name="scoreDto" />	<!--  객체, 프로퍼티만 지정해도 알아서 일치하는 파라메터값을 가져옴 -->
   <jsp:setProperty property="eng" name="scoreDto" />
   <jsp:setProperty property="mat" name="scoreDto" />
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%!
			//String name;
			//int kor,eng,mat;
			int n;
		%>
		<%
			request.setCharacterEncoding("UTF-8");
			//name = request.getParameter("name");
			//kor = Integer.parseInt(request.getParameter("kor"));
			//eng = Integer.parseInt(request.getParameter("eng"));
			//mat = Integer.parseInt(request.getParameter("mat"));
			//name = scoreDto.getName();
			//kor = scoreDto.getKor();
			//eng = scoreDto.getEng();
			//mat = scoreDto.getMat();
			ScoreDTO sdto = new ScoreDTO(	scoreDto.getName(),
											scoreDto.getKor(),
											scoreDto.getEng(),
											scoreDto.getMat() );
			ScoreDAO sdao = new ScoreDAO();
			n = sdao.addScoreDAO(sdto);
			if(n==1)
			{
				out.print("입력완료!<br/>");
				out.print("<a href='out.jsp'>결과 보러가기</a> <br/>");
				out.print("<a href='input.jsp'>더 입력하기</a> <br/>");
			}
			else
			{
				out.print("입력실패!<br/>");
				out.print("<a href='out.jsp'>리스트 확인</a> <br/>");
				out.print("<a href='input.jsp'>다시 입력하기</a> <br/>");
			}
			
		%>


	</body>
	</html>