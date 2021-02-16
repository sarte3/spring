<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   .main {
     list-style-type:none;
     display:inline-block;
     width:100px;
     height:30px;
   
     position:relative;
   }
   .main .sub {
     position:absolute;
     left:0px;
     padding-left:0px;
     width:80px;
     height:100px;
     border:1px solid black;
     visibility:hidden;
   }
   .main .sub li{
     list-style-type:none;
     padding-left:10px;
     margin-top:3px;
   }
 </style>
 <script>
   function view(n)
   {
	   document.getElementsByClassName("sub")[n].style.visibility="visible";
   }
   function hide(n)
   {
	   document.getElementsByClassName("sub")[n].style.visibility="hidden";
   }
 </script>
</head>
<body>
  <ul>
    <li class="main" onmouseover="view(0)" onmouseout="hide(0)"> 농산물 
      <ul class="sub">
        <li> 쌀 </li>
        <li> 잡곡 </li>
        <li> 과일 </li>
        <li> 야채 </li>
      </ul>
    </li>
    <li class="main" onmouseover="view(1)" onmouseout="hide(1)"> 수산물 
      <ul class="sub">
        <li> 생선류 </li>
        <li> 갑각류 </li>
        <li> 조개류 </li>
        <li> 가공품 </li>
      </ul>
    </li>
    <li class="main" onmouseover="view(2)" onmouseout="hide(2)"> 축산물 
      <ul class="sub">
        <li> 소고기 </li>
        <li> 돼지고기 </li>
        <li> 닭고기 </li>
        <li> 이것저것 </li>
      </ul>
    </li>
  </ul>
</body>
</html>