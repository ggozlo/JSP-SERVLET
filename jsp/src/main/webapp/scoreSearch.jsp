<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
s
	<%@ include file="scoreTop.jsp"%>
	<section>
	<div>
	<h1>이름으로 검색하기</h1>
	<form action="scoreSearch.sco" method="post">
		검색할 대상: <input type="text" name="SearchName"><br/>
		<input type="submit" value="검색">
		
	</form>
	</div>
	</section>
	<%@ include file="scoreBottom.jsp"%>
	
	