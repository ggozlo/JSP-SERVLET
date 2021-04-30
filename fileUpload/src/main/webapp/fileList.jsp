<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="ggozlo.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ggozlo.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	<table border="1px">
		<tr>
			<th>원본보기</th>
			<th>샘플</th>
			<th>다운로드</th>


		</tr>
	
	<%
		Path path = Paths.get( application.getRealPath("./upLoad") );
		FileDAO fDao =new FileDAO();
		ArrayList<FileDTO> list = (ArrayList<FileDTO>)fDao.fileList();
		for(FileDTO f : list)
		{
			
		
	%>
		<tr>
			<td><a href="<%=path.toString() %>/<%=f.getFileRealName() %>"><%=f.getFileName() %></a></td>
			<td><img src="./upLoad/<%=f.getFileRealName() %>" width="75px" height="75px"></td>
			<td><a href="<%= request.getContextPath()%>/downloadAction?file=<%= URLEncoder.encode(f.getFileRealName(), "UTF-8")%>"><%=f.getFileName() %></a></td>
		</tr>
	
	<%
		}
	
	%>
		</table>
	</body>
</html>