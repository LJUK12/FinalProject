<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/memEmailCheck.js'/>"></script>
<script src="<c:url value='/js/joinAddress.js'/>"></script>
<link href="<c:url value='/css/join.css'/>" rel="stylesheet" type="text/css">
<style type="text/css">
	section{
		height: 700px !important;
	}
	#content{
	    text-align: left;
	}
	#form_box{
		margin-left: 0;
	}
	.submit_btn{
	height:40px;
   width: 100px;
   font-size:15px;
   color: white;
   background:coral;
   border: none;
   border-radius: 3px;
	}
	.reset_btn{
	height:40px;
   width: 100px;
   font-size:15px;
   background: #dadada;
   border: none;
   border-radius: 3px;
	}
</style>
</head>
<body>
<div id="wrap">
<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		
		<!-- mypagemenu -->
		<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true'/>
		
		<section>
		<div id='content'>
		<br><br>
		
<h3>회원 정보 수정</h3>

<br><br>

<div id='form_box'>
<form id="updateProfileForm" name="updateProfileForm" method="post"  action="/updateProfile">
<input type="hidden" id="memId" name="memId" value="${sessionScope.sid }">
		
		<div>
			<h3>성명</h3>
			<span class='box name'>
				<input type="text" id="memName" name="memName" class='textBox'>
			</span>
		</div>
		
		
		<div>
			<h3>비밀번호</h3>
			<span class='box pass'>
				<input type="password" id="memPwd" name="memPwd" class='textBox'>
			</span>
			<span id='errorPwd'>비밀번호는 4~20자로 입력해주세요</span>
		</div>
		
		<div>
			<h3>주소</h3>
			<select id="memAddress1" name="memAddress1" class="address" class="address"></select>
			<select id="memAddress2" name="memAddress2" class="address"class="address"></select>
		</div>
		
		<div>
			<h3>이메일</h3>
			<span>
				<input type="text" id="memEmailId" name="memEmailId" class="hp">@
				<input type="text" id="memEmail" name="memEmail" class="hp">
			</span>
			<button id="emailCheck">중복체크</button>
		</div>
		
		<div>
			<h3>전화번호</h3>
			<span class='box id'>
				<input type="text" id="memPhone" name="memPhone" class='textBox'>
			</span>
		</div>
		
        <br>
        <input type="submit" value="완료" class="submit_btn">
        <input type="reset" value="취소" class="reset_btn">
		  
	      </form>
	      </div>	
		</div>
</section>
		
<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>		
		
</div>
</body>
</html>