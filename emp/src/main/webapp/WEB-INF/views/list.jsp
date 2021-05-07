<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload=function(){
		document.frm1.category.value="${category}";
	}
</script>
</head>
<body>
<h1>직원 정보 출력</h1>
<table>
	<tr>
		<td colspan="6"><h2>직원 검색</h2>
			<form name="frm1" method="post" action="list">
				<select name="category">
					<option value="empno">직원번호</option>
					<option value="job">직급</option>
					<option value="name">이름</option>
					<option value="tel">전화번호</option>
					<option value="email">이메일</option>
				</select>
				<input type="text" name="word" value="${word}">
				<input type="submit" value="검색">
				<a href="list">전체 보기</a>
			</form>
		</td>
	</tr>
	<tr>
		<th>직원번호</th>
		<th>직급</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th></th>
	</tr>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.empno}</td>
			<td>${dto.job}</td>
			<td>${dto.name}</td>
			<td>${dto.tel}</td>
			<td>${dto.email}</td>
			<td><a href="update?id=${dto.id}">수정</a> <a href="delete?id=${dto.id}">삭제</a><td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6"><a href="write">직원 입력</a> <a href="csvDownload">엑셀 다운로드</a></td>
		
	<tr>
</table>
</body>
</html>