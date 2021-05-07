<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="login_ok">
		아이디<input type="text" name="userid"><br>
		비밀번호<input type="password" name="pwd"><br>
		<input type="submit" value="로그인">
		<c:if test="${chk==1}">
			<span style="color:red;">아이디 혹은 비번을 확인해 주세요</span>
		</c:if>
		<c:if test="${chk==2}">
			<span style="color:red;">회원만 볼 수 있는 페이지입니다 로그인 해주세요</span>
		</c:if>
	</form>
</body>
</html>