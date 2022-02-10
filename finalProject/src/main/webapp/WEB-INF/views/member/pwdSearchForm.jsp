<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<%-- <link href="<c:url value='/css/.css'/>" rel="stylesheet" type="text/css"> --%>	
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/pwdSearch.js'/>"></script>

	</head>
	<body>
		<div id="wrap"> 

			<!-- TOP  -->
		   <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
<br><br><br><br><br><br><br><br>
			<section>
				<form id="pwdSearchForm">
				<div id="name_box">
					<h4>아이디</h4>
					<input type="text" class="textBox" id='memId' name="memId" >
				</div>

				<div id="name_box">
					<h4>이메일</h4>
					<input type="text" class="textBox" id='memEmail' name="memEmail" >
				</div>
					<input type="submit" value="비밀번호찾기">
				</form>

				<div id="searchResultBox"></div>

				<div>
					<a href="<c:url value='/idSearchForm'/>">아이디 찾기</a>&nbsp;|&nbsp;
                	<a href="/login">로그인</a>
				</div>
			</section>

	    	<!-- BOTTOM  -->
		   <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />

	      </div>

    </body>
</html>