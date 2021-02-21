<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script>
  function get_jung(daecode)
  {
	   var chk=new XMLHttpRequest();
	   chk.open("get","get_jung?daecode="+daecode);
	   chk.send();
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState == 4)  // value, text
		   {
		       var result=decodeURI(chk.responseText).replace(/%2F/g,"/");
		       var menu=result.split(",");
		       var jnum=Math.floor(menu.length/2);
		       // 중분류select의 크기를 먼저 지정
		       document.pkc.jung.options.length=jnum;
		       
		       for(i=0;i<jnum;i++)  // i의 값은 option태그의 index
		       {
		    	   document.pkc.jung.options[i].value=menu[i];
		    	   document.pkc.jung.options[i].text=menu[jnum+i];
		       }
		       
		   }	   
	   } 
  }
  function check(my)
  {
	  // 값들의 입력여부 체크하는 스크립트 추가
	  
	  // 대분류, 중분류를 이용하여 상품코드 만들기
	  var dae=my.dae.value;
	  var jung=my.jung.value;
	  my.pcode.value="p"+dae+jung;
	  //alert(my.pcode.value);
   }
</script>
<div id="psection">
    <!-- 상품등록 페이지 -->
 <form name="pkc" method="post" action="pwrite_ok" onsubmit="return check(this)" enctype="multipart/form-data">
  <input type="hidden" name="pcode">
  <table width="600" align="center">
    <tr>
      <td> 상품코드 </td>
      <td> 
        <select name="dae" onchange="get_jung(this.value)">
         <c:forEach var="pdto" items="${list}">
          <option value="${pdto.code}"> ${pdto.title} </option>
         </c:forEach>
        </select>
        <select name="jung">
         <c:forEach var="jdto" items="${jlist}">
          <option value="${jdto.code}"> ${jdto.title} </option>
         </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td> 상품제목 </td>
      <td> <input type="text" name="title"> </td>
    </tr> 
    <tr>
      <td> 상품요약설명 </td>
      <td> <input type="text" name="subtitle"> </td>
    </tr>
    <tr>
      <td> 메인이미지 </td>
      <td> <input type="file" name="mimg"> </td>
    </tr>
    <tr>
      <td> 상품설명 </td>
      <td> <input type="file" name="pcon"> </td>
    </tr>
    <tr>
      <td> 상품이미지 </td>
      <td> <input type="file" name="pimg"> </td>
    </tr>
    <tr>
      <td> 상품상세정보 </td>
      <td> <input type="file" name="pinfo"> </td>
    </tr>
    <tr>
      <td> 상품가격 </td>
      <td> <input type="text" name="price"> </td>
    </tr>
    <tr>
      <td> 판매단위 </td>
      <td> <input type="text" name="pdan"> </td>
    </tr>
    <tr>
      <td> 중량/용량 </td>
      <td> <input type="text" name="pwe"> </td>
    </tr>
    <tr>
      <td> 배송구분 </td>
      <td> 
        <select name="bgubun">
          <option value="0"> 샛별/택배 </option>
          <option value="1"> 샛별배송 </option>
          <option value="2"> 택배배송 </option>
        </select>
      </td>
    </tr>
    <tr>
      <td> 원산지 </td>
      <td> 
        <select name="made">
          <option value="11"> 국내산 </option>
          <option value="12"> 중국산 </option>
          <option value="13"> 미국산 </option>
          <option value="14"> 일본산 </option>
          <option value="15"> 유럽산 </option>
        </select>
      </td>
    </tr>
    <tr>
      <td> 알레르기 정보 </td>
      <td> <textarea cols="30" rows="3" name="pal"></textarea>  </td>
    </tr>
    <tr>
      <td> 유통기한(일단위) </td>
      <td> <input type="text" name="gihan" value="0"> </td>
    </tr>
    <tr>
      <td> 입고수량 </td>
      <td> <input type="text" name="su"> </td>
    </tr>
    <tr>
      <td> 할인율 </td>
      <td> <input type="text" name="halin" value="0"> </td>
    </tr>
    <tr>
     <td colspan="2" align="center"> 
       <input type="submit" value="상품등록하기">
     </td>
    </tr>
  </table>
  </form>
</div> 