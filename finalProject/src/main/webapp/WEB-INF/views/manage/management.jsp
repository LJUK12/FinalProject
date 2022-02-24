<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<section>
			<div id="menagementWrap">
				<div class="managerDiv">
					<div class="managerBox"><a href="/memberManager">
						<div class="managerImgBox"><img src="<c:url value='/image/memberTemp.png'/>"></div>회원관리
					</a></div>
					<div class="managerBox"><a href="/postManager">
						<div class="managerImgBox"><img src="<c:url value='/image/boardTemp.png'/>"></div>상품관리
					</a></div>
				</div>
				<div class="managerDiv">
					<div class="managerBox"><a href="/chatManager">
						<div class="managerImgBox"><img src="<c:url value='/image/chattingTmep.png'/>"></div>채팅관리
					</a></div>
					<div class="managerBox"><a href="/tradeManager">
						<div class="managerImgBox"><img src="<c:url value='/image/tradeTemp.png'/>"></div>거래내역관리
					</a></div>
				</div>
			</div>
		</section>
	</body>
</html>