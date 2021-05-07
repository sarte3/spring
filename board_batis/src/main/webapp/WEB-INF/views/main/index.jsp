<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#first{
		width:1000px;
		height:40px;
		margin:auto;
	}
	#first #left{
		float:left;
	}
	#first #right{
		float:right;
	}
</style>
</head>
<body>
	<div id="first">
		<div id="left">나의 페이지</div>
		<div id="right">
			<c:if test="${userid==null}">
				<a href="login">로그인</a>
			</c:if>
			<c:if test="${userid!=null }">
				${name}님 환영!! <a href="logout">로그아웃</a>
			</c:if>
		</div>
	</div>
</body>
</html>