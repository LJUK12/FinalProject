<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="<c:url value='/css/login.css'/>" rel="stylesheet" type="text/css">	
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
	</head>
	<body>
    <div id="wrap">
        
        <!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>

        <section id="login">
            <div id="loginHeader">
                <h3>로그인</h3>
            </div>
            <form id="loginForm">
                <p id="loginError"></p>
                <input type="text" name="id" id="id" placeholder="아이디">
                <input type="password" name="pwd" id="pwd" placeholder="비밀번호">
                <input type="submit" name="submit" id="submit" value="로그인">
            </form>
            <div id="loginAnchor">
            	<a href="<c:url value='/idSearchForm'/>">아이디 찾기</a>&nbsp;|&nbsp;
                <a href="<c:url value='/pwdSearchForm'/>">비밀번호 찾기</a>&nbsp;|&nbsp;
                <a href="/join">회원가입</a>
            </div>
            <div id="socialLiogin">
                <p>social Login</p>
            </div>
        </section>

        <!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>
		
    </div>
	</body>
</html>