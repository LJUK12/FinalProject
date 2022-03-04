<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>거래내역 상세보기</title>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<section>
			<div id="menagementWrap">
				<div style="width: 100%; height: 50px;">
					<a id="returnManager" href="/chatManager">◀돌아가기</a>
				</div>
				
				<h2>거래 내역 상세보기</h2>

			
				<div id="tranManagerDetail">
					<div id="memInf1"> 
						<input type="hidden" name="tranNo" value=${tranVO.tranNo}>
		  				<h3>거래 번호 : ${tranVO.tranNo }</h3>
		  				<h3>게시판 번호 : ${tranVO.postNo }</h3>
		  			
		  				<h3>판매자 번호 : ${tranVO.sellerNo }</h3>
		  				<h3>구매자 번호 : ${tranVO.memNo }</h3>
		  				<h3>거래 날짜 : ${tranVO.tranDate }</h3>
	  				</div>
	  				
	  				<div id="memInf1"> 
		  				<h3>결제 방법</h3>
		  				<p class='box-id'>
		  					<span class='textBox' readonly>${tranVO.tranPayment }</span>
		  				</p>
		  			
		  				<h3>거래 방법</h3>
		  				<p class='box-id'>
		  					<span class='textBox' readonly>${tranVO.tranWay }</span>
		  				</p>
		  			
		  				<h3>거래 주소</h3>
		  				<p class='box-id'>
		  					${tranVO.tranAddress }
	  					</p>
	  				</div>
  				</div>
	  		</div>
		</section>
	</body>
</html>