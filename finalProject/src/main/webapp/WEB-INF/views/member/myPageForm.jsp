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
		
		<!-- mypagemenu -->
		<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true'/>
		
		<section>
		<h3>mypage</h3>
		<a href="<c:url value='/memberDetail'/>">회원 정보</a><br>
		<a href="<c:url value='/withdrawMemberForm'/>">회원 탈퇴</a><br>
		<a href="<c:url value='/myPostList/1'/>">내가 쓴 글</a><br>
		
		
		
		
		
		
		</section>
		
<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>		
		
</div>
</body>
</html>