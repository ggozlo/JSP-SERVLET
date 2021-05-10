<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="scoreTop.jsp"%>
	<section>
	<div>
	<h1>이름으로 삭제하기</h1>
	<form action="scoreUpdat.sco" method="post">
		변경할 대상: <input type="text" name="name"><br/>
		국어점수: <input type="text" name="kor"><br/>
		영어점수: <input type="text" name="eng"><br/>
		수학점수: <input type="text" name="mat"><br/>
		<input type="submit" value="수정">
	
	</form>
	</div>
	
	</section>
	<%@ include file="scoreBottom.jsp"%>
	
	