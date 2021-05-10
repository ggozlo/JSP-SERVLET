<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="scoreTop.jsp"%>
	<section>
	<div>
	<form action="scoreSave.sco" method="post">
				이름:<input type="text" name="name"><br/>
				국어:<input type="text" name="kor"><br/>
				영어:<input type="text" name="eng"><br/>
				수학:<input type="text" name="mat"><br/>
				<input type="submit"  value="전송">
				<input type="reset" value="취소">
			</form>			
	</div>
	</section>
	<%@ include file="scoreBottom.jsp"%>