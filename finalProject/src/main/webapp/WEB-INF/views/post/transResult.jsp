<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href='/css/transResult.css' rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TOP -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="mainIndexBox">
	<div id="wrap">
		
	<div id='content'>
	
	<div id='form_box'>
		
		<h3>결제 확인</h3><br>
		
		<div>
		<h3>결제방법</h3>		
		<span class='box'><input type="text"class='textBox' value="${tranList.tranPayment }"readOnly></span><br>
		</div>
		
		<div>
		<h3>거래방법</h3>		
		<span class='box'><input type="text"class='textBox' value="${tranList.tranWay }"readOnly></span><br>
		</div>
		
		<div>
		<h3>상품명</h3>		
		<span class='box'><input type="text"class='textBox' value="${tranList.postNo }"readOnly></span><br>
		</div>
		
		<div>
		<h3>판매자</h3>		
		<span class='box'><input type="text"class='textBox' value="${tranList.sellerNo }"readOnly></span><br>
		</div>
		
		<div>
		<h3>구매자</h3>		
		<span class='box'><input type="text"class='textBox' value="${tranList.memNo }"readOnly></span><br>
		</div>
		
		<div>
		<h3>가격</h3>		
		<span class='box'><input type="text" class='textBox' value="${tranList.tranPrice }"readOnly></span><br>
		</div>
		
		<div>
		<h3>거래일</h3>		
		<span class='box'><input type="text"  class='textBox' value="${tranList.tranDate }"readOnly></span><br>
		</div>
		
		<div>
		<h3>택배 거래 주소</h3>		
		<span class='box'><input type="text" class='textBox' value="${tranList.tranAddress }"readOnly></span><br>
		</div>

		
	</div>
	</div>
	</div>
	</div>
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
</html>