<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직거래 결제</title>
</head>
<body>

	<!-- TOP -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
	<br>
	<br>
	<br>
	<br>
	<div id="wrap">
	<form id="insertTransactionForm" method="post" action="/post/insertTran"
							enctype="multipart/form-data" onsubmit="submitContents()">
	결제방식: <select class="form-control3" name="tranPayment" id="tranPayment">
		<option value="카드" >카드</option>
		<option value="현금결제" selected>현금결제</option>
	</select><br>
	거래방식: <input type="text" id="tranWay" name="tranWay" value="${post.postWay }"readOnly><br>
	상품명: <input type="text" id="postNo" name="postNo" value="${post.postNo }"readOnly><br>
	판매자: <input type="text" id="sellerNo" name="sellerNo" value="${post.memNo }"readOnly><br>
	구매자: <input type="text" id="memNo" name="memNo" value="${sessionScope.No}"readOnly><br>
	가격: <input type="text" id="tranPrice" name="tranPrice" value="${post.postPrice }"readOnly><br>
	<div><br>
		<c:if test="${not empty sessionScope.sid }">
			<input type="submit" class="postComplete1" value="등록"> 
		</c:if>
		<input type="button" class="postComplete2" value="취소" onclick="location.href='<c:url value="/"/>'">
	</div>
	</form>
	</div>
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
</html>