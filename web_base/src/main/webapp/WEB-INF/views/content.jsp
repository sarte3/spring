<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table">
<tr>
	<th>직원번호</th>
	<td>${dto.eno }</td>
</tr>
<tr>
	<th>직원명</th>
	<td>${dto.name }</td>
</tr>
<tr>
	<th>직급</th>
	<td>${dto.job }</td>
</tr>
<tr>
	<th>전화번호</th>
	<td>${dto.tel }</td>
</tr>
<tr>
	<th>이메일</th>
	<td>${dto.email }</td>
</tr>
<tr>
	<th>수정일</th>
	<td>${dto.updateday }</td>
</tr>
</table>
</body>
</html>