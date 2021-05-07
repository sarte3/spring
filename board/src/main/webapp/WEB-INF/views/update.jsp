<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="update_ok">
		<input type="hidden" name="id" value="${bdto.id }">
		이름 <input type="text" name="name" value="${bdto.name }"><br>
		제목 <input type="text" name="title" value="${bdto.title }"><br>
		내용 <textarea cols="30" rows="4" name="content">${bdto.content }</textarea><br>
		비번 <input type="password" name="pwd"><br>
		<input type="submit" value="저장">
	</form>
</body>
</html>