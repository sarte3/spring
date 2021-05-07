<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#form {
	display: none;
}
</style>
<script>
	function up_form()
	{
		var form=document.getElementById('form');
		
		
		if(form.style.display=="none")
		{
			form.style.display="block";
		}
		else
		{
			form.style.display="none";
		}
	}
	
	function del_form()
	{
		
		var form=document.getElementById('form');
		
		
		if(form.style.display=="none")
		{
			form.style.display="block";
		}
		else
		{
			form.style.display="none";
		}
		
		document.frm.action="delete";
		document.getElementById('btn').value="삭제";
	}
	
	function check(pwd)
	{
		if(document.frm.pwd.value==pwd)
		{
			return true;
		}
		else
		{
			alert('비밀 번호를 확인해 주세요!');
			return false;
		}
	}
</script>
</head>
<body>
<h1>게시글 보기</h1>
<table>
	<tr>
		<td>제목</td>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${dto.content }</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>${dto.gender }</td>
	</tr>
	<tr>
		<td>취미</td>
		<td>${dto.hobby }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${dto.email }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${dto.writeday }</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${dto.readnum }</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="javascript:up_form()">수정</a> 
			<a href="javascript:del_form()">삭제</a>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div id="form" style="display:none;">
				<form name="frm" method="post" action="update" onsubmit="return check(${dto.pwd})">
				<input type="hidden" name="id" value="${dto.id }">
					비밀번호 <input type="password" name="pwd">
					<input type="submit" id="btn" value="수정">
				</form>
			</div>
		</td>
	</tr>
</table>
</body>
</html>