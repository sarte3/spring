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
<h1>게시판 글 보기</h1>
<table>
	<tr>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<c:forEach var="dto" items="${list}">
	<tr>
		<td><a href="content?id=${dto.id}">${dto.title }</a></td>
		<td>${dto.name }</td>
		<td>${dto.writeday }</td>
		<td>${dto.readnum }</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="2">
			<c:forEach var="i" begin="${pstart}" end="${pend}">${i} </c:forEach>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="write">글쓰기</a>
		</td>
	</tr>
</table>
</body>
</html>