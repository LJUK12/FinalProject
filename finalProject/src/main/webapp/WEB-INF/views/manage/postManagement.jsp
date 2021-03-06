<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>상품 포스트 관리</title>
	
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<section>
			<div id="menagementWrap">
				<a id="returnManager" href="/rootManager">◀돌아가기</a>
				<h2><img src="<c:url value='/image/boardTemp.png'/>">상품 포스트 관리</h2>
				<div id="MngSearchDiv">
					<i class="fa-solid fa-magnifying-glass"></i>
					<input type="text" id="srchPost" class="MngSearch" placeholder="검색하기"/>
				</div>
				<div id="trTableStyle2">
					<table id="postTable">
						<tr><th>번호</th><th>제목</th><th>가격</th><th>거래방식</th><th>작성일</th><th>카테고리</th><th>조회수</th>
						<th>좋아요</th><th>판매상태</th><th>섬네일</th><th>작성자</th>
						<th>수정</th><th>삭제</th></tr>
						<c:if test="${not empty postVO }">
						<c:forEach items="${postVO}" var="post">
							<tr><td>${post.postNo }</td><td><a href="<c:url value='/postManager/postDetails/${post.postNo }' />">${post.postTitle }</a></td>
								<td>${post.postPrice }</td><td>${post.postWay }</td>
								<td><%-- <fmt:formatDate value="${post.postDate }"  pattern="YY.MM.dd yy:hh:ss"/> --%></td>
								<td>${post.postTag }</td><td>${post.postHit }</td><td>${post.postFavorit }</td><td>${post.postState }</td>
								<td><img src="/resource/photo_upload/${post.postImg }" alt="sumnail" width="100" height="100"/></td>
								<td>${post.memId }</td>
								<td><a id="mngEditBtn" href="<c:url value='/postManager/postEdit/${post.postNo }' />">수정</a></td>
								<td><a id="mngDeleteBtn" href="<c:url value='/postManager/postDelete/${post.postNo}' />">삭제</a></td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty postVO }">
							<tr><td colspan="12">결과가 없습니다.</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
		</section>
	</body>
</html>