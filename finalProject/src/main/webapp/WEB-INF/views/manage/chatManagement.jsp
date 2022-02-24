<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>채팅내역 관리자 페이지</title>
	
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<section>
			<div id="menagementWrap">
			<a id="returnManager" href="/rootManager">◀돌아가기</a>
			<h2>채팅 내역</h2>
			<input type="text" placeholder="검색하기"/>
				<table id="memTable" border="1">
					<tr><th>채팅번호</th><th>게시판번호</th><th>회원번호</th>
					<th>채팅내용</th><th>작성일</th>
					<th>수정</th><th>삭제</th></tr>
					<c:forEach items="${chatVO}" var="chat">
					<tr><td>${chat.chatNo }</td><td>${chat.postNo }</td>
						<td>${chat.memNo }</td><td>${chat.chatContent }</td>
						<td><%-- <fmt:formatDate value="${chat.chatDate }" pattern="YY.MM.dd yy:hh:ss"/> --%></td>
						<td><a href="<c:url value='/chatManager/chatEdit/${chat.chatNo }' />">수정</a></td>
						<td><a href="<c:url value='/chatManager/chatDelete/${chat.chatNo}' />">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</body>
</html>