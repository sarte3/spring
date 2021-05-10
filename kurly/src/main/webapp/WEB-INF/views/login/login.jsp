<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  #login_section {
    width:1100px;
    height:400px;
    margin:auto;
  }
  #login_section #f1 {
    margin-top:60px;
  }
  #login_section > div {
    width:300px;
    height:50px;
  }
  #login_section #f3 #left {
    float:left;
    font-size:13px;
  }
  #login_section #f3 #right {
    float:right;
    font-size:13px;
  }
  #login_section #frm1 {
    width:300px;
    height:40px;
    border:1px solid #dddddd;
  }
  #login_section #frm2 {
    width:300px;
    height:40px;
    background:purple;
    border:1px solid purple;
    color:white;
  }
  #login_section #frm3 {
    width:300px;
    height:40px;
    color:purple;
    border:1px solid purple;
    background:white;
  }
</style> 
<form method="post" action="login_ok">
<div id="login_section" align="center">
  <div id="f1"> 로그인 </div>
  <div> <input type="text" name="userid" placeholder="아이디를 입력하세요" id="frm1" autocomplete="off"> </div>
  <div> <input type="password" name="pwd" placeholder="비밀번호를 입력하세요" id="frm1" autocomplete="off"> </div>
  <c:if test="${chk ==1}">
    <div style="color:red;font-size:13px"> 아이디 혹은 비밀번호가 틀립니다 .</div>
  </c:if>
  <div id="f3">
     <div id="left"> <input type="checkbox" checked> 보안접속 </div>
     <div id="right"> <a href="userid_search"> 아이디찾기 </a>| <a href="pwd_search"> 비밀번호찾기 </a></div>
    
  </div>
  <div> <input type="submit" value="로그인" id="frm2"> </div>
  <div> <input type="button" value="회원가입" id="frm3" onclick="location='../member/member'"> </div>
</div>
 </form>




