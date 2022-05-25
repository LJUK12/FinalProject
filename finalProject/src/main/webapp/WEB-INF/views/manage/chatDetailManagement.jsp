<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>채팅내역 상세보기</title>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<section>
			<div id="menagementWrap">
				<div style="width: 100%; height: 50px;">
					<a id="returnManager" href="/chatManager">◀돌아가기</a>
				</div>
				
				<h2>채팅내역 상세보기</h2>
				<div id="chatManagerDetail">
					<div id="memInf1">
		  				<h3>채팅 번호 : ${chatVO.chatNo }</h3>
		  			
		  				<h3>포스트 번호 : ${chatVO.postNo }</h3>
		  				<hr>
		  			</div>
		  			
		  			
					<div id="memInf1">
		  				<h3>작성자 : ${chatVO.memId }</h3>
		  			</div>
	
	
		  			<div id="memInf1">
	  					<h3>내용</h3>
	  					<h4>${chatVO.chatContent }</h4>
		  			</div>
		  				<p>작성날짜 : ${chatVO.chatDate }</p>

		  			<br>	
				</div>
			</div>
		</section>
	</body>
</html>