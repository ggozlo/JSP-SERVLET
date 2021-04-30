<%@page import="ggozlo.FileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
			int size = 1024*1024*50; // 50MB
			MultipartRequest multi = new MultipartRequest(request, dir, size, "UTF-8", new DefaultFileRenamePolicy());
			
			String filename = multi.getOriginalFileName("fname");
			String fileRealName = multi.getOriginalFileName("fname");
			
			FileDAO fDao = new FileDAO();
			fDao.upLoad(filename, fileRealName);
			out.write("파일명 "+filename);
			out.write("<br/>실제 파일명 "+fileRealName);
		
		%>
		<h1>파일 업로드 성공!</h1>
		<a href="filedown.jsp">파일다운로드</a>
	</body>
</html>