<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="wrap">
<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		<br><br>

		<section>
		<h3>내가 쓴 글 목록</h3><br>
		<div id="myPost">
		<table width="800" align="center" border="1">
		<tr>
		<th>글번호</th><th width="500">제목</th><th>글쓴이</th><th>날자</th>
		<tr>
		<c:forEach items="${bList }" var="board">
		<tr>
		<td>${board.comNo }</td><td width="500"><a href="<c:url value='/board/detailViewBoard/${board.comNo }'/>">${board.comTitle }</a> </td><td>${sessionScope.sid }</td><td>${board.comDate }</td>
		</tr>
		</c:forEach>

		</table>
		</div>



		</section>



		<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>		

</div>

</body>
</html> 