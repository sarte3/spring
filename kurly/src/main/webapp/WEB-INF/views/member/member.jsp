<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
   #mem_section {
      height:600px;
      font-size:13px;
   }
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.pkc.zip.value = data.zonecode; // 우편번호
          document.pkc.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.pkc.juso_etc.focus();
      }
  }).open();
}

 function check(my) // my = form태그를 가리킨다..
 {
	 //  아이디중복확인이 되었는지,  이메일 중복확인이 되었는지  => 중복이 아니어야 된다..
	 if(my.userid_chk.value==0)
	 {
	   alert("아이디 중복확인이 되지 않았습니다");
	   return false;
	 }
	 else if(my.email_chk.value==0)
		  {
		     alert("이메일 중복확인이 되지 않았습니다");
		     return false;
		  }
	      else
	    	 return true;
 }
</script>
<div id="mem_section">
 <form method="post" action="member_ok" name="pkc" onsubmit="return check(this)">
  <input type="hidden" name="userid_chk" value="0">  <!-- 0 => 체크 X -->
  <input type="hidden" name="email_chk" value="0">
  <table width="500" align="center">
    <caption> <h3> 회원 가입 </h3></caption>
    <tr>
     <td> 아이디 </td>
     <td>
         <input type="text" name="userid"> <br>
         <span id="uid"></span> <!-- 아이디 사용가능한지의 여부 -->
     </td>
     <td> <input type="button" value="중복확인" onclick="userid_dupcheck(this.form)"> </td>
    </tr>
    <tr>
     <td> 비밀번호 </td>
     <td colspan="2"> <input type="text" name="pwd"> </td>
    </tr>
    <tr>
     <td> 비밀번호확인 </td>
     <td colspan="2"> <input type="text" name="pwd2"> </td>
    </tr>
    <tr>
     <td> 이름 </td>
     <td colspan="2"> <input type="text" name="name"> </td>
    </tr>
    <tr>
     <td> 이메일 </td>
     <td>  <input type="text" name="email"> <br>
         <span id="ema"></span>
      </td>
     <td> <input type="button" value="중복확인" onclick="email_dupcheck(this.form)"> </td>
    </tr>
    <tr>
     <td> 휴대폰 </td>
     <td colspan="2"> <input type="text" name="phone"> </td>
    </tr>
    <tr>
     <td rowspan="3"> 주소 </td>
     <td> <input type="text" name="zip"> </td>
     <td> <input type="button" value="주소검색" onclick="juso_search()"> </td>
    </tr>
    <tr>
     <td colspan="2"> <input type="text" name="juso"> </td>
    </tr>
    <tr>
     <td colspan="2"> <input type="text" name="juso_etc"> </td>
    </tr>
    <tr>
     <td> 성별 </td>
     <td colspan="2"> 
       <input type="radio" name="sung" value="0">남자
       <input type="radio" name="sung" value="1">여자
       <input type="radio" name="sung" value="2" checked>선택안함
     </td>
    </tr>
    <tr>
     <td> 생년월일 </td>
     <td colspan="2"> <input type="text" name="birth"> </td>
    </tr>
    <!-- <tr>
     <td> 생년월일 </td>
     <td colspan="2"> 
      <div id="birthday">
       <input type="text" name="yy" placeholder="YYYY" size="6" style="width:40px;border:none;"> /
       <input type="text" name="mm" placeholder="MM" size="4" style="width:30px;border:none;"> /
       <input type="text" name="dd" placeholder="DD" size="4" style="width:30px;border:none;">
      </div> 
     </td>
    </tr> -->
    <tr>
     <td colspan="3" align="center">
       <input type="submit" value="가입하기">
     </td>
    </tr>
  </table>
 </form>
 <style>
   #birthday {
     width:200px;
     height:40px;
     border:1px solid black;
     text-align:center;
   }
 
 </style>
</div>






