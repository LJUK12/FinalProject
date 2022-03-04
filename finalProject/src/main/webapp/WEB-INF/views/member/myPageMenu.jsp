<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/css/myPageMenu.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
 
<div id="menuBar">
	<div class="informationBar"><a href="<c:url value='/memberDetail'/>">회원 정보</a></div>
	<div class="informationBar"><a href="<c:url value='/withdrawMemberForm'/>">회원 탈퇴</a></div>
	<div class="informationBar"><a href="<c:url value='/myPostList/1'/>">내가 판매한 상품</a></div>
	<div class="informationBar"><a href="<c:url value='/myFavorit'/>">즐겨찾기 목록</a></div>
	<div class="informationBar"><a href="<c:url value='/board/myBoardList'/>">내가 쓴 글</a></div>ㄴ
</div>



</body>
</html>