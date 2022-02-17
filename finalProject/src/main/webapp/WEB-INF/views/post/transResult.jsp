<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
</head>
<body>
	<!-- TOP -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
	<br>
	<br>
	<br>
	<br>
	<div id="wrap">
		
		<h3>결제 확인</h3><br>
		결제방법: <p>${tranList.tranPayment }</p><br>
		거래방법: <p>${tranList.tranWay }</p><br>
		상품명: <p>${tranList.postNo }</p><br>
		판매자: <p>${tranList.sellerNo }</p><br>
		구매자: <p>${tranList.memNo }</p><br>
		가격: <p>${tranList.tranPrice }</p><br>
	
		<p>결제 완료</p>
	</div>
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
</html>