<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload=function(){
		document.frm1.search.value="${search}";
	}
</script>
</head>
<body>
<h1 align="center">게시판 글 보기</h1>
<table width="700" align="center" border="1">
	<tr>
		<td colspan="4" align="right">
			<form name="frm1" method="post" action="list">
				<select name="search">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="name">작성자</option>
				</select>
				<input type="text" name="sword" value="${sword}">
				<input type="submit" value="검색">
			</form>
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>제목</td>
		<td>조회수</td>
		<td>작성일</td>
	</tr>
	<c:forEach var="dto" items="${list}">
	<tr>
		<td>${dto.name }</td>
		<td><a href="readnum?id=${dto.id}">${dto.title }</a></td>
		<td>${dto.readnum }</td>
		<td>${dto.writeday }</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="center">
			<c:if test="${pstart!=1}">
				<a href="list?page=${pstart-1}">&lt;&lt;</a> 
			</c:if>
			<c:if test="${pstart==1}">
				&lt;&lt; 
			</c:if>
			<c:if test="${page!=1}">
				<a href="list?page=${page-1}">&lt;</a> 
			</c:if>
			<c:if test="${page==1}">
				&lt;
			</c:if>
			<c:forEach var="i" begin="${pstart}" end="${pend}"><a href="list?page=${i}">${i}</a> </c:forEach>
			<c:if test="${page<pend }">
				<a href="list?page=${page+1}">&gt;</a>  
			</c:if>
			<c:if test="${page>=pend }">
				&gt; 
			</c:if>
			<c:if test="${pageCnt!=pend}">
				<a href="list?page=${pend+1}">&gt;&gt;</a>
			</c:if>
			<c:if test="${pageCnt==pend}">
				&gt;&gt; 
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4"><a href="write">글쓰기</a></td>
	</tr>
</table>
</body>
</html>