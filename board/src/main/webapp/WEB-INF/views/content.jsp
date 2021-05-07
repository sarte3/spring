<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#form
{
	visibility: hidden;
}
</style>
<script>
	function up_form()
	{
		document.getElementById('form').style.visibility="visible";
		
	}
	
	function del_form()
	{
		document.getElementById('form').style.visibility="visible";
		document.frm1.action="delete";
		document.getElementById('btn').value='삭제';
	}
	
	function check(pwd)
	{
		if(document.frm1.pwd.value==pwd)
		{
			return true;
		}
		else
		{
			alert('비밀번호를 확인하세요!');
			return false;
		}
	}
</script>
</head>
<body>
<h1 align="center">게시판 글보기</h1>
<table width="600" align="center" border="1">
	<tr>
		<td>제목</td>
		<td>${bdto.title }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${bdto.name }</td>
	</tr>
	<tr height="300">
		<td>내용</td>
		<td>${fn:replace(bdto.content, rn, "<br>") }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${bdto.writeday }</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${bdto.readnum }</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="javascript:up_form()">수정</a> 
			<a href="javascript:del_form()">삭제</a>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div id="form">
				<form name="frm1" method="post" action="update" onsubmit="return check(${bdto.pwd})">
					<input type="hidden" name="id" value="${bdto.id }">
					비밀번호 <input type="password" name="pwd">
					<input type="submit" id="btn" value="수정">
				</form>
			</div>
		</td>
	</tr>
</table>
</body>
</html>