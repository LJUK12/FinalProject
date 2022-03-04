<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직거래 결제</title>
<link href='/css/directTransaction.css' rel="stylesheet" type="text/css">
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
	<div id="mainIndexBox">
	<div id="wrap">
		
	<div id='content'>
	
	<div id='form_box'>
    <form id="insertTransactionForm" method="post" action="/post/insertTran/${post.postNo }"
							enctype="multipart/form-data" onsubmit="submitContents()">
	<div>
	<h3>결제방식</h3>						
		<select class="form-control3" name="tranPayment" id="tranPayment">
		<option value="카드" >카드</option>
		<option value="현금결제" selected>현금결제</option>
	</select><br>
	</div>
	
	<div>
	<h3>거래방식</h3>
	<span class='box'><input type="text" id="tranWay" name="tranWay" class='textBox' value="${post.postWay }"readOnly></span><br>
	</div>
	
	<div>
	<h3>상품명</h3>
	<span class='box'><input type="text" id="postNo" name="postNo" class='textBox' value="${post.postNo }"readOnly></span><br>
	</div>
	
	<div>
	<h3>판매자</h3>
	<span class='box'><input type="text" id="sellerNo" name="sellerNo" class='textBox' value="${post.memNo }"readOnly></span><br>
	</div>
	
	<div>
	<h3>구매자</h3>
	<span class='box'><input type="text" id="memNo" name="memNo"class='textBox' value="${sessionScope.No}"readOnly></span><br>
	</div>
	
	<div>
	<h3>가격</h3>
	<span class='box'><input type="text" id="tranPrice" name="tranPrice" class='textBox'value="${post.postPrice }"readOnly></span><br>
	</div>
	
		<c:if test="${not empty sessionScope.sid }">
			<input type="submit" class="postComplete1" value="등록"> 
		</c:if>
		<input type="button" class="postComplete2" value="취소" onclick="location.href='<c:url value="/"/>'">
	</form>
	</div>
	</div>
	</div>
	</div>
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
</html>