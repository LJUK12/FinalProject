<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>관리자 회원 상세 페이지</title>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		
		<section>
			<div id="menagementWrap">
				<div style="width: 100%; height: 50px;">
				<a id="returnManager" href="/memberManager">◀돌아가기</a>
				</div>
				
				<h2>회원정보 상세보기</h2>
				<div id="memManagerDetail">
					<div id="memInf1">
						<h1>기본정보</h1><br>
						<div class="common1">
							<h4>ID : ${member.memId }</h4>
						</div><hr class="common1Hr">
						<div class="common1">
							<h4>성명 : ${member.memName }</h4>
						</div><hr class="common1Hr">
						<div class="common1">
							<h4>주소 : ${member.memAddress1 } / ${member.memAddress2 }</h4>
						</div><hr class="common1Hr">
					</div>
				
					<div id="memInf1">
						<h1>연락처 정보</h1><br>
						<div class="common1">
				 			<h4>이메일 : ${member.memEmail }</h4>
						</div><hr class="common1Hr">
						<div class="common1">
							<h4>전화번호 : ${member.memPhone }</h4>
						</div><hr class="common1Hr">
					</div>
				</div>
			</div>
		</section>
		
	</body>
</html>