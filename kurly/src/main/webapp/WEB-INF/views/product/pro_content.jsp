<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#con_section{
		width:1006px;
		height:1200px;
		margin:auto;
	}
	#con_section #con_first{
		width:1006px;
		height: 600px;
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
	
	#con_section td 
	{
		height: 50px;
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
	</div><!-- 상품 그림과 내용 -->
	<!-- 상품설명, 상품이미지, 상세정보, 고객후기, 상품문의-->
	<ul id="con_menu">
		<li class="con_li" onclick="img_change('${pdto.pcon}', this)">상품설명</li>
		<li class="con_li" onclick="img_change('${pdto.pimg}', this)">상품이미지</li>
		<li class="con_li" onclick="img_change('${pdto.pinfo}', this)">상세정보</li>
		<li>고객후기</li>
		<li>상품문의</li>
	</ul>
	<!-- 실제 내용이 나오는 부분 -->
	<div id="con_content">
		<img src="../resources/pimg/${pdto.pcon}" id="con_img">
	</div>
</div>
<style>
#con_section #con_menu{
	margin-top:50px;
	margin-left:50px;
}

#con_section #con_menu li{
	display: inline-block;
	list-style-type:none;
	width:150px;
	height:30px;
	border:1px solid #cccccc;
	text-align: center;
	line-height: 30px;
	background: #eeeeee;
}
#con_section #con_content{
	width:1000px;
	height:500px;
	margin:auto;
}
</style>