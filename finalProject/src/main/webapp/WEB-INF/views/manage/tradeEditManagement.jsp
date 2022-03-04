<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>관리자 거래 내역 페이지</title>
	<link href="<c:url value='/css/join.css'/>" rel="stylesheet" type="text/css">	
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<div id="wrap"> 
		<div id='content'>

			<h2>거래 내역 수정</h2>

			
				<div id='form_box'>
				
				<form  name="joinForm" id="joinForm" method="post" action='<c:url value="/tradeManager/tranEdit2" />'>
					<div>
						<input type="hidden" name="tranNo" value=${tranVO.tranNo}>
		  				<h3>거래 번호 : ${tranVO.tranNo }</h3>
		  				<h3>게시판 번호 : ${tranVO.postNo }</h3>
		  			</div>
		  			<br><hr><br>
		  			<div>
		  				<h3>판매자 번호 : ${tranVO.sellerNo }</h3>
		  				<h3>구매자 번호 : ${tranVO.memNo }</h3>
		  				<h3>거래 날짜 : ${tranVO.tranDate }</h3>
		  			</div>
		  			<br>
		  			
					<div>
		  				<h3>결제 방법</h3>
		  				<span class='box id'>
		  					<span class='textBox' readonly>${tranVO.tranPayment }</span>
		  				</span>
		  			</div>
		  			<div>
		  				<h3>거래 방법</h3>
		  				<span class='box id'>
		  					<span class='textBox' readonly>${tranVO.tranWay }</span>
		  				</span>
		  			</div>
					
					<c:if test="${tranVO.tranWay eq '택배거래' }">
		  			<div>
		  				<h3>거래 주소 수정</h3>
		  				<span class='box name'>
		  					<input type="text" class="textBox" id='tranAddress' name="tranAddress" maxlength="100" value="${tranVO.tranAddress }">
		  				</span>
		  				<span id='errorName'>거래 주소를 입력해주세요</span>
	  				</div>
					</c:if>
	
		  			<div>
		  				<input type="submit" value="수정하기" id='submit'>
		  				<input type="reset" value="취소하기" id="submit" onclick="location.href='<c:url value="/tradeManager"/>'">
		  			</div>
	
		  		</form>
		  		</div><!-- form_box -->
		  		
	  		</div> <!-- content -->
		</div> <!-- wrap -->
	</body>
</html>