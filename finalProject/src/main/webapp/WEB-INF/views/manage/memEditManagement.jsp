<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>관리자 회원정보 수정 페이지</title>
	<link href="<c:url value='/css/join.css'/>" rel="stylesheet" type="text/css">	
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	<script src="<c:url value='/js/memEmailCheck.js'/>"></script>
	<script src="<c:url value='/js/joinAddress.js'/>"></script>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/manage/manageTop.jsp" flush="true"/>
		<div id="wrap"> 
		<div id='content'>

			<h2>회원정보 수정</h2>

			
				<div id='form_box'>
				
				<form  name="joinForm" id="joinForm" method="post" action='<c:url value="/memberManager/memEdit2" />'>
					<div>
		  				<h3>아이디</h3>
		  				<span class='box id'>
		  					<input type="text" class='textBox' id='memId' name="memId" maxlength="20" value="${memVO.memId }" readonly>
		  				</span>
		  			</div>
	
		  			<div>
		  				<h3>비밀번호</h3>
		  				<span class='box pass'>
		  					<input type="password" class="textBox" id='memPwd' name="memPwd" maxlength="20" value="${memVO.memPwd }" readonly>
		  				</span>
		  				<span id='errorPwd'>비밀번호는 4~20자로 입력해주세요</span>
		  			</div>
	
		  			<div>
		  				<h3>이름 입력</h3>
		  				<span class='box name'>
		  					<input type="text" class="textBox" id='memName' name="memName" maxlength="10" value="${memVO.memName }">
		  				</span>
		  				<span id='errorName'>이름을 입력해주세요</span>
		  			</div>
	
		  			<div>
		  				<h3>시/도 입력</h3>
		  				<p id="add1" style="display: none;">${memVO.memAddress1 }</p>
		  				<select id="memAddress1" name="memAddress1" class="address" >
		  				</select>
		  			</div>
	
		  			<div>
		  				<h3>시/군/구 입력</h3>
		  				<p id="add2" style="display: none;">${memVO.memAddress2 }</p>
		  				<select id="memAddress2" name="memAddress2" class="address">
		  				</select>
		  				<span id='errorAddress'>주소를 입력해주세요</span>
		  			</div>
	
					<div>
		  				<h3>이메일 입력</h3>
		  				<span class='box name'>
		  					<input type="text" class="textBox" id='memEmail' name="memEmail" maxlength="20" value="${memVO.memEmail }">
		  				</span>
		  				<input type="button" id="emailCheck" name="memEmailCheck" value="이메일 중복체크">
		  				<span id='errorEmail1'>이메일을 입력해주세요</span>
		  				<span id='errorEmail2'>유효한 이메일을 입력해주세요</span>
		  			</div>
	
		  			<div>
		  				<h3>전화번호</h3>
		  				<p id="phones" style="display: none;">${memVO.memPhone }</p>
		  				<span >
		  					<select class='hp' name="memHP1" id="hp1">
		  						<option value="010">010</option>
		  						<option value="011">011</option>
		  						<option value="011">012</option>
		  					</select>-
		  					<input type="text" maxlength="4" class='hp' id='hp2' name="memHP2">-<input type="text" maxlength="4" class='hp' name="memHP3" id='hp3'>
		  				</span>
		  				<span id='errorHp'>전화번호를 입력해주세요</span>
		  			</div>
	
		  			<div>
		  				<input type="submit" value="수정하기" id='submit'> 
		  			</div>
	
		  		</form>
		  		</div><!-- form_box -->
		  		
	  		</div> <!-- content -->
		</div> <!-- wrap -->
	</body>
</html>