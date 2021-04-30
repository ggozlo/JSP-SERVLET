<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<%

		String dir = application.getRealPath("./upLoad/");
		String files [] = new File(dir).list();
		for(String file : files)
		{
			out.print("<img src='./upLoad/"+file+"'>");
			out.print("<a href=\""+request.getContextPath()+
					"/downloadAction?file="+java.net.URLEncoder.encode(file,"UTF-8")+"\">"+file+"</a><br/>");
		}
	
	%>
		
	</body>
</html>