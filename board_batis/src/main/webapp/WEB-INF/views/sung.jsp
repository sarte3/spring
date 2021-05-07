<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
  function cal(i)
  {
 	  // 점수
	  var jung = document.getElementsByClassName("jung")[i-1].value;
 	  
 	  if(!(jung>=0&&jung<=30)||isNaN(jung))
 	  {
 		  alert('중간고사 점수를 확인해주세요!')
 		  return false;
 	  }
	  var gimal = document.getElementsByClassName("gimal")[i-1].value;
	  if(!(gimal>=0&&gimal<=30)||isNaN(gimal))
 	  {
 		  alert('기말고사 점수를 확인해주세요!')
 		  return false;
 	  }
	  var chul = document.getElementsByClassName("chul")[i-1].value;
	  if(!(chul>=0&&chul<=20)||isNaN(chul))
 	  {
 		  alert('출석 점수를 확인해주세요!')
 		  return false;
 	  }
	  
	  var report = document.getElementsByClassName("report")[i-1].value;
	  if(!(report>=0&&report<=20)||isNaN(report))
 	  {
 		  alert('리포트 점수를 확인해주세요!')
 		  return false;
 	  }
	  
	  var url="ajax_cal2?jung="+jung+"&gimal="+gimal+"&chul="+chul+"&report="+report;
	  var chk=new XMLHttpRequest();
	  chk.open("get",url);
	  chk.send();
	  chk.onreadystatechange=function()
	  {
		  if(chk.readyState==4)
		  {
			  document.getElementsByClassName("hap")[i-1].value=chk.responseText;
		  }
	  }
  }
  
  
 </script>
</head>
<body>
<table width="500">
 <tr>
  <td> 중간고사 (30) </td>
  <td> 기말고사  (30)</td>
  <td> 출석 (20) </td>
  <td> 레포트 (20) </td>
  <td> 합계 </td>
 </tr>
<c:forEach var="i" begin="1" end="10">
  <tr>
   <td> <input type="text" size="3" class="jung"> </td>
   <td> <input type="text" size="3" class="gimal"></td>
   <td> <input type="text" size="3" class="chul" > </td>
   <td> <input type="text" size="3" class="report"> </td>
   <td> 
       <input type="button" value="합계" onclick="cal(${i})"> 
       <input type="text" size="4" class="hap"> 
   </td>
  </tr>
</c:forEach>
</table>
</body>
</html>