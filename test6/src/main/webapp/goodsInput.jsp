<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
			
		<body>
			<form action="goodsSave.jsp" method="post">
			<table>
				<tr>
					<td>옷종류 :</td> 
					<td><input type="text" name="clothType"></td> 
				</tr>
				<tr>
					<td>수량 :</td> 
					<td><input type="text" name="quantity"></td> 
				</tr>
				<tr>
					<td>단가 :</td> 
					<td><input type="text" name="price"></td> 
				</tr>
				<tr>
					<td><input type="submit" value="전송"></td> 
				</tr>
			</table>
			</form>
		</body>
	</html>