<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	function chkNo()
	{
		var empno=document.getElementById('empno').value;
		var url="ajax_chk?empno="+empno;
		
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

		$("#empno").keyup(function() {
		    var regNumber = /^[0-9]*$/;
		    var temp = $("#empno").val();
		    if(!regNumber.test(temp))
		    {
		        $("#empno").val(temp.replace(/[^0-9]/g,""));
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
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!emailRule.test($('#email').val())) {            
			alert('이메일 형식을 확인해주세요!')
			return false;
		}
	
		var telRule = /^\d{3}-\d{3,4}-\d{4}$/;
		
		if(!telRule.test($('#tel').val())) {            
			alert('전화번호 형식을 확인해주세요!')
			return false;
		}
		
		return true;
	}
</script>

</head>
<body>
<h1>직원 정보 등록</h1>
<form method="post" action="write_ok" onsubmit="return check();">
	<table>
		<tr>
			<td>직원번호</td><td><input type="text" name="empno" id="empno" onblur="chkNo();"><span id="empText"></span></td>
		</tr>
		<tr>
			<td>직급</td><td><input type="text" name="job" id="job"></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td>전화번호</td><td><input type="text" name="tel" id="tel"></td>
		</tr>
		<tr>
			<td>이메일</td><td><input type="text" name="email" id="email"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="직원 입력"></td>
		</tr>
	</table>
</form>
</body>
</html>