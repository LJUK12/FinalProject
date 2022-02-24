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
		<!-- mypagemenu -->
		<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true'/>
		
		<section>
		
		<c:set var="i" value="0"/>
		<h3>나의 즐겨찾기</h3>
<div id="myPost">
<table width="800" align="center" border="1">
<tr>
<th>글번호</th><th width="500">제목</th><th>글쓴이</th><th>날자</th>
<tr>
<c:forEach items="${postList }" var="post">
<tr>
<td>${post.postNo }</td><td width="500"><a href="<c:url value='/post/detailViewPost/${post.postNo }'/>">${post.postTitle }</a> </td><td><c:out value="${memIdList[i]}" /> </td><td>${post.postDate }</td>
</tr>
<c:set var="i" value="${i+1 }"/>
</c:forEach>

</table>
</div>
		
		
		</section>
		
<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>		
		
</div>
</body>
</html>