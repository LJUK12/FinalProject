<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>chatSearchManagement</title>
</head>
	<body>
		<table id="chatTable">
			<tr><th>번호</th><th>게시판번호</th><th>회원번호</th><th>작성자</th>
			<th>채팅내용</th><th>작성일</th>
			<th>수정</th><th>삭제</th></tr>
			<c:if test="${not empty chatVO }">
			<c:forEach items="${chatVO}" var="chat">
			<tr><td>${chat.chatNo }</td><td>${chat.postNo }</td>
				<td>${chat.memNo }</td><td>${chat.memId }</td><td>${chat.chatContent }</td>
				<td><%-- <fmt:formatDate value="${chat.chatDate }" pattern="YY.MM.dd yy:hh:ss"/> --%></td>
				<td><a id="mngEditBtn" href="<c:url value='/chatManager/chatEdit/${chat.chatNo }' />">수정</a></td>
				<td><a id="mngDeleteBtn" href="<c:url value='/chatManager/chatDelete/${chat.chatNo}' />">삭제</a></td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty chatVO }">
			<tr><td colspan="6">검색 결과가 존재하지 않습니다.</td></tr>
			</c:if>
		</table>
	</body>
</html>