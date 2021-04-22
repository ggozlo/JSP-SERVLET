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
			Cookie[] cookies = request.getCookies();
			System.out.print("cookies :"+cookies);
			
			if(cookies != null)
			{
				for(Cookie C : cookies)
				{
					if(C.getName().equals("memberID"))
							{
								response.sendRedirect("loginOK.jsp");
							}
				}
			}
		%>
	
		<form action="loginCon" method="post">
			in:<input type="text" name="mID"><br/>
			Pw:<input type="text" name="mPW"><br/>
			<input type="submit" value="Login"><br/>
		</form>
	</body>
	</html>