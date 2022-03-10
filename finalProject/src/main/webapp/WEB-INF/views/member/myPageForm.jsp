<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/css/myPageMenu.css'/>" rel="stylesheet" type="text/css">
<style type="text/css">
	#myPageFormSec{
		margin-left: 700px;
	}
</style>
</head>
<body>

<div id="wrap">
<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		<br><br>
		
		
		<section id="myPageFormSec">
		<h1>mypage</h1><br><br>
		
		<h3>당신의 등급은 ${member.memGrade }입니다.</h3><br>
			<a href="<c:url value='/memberDetail'/>">
				<div class="mypageBox">
					회원 정보<br>
				</div>
			</a>
			<a href="<c:url value='/withdrawMemberForm'/>">
				<div class="mypageBox">
	        		회원 탈퇴<br>		
				</div>
			</a><br><br>
			<a href="<c:url value='/myPostList/1'/>">
				<div class="mypageBox">
					내가 판매한 상품<br>
				</div>
			</a>
			<a href="<c:url value='/myFavorit'/>">
				<div class="mypageBox">
	        		나의 즐겨찾기<br>		
				</div><br><br>
			<a href="<c:url value='/board/myBoardList'/>">
				<div class="mypageBox">
	        		내가 쓴 글<br>		
				</div>
			</a>
		
			<br><br><br><br><br><br>
		
		</section>
		<br><br><br><br><br><br>
<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>		
		
</div>
</body>
</html>