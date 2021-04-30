<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		<head>
		<meta charset="UTF-8">
		<title>파일 업로드</title>
		</head>
		<body>
			<form action="FileUpLoad" method="post" enctype="multipart/form-data">
				파일이름:  <input type="file" name="fname">
						<input type="submit" value="파일 업로드">
			</form>
		</body>
</html>