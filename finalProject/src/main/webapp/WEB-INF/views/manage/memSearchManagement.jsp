<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>멤버 검색</title>
</head>
	<body>
		<table id="memTable">
			<tr><th>번호</th><th>아이디</th><th>패스워드</th><th>이름</th><th>주소1</th>
			<th>주소2</th><th>이메일</th><th>연락처</th><th>등급</th><th>이미지</th>
			<th>수정</th><th>삭제</th></tr>
		
			<tr><th></th><th></th><th></th><th></th><th></th>
			<th></th><th></th><th></th><th></th><th></th>
			<th></th><th></th></tr>
			<c:if test="${not empty memberVO }">
			<c:forEach items="${memberVO}" var="mem">
			<tr><td>${mem.memNo }</td><td>${mem.memId }</td>
				<td><input type="password" value="${mem.memPwd }" readonly/></td>
				<td>${mem.memName }</td><td>${mem.memAddress1 }</td><td>${mem.memAddress2 }</td>
				<td>${mem.memEmail }</td><td>${mem.memPhone }</td>
				<td>${mem.memGrade }</td><td>${mem.memImg } </td>
				<td><a id="mngEditBtn" href="<c:url value='/memberManager/memEdit/${mem.memId }' />">수정</a></td>
				<td><a id="mngDeleteBtn" href="<c:url value='/memberManager/memDelete/${mem.memNo}' />">삭제</a></td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty memberVO }">
			<tr><td colspan="10">검색 결과가 존재하지 않습니다.</td>
			</tr>
			</c:if>
		</table>
	</body>
</html>