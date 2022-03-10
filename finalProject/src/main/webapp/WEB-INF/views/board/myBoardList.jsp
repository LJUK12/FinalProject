<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/css/myPageMenu.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/myBoardList.css'/>" rel="stylesheet" type="text/css">
</head>
<body>

<div id="wrap">
<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		<br><br>
		<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true'/>
		<br><br>
		
		
		<div id="myPost">
		<h3>내가 쓴 글 목록</h3><br><br>
		<table>
		<thead>
		<tr>
		<th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th>
		<tr>
		</thead>
		<c:forEach items="${bList }" var="board">
		<tr>
		<td>${board.comNo }</td><td><a href="<c:url value='/board/detailViewBoard/${board.comNo }'/>">${board.comTitle }</a> </td><td>${sessionScope.sid }</td><td>${board.comDate }</td>
		</tr>
		</c:forEach>
		
		</table>
		</div>
		
		
		
		
		
		
		<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>		
		
</div>

</body>
</html>