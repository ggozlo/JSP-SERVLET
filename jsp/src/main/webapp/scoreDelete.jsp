<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="scoreTop.jsp"%>
	<section>
	<div>
			<h1>이름으로 삭제하기</h1>
	<form action="scoreDelete.sco" method="post">
		삭제할 이름: <input type="text" name="deleteName"><br/>
		<input type="submit" value="삭제">
				</form>
	</div>
	</section>
	<%@ include file="scoreBottom.jsp"%>