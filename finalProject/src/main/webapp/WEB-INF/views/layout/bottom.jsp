<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BaNaDa</title>
	</head>
	<body> 
		<footer>
            <div id="footer">
                <div id="footerInfo">
                    <div id="info1">
                        <h2>BaNaDa 고객센터</h2>
                        <h3>1588-4422</h3>
                    </div>
                    <div id="info2">
                        상담시간&nbsp;|&nbsp;
                        평일 09:00 ~ 17:00&nbsp;|&nbsp;
                        주말, 공휴일 휴무&nbsp;|&nbsp;
                        점심시간 12:00 ~ 13:00
                    </div>
                    <div id="info3">
                        <a href="<c:url value='/'/>">브랜드 스토리</a>&nbsp;|&nbsp;
                        <a href="<c:url value='/'/>">회사 소개</a>&nbsp;|&nbsp;
                        <a href="<c:url value='/'/>">채용 정보 </a>&nbsp;|&nbsp;
                        <a href="<c:url value='/termsAndCondition'/>">이용 약관</a>&nbsp;|&nbsp;
                        <a href="<c:url value='/privacyPolicy'/>">개인 정보 처리 방침</a>&nbsp;|&nbsp;
                        <a href="<c:url value='/'/>">이용 안내</a>&nbsp;|&nbsp;
                        <a href="<c:url value='/'/>">공지사항</a>&nbsp;|&nbsp;
                        <a href="<c:url value='/'/>">고객센터</a>&nbsp;|&nbsp;
                        <a href="<c:url value='/'/>">고객의 소리</a>&nbsp;|&nbsp;
                        <a href="<c:url value='/'/>">제휴/광고 문의</a>
                    </div>
                    <div id="info4">
                        이메일(고객 문의) : BanaBana@naver.com<br/>
                        주소 : 강남 바나다
                    </div>
                </div>
                <div id="toTop">
                    <i id="toTopBtn" class="fas fa-arrow-up" style="color:gray"></i>
                </div>
                <div id="chat">
                	<i id="chatbot" class="far fa-comment-dots" style="color:gray"></i>
                </div>
            </div>
        </footer>
	</body>
</html>