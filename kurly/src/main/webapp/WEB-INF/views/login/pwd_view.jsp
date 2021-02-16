<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
  #uv_section {
    width:1100px;
    height:300px;
    margin:auto;
    text-align:center;
  }
  #uv_section #btn {
    width:300px;
    height:40px;
    background:purple;
    border:1px solid purple;
    color:white;
    margin-top:20px;
  }
  #uv_section #txt {
    color:purple;
    font-size:19px;
    font-weight:900;
  }
</style>
 
<div id="uv_section">
  <h3> 비밀번호 찾기 </h3>
 <c:if test="${chk == 1}">
 <img src="../resources/img/pwd_search.png"> <p>
 <div id="txt"> 고객님의 <br>비밀번호 찾기가 완료되었습니다!! <br> 
 고객님의 이메일로 비밀번호를 전송하였습니다. </div>
   <button type="button" id="btn" onclick="location='login'"> 로그인 하기 </button>
 </c:if>
 <c:if test="${chk == 2}">  
  <img src="../resources/img/pwd_search.png"> <p>
  <div id="txt"> 고객님께서 입력하신 정보가 <br> 정확한지 확인후 다시 시도해 주세요 </div> 
   <button type="button" id="btn" onclick="location='pwd_search'"> 비밀번호 다시 찾기 </button>
 </c:if>
</div>