<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.pagination {
   display: block;
   text-align: center;
}
.pagination > li > a {
	float:none;
}
#left{
	display: inline-block;
	float:left;
}
#right{
	display: inline-block;
	float:right;
}
#mount2{
	display: inline-block;
	float:left;
	margin:20px;
}
#page{
	display:inline-block;
	float:right;
	margin:20px;
}

</style>
<script>
function check_up()
{
	var chklen=$("input[type='checkbox']:checked").length;

	if(chklen>1)
	{
		alert('수정은 한 개만 가능합니다')
		return false;
	}else{
		$('#updateModal'+$("input[type='checkbox']:checked").val()).modal("show");
	}
}
function check_del()
{
	var con=confirm('선택한 직원을 삭제하시겠습니까?')
	
	if(con)
	{
		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $("input[type='checkbox']:checked");
	
		for(i=0;i<chkbox.length;i++) {
			send_array[send_cnt] = chkbox[i].value;
			send_cnt++;
		   
		}
		
		location.href='delete?ids='+send_array;
		return true;
	}
	else
	{
		return false;	
	}
}

function chkNo(form)
{
	var id=form.id.value;
	alert(id)
	
	var eno=$("#eno"+id).val();
	var url="ajax_chk?eno="+eno;
	
	var chk=new XMLHttpRequest();
	chk.open("get", url);
	chk.send();
	
	chk.onreadystatechange=function()
	{
		if(chk.readyState==4)
		{
			
			if(chk.responseText==1){
				$("#empText"+id).text()='중복된 직원번호입니다';
			}
			else{
				$("#empText"+id).text()='사용 가능합니다';
			}
		}
	}
}

	
function check(form)
{
	
	var id=form.id.value;
	alert(id)
	
	if(!(document.getElementById('empText'+id).innerText=='사용 가능합니다'))
	{
		alert('직원 번호를 확인해주세요!')
		return false;
	}
	
	if($('#job'+id).val()=='')
	{
		alert('직급을 입력해주세요!')
		return false;
	}
	
	if($('#name'+id).val()=='')
	{
		alert('이름을 입력해주세요!')
		return false;
	}
	
	if($('#tel'+id).val()=='')
	{
		alert('전화번호를 입력해주세요!')
		return false;
	}
	
	if($('#email'+id).val()=='')
	{
		alert('이메일을 입력해주세요!')
		return false;
	}
	
	var nameRule = /^[가-힣]{2,10}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	
	if(!nameRule.test($('#name'+id).val())) {            
		alert('이름을 확인해주세요!')
		return false;
	}
	
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(!emailRule.test($('#email'+id).val())) {            
		alert('이메일 형식을 확인해주세요!')
		return false;
	}

	var telRule = /^\d{2,3}-\d{3,4}-\d{4}$/;
	
	if(!telRule.test($('#tel'+id).val())) {            
		alert('전화번호 형식을 확인해주세요!')
		return false;
	}
	
	return true;
}

</script>
</head>
<body>
	<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</button>
					<h3 class="modal-title" id="exampleModalLabel">직원 등록</h5>
				</div>
				<div class="modal-body"><jsp:include page="write.jsp"/></div>
			</div>
		</div>
	</div>
<h1 align="center">직원 목록</h1>
<div id="header">
	<div id="left">
		<button class="btn btn-default" id="write">등록</button>
		<button class="btn btn-default" onclick="check_up();">수정</button>
		<button class="btn btn-default" onclick="return check_del();">삭제</button>
	</div>
	<div id="right">
		<select name="mount" id=mount>
			<option value="10">보기 선택</option>
			<option value="5">5개씩 보기</option>
			<option value="10">10개씩 보기</option>
			<option value="15">15개씩 보기</option>
			<option value="20">20개씩 보기</option>
			<option value="25">25개씩 보기</option>
		</select>
		<form method="get" action="list">
			<select name="category">
				<option value="name">직원명</option>
				<option value="eno">직원번호</option>
				<option value="job">직급</option>
				<option value="tel">전화번호</option>
				<option value="email">이메일</option>
				<option value="updateday">수정일</option>
			</select>
			<input type="text" name="word" value="${word}">
			<input type="submit" value="검색">
		</form>
	</div>
</div>

<table class="table">
	<tr>
		<th></th>
		<th></th>
		<th>직원번호</th>
		<th>직원명</th>
		<th>직급</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>수정일</th>
	</tr>
	<c:forEach var="dto" items="${list}">
		<tr>
		<td>
		<td><div class="modal fade" id="updateModal${dto.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</button>
						<h3 class="modal-title">직원 정보 수정</h5>
					</div>
					<div class="modal-body">
					<form method="post" action="update_ok" onsubmit="return check(this.form);">
					<input type="hidden" name="id" id="id${dto.id}" value="${dto.id }">
					<table class="table">
						<tr>
							<td>직원번호</td>
							<td><input type="text" name="eno" id="eno${dto.id}" value="${dto.eno }"><button class="btn btn-default" onclick="javascript:chkNo(this.form);">중복체크</button><span id="empText${dto.id }"></span></td>
						</tr>
						<tr>
							<td>직원명</td>
							<td><input type="text" name="name" id="name${dto.id}" value="${dto.name }"></td>
						</tr>
						<tr>
							<td>직급</td>
							<td><input type="text" name="job" id="job${dto.id}" value="${dto.job }"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="tel" id="tel${dto.id}" value="${dto.tel}"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" id="email${dto.id}" value="${dto.email }"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="btn btn-primary" value="수정">
								<input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
							</td>
						</tr>
					</table>
					</form>
					</div>
				</div>
			</div>
		</div>
		</td>
		<td><div class="modal fade" id="contentModal${dto.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</button>
					<h3 class="modal-title">직원 상세 정보</h5>
				</div>
				<div class="modal-body">
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
					<tr>
						<td colspan="2">
						<button data-dismiss="modal" class="btn btn-default">닫기</button>
						</td>
					</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
		<td><input type="checkbox" name="id${dto.id}" id="chkbox${dto.id}" value="${dto.id}"></td>
			<td>${dto.eno }</td>
			<td><a href="javascript:open(${dto.id});">${dto.name }</a></td>
			<td>${dto.job}</td>
			<td>${dto.tel }</td>
			<td>${dto.email }</td>
			<td>${dto.updateday }</td>
		</tr>
	</c:forEach>
</table>
	<div id="page_nav">
		<nav>
			<ul class="pagination">
				<c:if test="${page ==1 }">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">&lt;</a></li>
				</c:if>
				<c:if test="${page !=1 }">
					<li class="page-item"><a class="page-link"
						href="/web/list?page=${page-1}&word=${word}">&lt;</a></li>
				</c:if>
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${i!=page}">
						<li class="page-item"><a class="page-link"
							href="/web/list?page=${i}&word=${word}">${i}</a></li>
					</c:if>
					<c:if test="${i==page}">
						<li class="page-item active"><a class="page-link"
							href="/web/list?page=${i}&word=${word}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != page_cnt}">
					<li class="page-item"><a class="page-link"
						href="/web/list?page=${page+1}&word=${word}">&gt;</a></li>
				</c:if>
				<c:if test="${page == page_cnt}">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">&gt;</a></li>
				</c:if>

			</ul>
		</nav>
		<span id="mount2">총 ${chong} 건</span>
		<span id="page">${page} / ${page_cnt}페이지</span>
	</div>
	
</body>
<script>
	$('#write').click(function(e){
		e.preventDefault();
		$('#writeModal').modal("show");
	});
	
	$('#mount').change(function(){
		location.href='list?mount='+$('#mount').val();
	});
	
	function open(id)
	{
		$('#contentModal'+id).modal("show");
	}
	
</script>
</html>