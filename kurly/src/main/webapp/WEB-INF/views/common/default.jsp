<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../resources/main.css">
 <script src="../resources/main.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
//택배 <=> 샛별 변하기
  /* window.onload=function()
  {
  	    var ck=0;
    	setInterval(function() //setInterval(함수, 밀리초)
    	{
    		if(ck%2 == 0)
    			document.getElementById("first_in").innerHTML="서울·경기·인천 &nbsp;<b style='color:purple'>샛별배송  </b>";
    		else
    			document.getElementById("first_in").innerHTML="수도권 이외지역 &nbsp;<b style='color:purple'>택배배송  </b>";
    		ck++;
    	},2000);
  } */
  $(function()
  {
	var ck=0;
  	setInterval(function()
  	{
  		if(ck%2 == 0)
  			$("#first_in").html("서울·경기·인천 &nbsp;<b style='color:purple'>샛별배송  </b>");
  		else
  			$("#first_in").html("수도권 이외지역 &nbsp;<b style='color:purple'>택배배송  </b>");
  		ck++;
  	},2000);
  });
  </script>
</head>
  <decorator:head/>
<body>
   <div id="first">
    <div id="inn">
     <span id="left"> 지금 가입하고 인기상품 100원에 받아가세요  &nbsp;&nbsp;&nbsp; > </span>
     <span id="right"> <span onclick="first_hide()"> X </span></span>
    </div>
   </div>
   <div id="second">
     <div id="left"> <span id="first_in"> 수도권 이외지역 &nbsp;<b style="color:purple">택배배송  </b></div>
     <div id="right"> 
       <ul>
        <c:if test="${userid != null}"> <!-- 세션이 있을경우 -->
         <li> <span>일반</span> ${name}님!! </li>
        </c:if>
        <c:if test="${userid == null}"> <!-- session이 없을경우 -->
         <li> <a href="../member/member"> 회원가입 </a></li>
         <li> <a href="../login/login"> 로그인 </a></li>
        </c:if>
         <li style="position:relative" onmouseover="view()" onmouseout="hide()"> 고객센터 
            <ul id="inner" onmouseover="view()" onmouseout="hide()">
              <li> 공지사항 </li>
              <li> 자주하는 질문 </li>
              <li> 1:1문의 </li>
              <li> 상품제안 </li>
              <li> 에코포장 피드백 </li>
            </ul>
         </li>
       </ul>
     </div>
   </div>
   <div id="third">
     <p align="center"> <img src="../resources/img/logo.png"> </p>
   </div>
   <div id="fourth">
     <ul>
      <li> 전체카테고리 </li>
      <li> 신상품 </li>
      <li> 베스트 </li>
      <li> 알뜰쇼핑 </li>
      <li> 금주혜택 </li>
      <li>   <img src="../resources/img/1.png" valign="top"> </li>
      <li id="mini"> <img src="../resources/img/2.png" valign="top"> </li>
      <li id="mini"> <img src="../resources/img/3.png" valign="top"> </li>
     </ul>
   </div>
   
     <decorator:body /> 
   
   
    <div id="eighth">
     <img src="../resources/img/bottom.png" width="1100">
   </div>
</body>
</html>