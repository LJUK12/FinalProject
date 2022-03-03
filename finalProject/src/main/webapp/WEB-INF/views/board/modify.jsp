<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
  <link href='/css/modify.css' rel="stylesheet" type="text/css">
  
</head>
<body>
	<!-- TOP -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' /><br><br>
	<h1 id="first">수정하기</h1>
		<form id="modifyForm" action="/board/modify" method="post">
			<div class="input_wrap">
				<label>작성자 번호</label>
				<input name="comNo" readonly="readonly" value='<c:out value="${pageInfo.comNo}"/>' >
			</div>
			<div class="input_wrap">
				<label>제목 수정</label>
				<input name="comTitle" value='<c:out value="${pageInfo.comTitle}"/>' >
			</div>
			<div class="input_wrap">
				<label>게시판 내용</label>
				<textarea rows="3" name="comContent"><c:out value="${pageInfo.comContent}"/></textarea>
			</div>
			<div class="input_wrap">
				<label>게시판 작성자</label>
				<input name="memNo" readonly="readonly" value='<c:out value="${pageInfo.memNo}"/>' >
			</div>
			<div class="btn_wrap"> 
	       	 	<a class="btn" id="modify_btn">수정 완료</a>
	       	 	<a class="btn" id="delete_btn">삭제</a>
	        	<a class="btn" id="cancel_btn">수정 취소</a>
			</div>
		</form>
		<form id="infoForm" action="/board/modify" method="get">
			<input type="hidden" id="comNo" name="comNo" value='<c:out value="${pageInfo.comNo}"/>'>
			<input type="hidden" id="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" id="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" id="type" value='<c:out value="${cri.type}"/>'>
			<input type="hidden" id="keyword" value='<c:out value="${cri.keyword}"/>'>
		</form>
	<script src="<c:url value='/js/modify.js'/>"></script>
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
</html>