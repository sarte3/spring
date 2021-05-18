<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	function chkNo()
	{
		var eno=document.getElementById('eno').value;
		var url="ajax_chk?eno="+eno;
		
		var chk=new XMLHttpRequest();
		chk.open("get", url);
		chk.send();
		
		chk.onreadystatechange=function()
		{
			if(chk.readyState==4)
			{
				
				if(chk.responseText==1){
					document.getElementById('empText').innerText='중복된 직원번호입니다';
				}
				else{
					document.getElementById('empText').innerText='사용 가능합니다';
				}
			}
		}
	}
	
		
	$(document).ready(function() {

		$("#eno").keyup(function() {
		    var regNumber = /^[0-9]*$/;
		    var temp = $("#eno").val();
		    if(!regNumber.test(temp))
		    {
		        $("#eno").val(temp.replace(/[^0-9]/g,""));
		    }
		});
		
	});
	
	function check()
	{
	
		if(!(document.getElementById('empText').innerText=='사용 가능합니다'))
		{
			alert('직원 번호를 확인해주세요!')
			return false;
		}
		
		if($('#job').val()=='')
		{
			alert('직급을 입력해주세요!')
			return false;
		}
		
		if($('#name').val()=='')
		{
			alert('이름을 입력해주세요!')
			return false;
		}
		
		if($('#tel').val()=='')
		{
			alert('전화번호를 입력해주세요!')
			return false;
		}
		
		if($('#email').val()=='')
		{
			alert('이메일을 입력해주세요!')
			return false;
		}
		
		var nameRule = /^[가-힣]{2,10}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		
		if(!nameRule.test($('#name').val())) {            
			alert('이름을 확인해주세요!')
			return false;
		}
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!emailRule.test($('#email').val())) {            
			alert('이메일 형식을 확인해주세요!')
			return false;
		}
	
		var telRule = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		if(!telRule.test($('#tel').val())) {            
			alert('전화번호 형식을 확인해주세요!')
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
<form method="post" action="write_ok" onsubmit="return check();">
<table class="table">
	<tr>
		<td>직원번호</td>
		<td><input type="text" name="eno" id="eno"><a href="javascript:chkNo();">중복체크</a><span id="empText"></span></td>
	</tr>
	<tr>
		<td>직원명</td>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<td>직급</td>
		<td><input type="text" name="job" id="job"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="tel" id="tel"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" id="email"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" class="btn btn-primary" value="등록">
			<button data-dismiss="modal" class="btn btn-default">닫기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>