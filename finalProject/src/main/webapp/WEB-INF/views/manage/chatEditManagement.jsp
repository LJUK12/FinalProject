<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>관리자 채팅 수정 페이지</title>
	<link href="<c:url value='/css/join.css'/>" rel="stylesheet" type="text/css">	
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<div id="wrap"> 
		<div id='content'>

			<h2>채팅내용 수정</h2>

			
				<div id='form_box'>
				
				<form  name="joinForm" id="joinForm" method="post" action='<c:url value="/chatManager/chatEdit2" />'>
					<div>
		  				<h3>채팅 번호 : ${chatVO.chatNo }
		  			</div>
		  			<br>
		  			<div>
		  				<h3>포스트 번호 : ${chatVO.postNo }
		  			</div>
		  			<br>
		  			
					<div>
		  				<h3>작성자</h3>
		  				<span class='box id'>
		  					<input type="hidden" id='chatNo' name="chatNo" value="${chatVO.chatNo }">
		  					<span class='textBox'>${chatVO.memId }</span>
		  				</span>
		  			</div>
	
	
		  			<div>
		  				<h3>채팅 내용 수정</h3>
		  				<span class='box name'>
		  					<textarea id='chatContent' name="chatContent"> ${chatVO.chatContent }</textarea>
		  				</span>
		  				<span id='errorName'>채팅을 입력해주세요</span>
		  			</div>
		  				<h3>작성날짜 : ${chatVO.chatDate }</h3>
		  			</div>
		  			<br>
		
	
		  			<div>
		  				<input type="submit" value="수정하기" id='submit'>
		  				<input type="reset" value="취소하기" id="submit" onclick="location.href='<c:url value="/chatManager"/>'">
		  			</div>
	
		  		</form>
		  		</div><!-- form_box -->
		  		
	  		</div> <!-- content -->
		</div> <!-- wrap -->
	</body>

</html>