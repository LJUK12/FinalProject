<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/memberDetail.js'/>"></script>
</head>
<body>

<div id="wrap">
<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		
		<!-- mypagemenu -->
		<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true'/>
		
		<section>
		
		
		<table>
		<tr>
		<th>회원번호</th><td>${member.memNo }</td>
		</tr>
		<tr>
		<th>ID</th><td>${member.memId }</td>
		</tr>
		<tr>
		<th>성명</th><td>${member.memName }</td>
		</tr>
		<tr>
		<th>주소</th><td>${member.memAddress1 }<br>
						${member.memAddress2 }</td>
		</tr>
		<tr>
		<th>이메일</th><td>${member.memEmail }</td>
		</tr>
		<tr>
		<th>전화번호</th><td>${member.memPhone }</td>
		</tr>
		<tr><td align="center">
		<button id="update">회원 정보 수정</button>
		<button id="home">메인 페이지로</button></td>
		</tr>
		</table>
		
		
		
		</section>
		
<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>		
		
</div>

</body>
</html>