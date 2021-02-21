<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <style>
  #list_section {
    width:1100px;
    margin:auto;
  }
 </style>
 <div id="list_section">
   <table width="1000" align="center">
    <tr>
    <c:set var="ck" value="1"/>
    <c:forEach var="pdto" items="${list}">
      <td> 
       <img src="../resources/pimg/${pdto.mimg}" width="300" height="350"> 
      </td>
     <c:if test="${ck%3 == 0}">
     </tr>
     <tr> 
     </c:if>
      <c:set var="ck" value="${ck+1}"/>
    </c:forEach>
    </tr>
   </table>
 </div>
 
 
 
 
 
 
 
 
 