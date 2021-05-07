<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글 작성하기</h1>
<form method="post" action="write_ok">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>비번</td>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content"></textarea></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="남성">남성 
				<input type="radio" name="gender" value="여성">여성
				<input type="radio" name="gender" value="선택 안함">선택 안함
			</td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<input type="checkbox" name="hobby" value="낚시">낚시
				<input type="checkbox" name="hobby" value="운동">운동
				<input type="checkbox" name="hobby" value="음주">음주
				<input type="checkbox" name="hobby" value="게임">게임
				<input type="checkbox" name="hobby" value="잠자기">잠자기
				<input type="checkbox" name="hobby" value="먹기">먹기
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="userid">@
				<select name="domain">
					<option>선택</option>
					<option value="naver.com">네이버</option>
					<option value="daum.net">다음</option>
					<option value="nate.com">네이트</option>
					<option value="outlook.kr">아웃룩</option>
					<option value="google.com">구글</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="글쓰기">
			</td>
		</tr>
	</table>
</form>
</body>
</html>