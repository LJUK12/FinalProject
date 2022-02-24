<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>manage Top Layer</title>
	<link href="<c:url value='/css/index.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/common.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
</head>
	<body>
		<header>
			<div id="mainLogo">
				
					<a href="<c:url value='/'/>"><h2>메인으로 돌아가기</h2></a>
				<c:if test="${sessionScope.sgrade eq '운영자'}">			
	                <a href="<c:url value='/join'/>"><h2>마이페이지</h2></a>
	                <a href="<c:url value='/login'/>"><h2>로그아웃</h2></a>
				</c:if>	
			</div><hr/>
		</header>
	</body>
</html>