<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>거래내역 관리자 페이지</title>
	
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<section>
			<div id="menagementWrap">
				<a id="returnManager" href="/rootManager">◀돌아가기</a>
				<h2><img src="<c:url value='/image/tradeTemp.png'/>">거래내역 관리</h2>
				<div id="MngSearchDiv">
					<i class="fa-solid fa-magnifying-glass"></i>
					<input type="text" id="srchTran" class="MngSearch" placeholder="검색하기"/>
				</div>
				<div id="trTableStyle4">
					<table id="tranTable">
						<div id="trTableStyle"><tr><th>번호</th><th>결제방식</th><th>거래방식</th>
						<th>게시판</th><th>판매자</th><th>구매자</th>
						<th>가격</th><th>거래날짜</th><th>거래주소</th>
						<th>삭제</th><th>삭제</th></tr></div>
						<c:if test="${not empty tsVO }">
						<c:forEach items="${tsVO}" var="tran">
						<tr><td>${tran.tranNo }</td><td>${tran.tranPayment }</td>
							<td>${tran.tranWay }</td><td>${tran.postNo }</td>
							<td>${tran.sellerNo }</td><td>${tran.memNo }</td>
							<td>${tran.tranPrice}</td><td>${tran.tranDate }</td>
							<td><a href="<c:url value='/tradeManager/tranDetails/${tran.tranNo }'/>">${tran.tranAddress }</a></td>
							<td><a id="mngEditBtn" href="<c:url value='/tradeManager/tranEdit/${tran.tranNo }' />">수정</a></td>
							<td><a id="mngDeleteBtn" href="<c:url value='/tradeManager/tranDelete/${tran.tranNo}' />">삭제</a></td>
						</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty tsVO }">
						<tr><td colspan="10">검색 결과가 존재하지 않습니다.</td></tr>
						</c:if>
					</table>
				</div>
			</div>
		</section>
	</body>
</html>