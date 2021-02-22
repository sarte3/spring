<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#con_section{
		width:1006px;
		margin:auto;
	}
	#con_section #con_first #left{
		width:500px;
		height:600px;
		text-align: center;
		float:left;
	}
	
	#con_section #con_first #right{
		width:500px;
		height:600px;
		text-align: center;
		float:right;
	}
	
	#con_section #con_first #right span
	{
		display: inline-block;
	}
	
	#con_section #subox {
		width:50px;
		height: 20px;
		border: 1px solid #bbbbbb;
	}
	
</style>
<div id="con_section">
	<div id="con_first">
		<div id="left"><img src="../resources/pimg/${pdto.mimg}" width="400" height="450"></div>
		<div id="right"><!-- 상품정보 -->
			<table width="400" align="left">
				<tr>
					<td colsapn="2">${pdto.title }</td>
				</tr>
				<tr>
					<td colspan="2">${pdto.subtitle }</td>
				</tr>
				<tr>
					<td colspan="2"><fmt:formatNumber value="${pdto.price }"/>원
					<br>로그인 후, 적립혜택이 제공됩니다</td>
				</tr>
				<tr>
					<td>판매단위</td>
					<td>${pdto.pdan }</td>
				</tr>
				<tr>
					<td>중량/용량</td>
					<td>${pdto.pwe }</td>
				</tr>
				<tr>
					<td>배송구분</td>
					<td>${pdto.bgubun }</td>
				</tr>
				<tr>
					<td>원산지</td>
					<td>${pdto.made }</td>
				</tr>
				<tr>
					<td>알레르기정보</td>
					<td>${pdto.pal}</td>
				</tr>
				<tr>
					<td>유통기한</td>
					<td>${pdto.gihan }</td>
				</tr>
				<tr>
					<td>구매수량</td>
					<td><div id="subox">
					<span onclick="suchange(0, ${pdto.price})">-</span>
					<span id="con_su">1</span>
					<span onclick="suchange(1, ${pdto.price})">+</span>
					</div></td>
				</tr>
				<tr>
					<td colspan="2">총 상품금액 : <span id="con_price"><fmt:formatNumber value="${pdto.price}"/></span>원</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="구매하기">
						<input type="button" value="장바구니 담기">
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>