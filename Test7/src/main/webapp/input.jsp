
<%@page import="ggozlo.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdto" class="ggozlo.ScoreDTO"  scope="page" />
<jsp:setProperty property="*" name="sdto"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	ScoreDAO sdao= new ScoreDAO();
	sdao.scoreInput(sdto);



	response.sendRedirect("list.jsp");
	
%>
</head>
<body>
<section>


</section>

</body>
</html>