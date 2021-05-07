<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="write_ok" enctype="multipart/form-data">
	제목 <input type="text" name="title"><br>
	파일 <input type="file" name="fname"><br>
	<input type="submit" value="저장">
	</form>
</body>
</html>