<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 변경</title>
		<link href="<c:url value='/css/pwdChange.css'/>" rel="stylesheet" type="text/css"> 
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/pwdChange.js'/>"></script>
	</head>
	<body>

	<div id="modal_pwChange">
	    <div class="modal_content">
	    	<div>
	    		<div>비밀번호 변경</div>
	        	<div>비밀번호는 4글자 이상으로 작성해야합니다.</div>
	    	</div>
	    	<div>
		        <div>
		        	<span>변경할 비밀번호 입력 </span>
		        	<input type="password" class="form-box pw2" id="pw-check1" >
		        	<div style="height:20px;"><div class="notice-text"></div></div>
		        </div>
		        <div>
		        	<span>변경할 비밀번호 다시 입력 </span>
		        	<input type="password" class="form-box pw2" id="pw-check2"readonly>
		        	<div style="height:15px;"><div class="notice-text"></div></div>
		        </div>
		        <div>
		        	<button class="btn2 change" id="modal_pwChange_confirm_btn">변경저장</button>
		        	<button class="btn2 delete" id="modal_pwChange_close_btn">닫기</button>
		        </div>
		    </div>

            <form id="changeFrm" action="/pwdChange" method="post">
                <input type="hidden" name="memId" id="memIdHidden" value="${sessionScope.memberId}">
                <input type="hidden" name="memPwd" id="memPwdCheck">
            </form>
	    </div>
	</div>

	</body>

</html> 