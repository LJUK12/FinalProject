<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직거래 결제</title>
<link href='/css/directTransaction.css' rel="stylesheet" type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
</head>
<body>

	<!-- TOP -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="mainIndexBox">
	<div id="wrap">
		
	<div id='content'>
	
	<div id='form_box'>
    <form id="insertTransactionForm" method="post" action="/post/insertTran/${post.postNo }"
							enctype="multipart/form-data" onsubmit="submitContents()">
	<div>
	<h3>결제방식</h3><br>						
		<!-- <select class="form-control3" name="tranPayment" id="tranPayment">
		<option value="카드" >카드</option>
		<option value="현금결제" selected>현금결제</option>
	</select><br> -->
		<INPUT type="radio" name="tranPayment" id="tranPayment" value="현금" checked > 현금
		<INPUT type="radio" name="tranPayment" id="tranPayment" value="체크카드" >체크카드
		<INPUT type="radio" name="tranPayment" id="tranPayment" value="통장 입금">계좌거래
		<br><br>
	</div>

	<div>
	<h3>거래방식</h3>
	<span class='box'><input type="text" id="tranWay" name="tranWay" class='textBox' value="${post.postWay }"readOnly></span><br>
	</div>
	
	<div>
	<h3>상품명</h3>
	<span class='box'><input type="hidden" id="postNo" name="postNo" class='textBox' value="${post.postNo }"readOnly>
	<input type="text" id="postTitle" name="postTitle" class='textBox' value="${post.postTitle }"readOnly>
	</span><br>
	</div>
	
	<div>
	<h3>판매자</h3>
	<span class='box'>
	<input type="hidden" id="sellerNo" name="sellerNo" class='textBox' value="${post.memNo }" readOnly>
	<input type="text" id="searchmemId" name="searchmemId" class='textBox' value="" readOnly>
	</span><br>
	</div>
	
	<div>
	<h3>구매자</h3>
	<span class='box'><input type="hidden" id="memNo" name="memNo"class='textBox' value="${sessionScope.No}"readOnly>
	<input type="text"class='textBox' value="${sessionScope.sid }"readOnly></span></span><br>
	</div>
	
	<div>
	<h3>가격</h3>
	<span class='box'><input type="text" id="tranPrice" name="tranPrice" class='textBox'value="${post.postPrice }"readOnly></span><br>
	</div>
	
	<tr class="mobileNo">
							<th><h3>휴대폰 번호</h3></th>
							<br>
							<td>
								<p>
									<input id="phone" type="text" name="phone" title="전화번호 입력"required /> 
									<span id="phoneChk" class="doubleChk">인증번호보내기</span><br/><br>
									<input id="phone2" type="text" name="phone2"title="인증번호 입력" disabled required /> 
									<span id="phoneChk2"class="doubleChk" style="display:none;">본인인증</span> 
									<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span> 
									<input type="hidden" id="phoneDoubleChk" />
								</p><br>
								<p class="tip">결제 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)</p>
							</td>
						</tr>
		<br>
		<div id = "submitPost"></div>
		<%--  <c:if test="${not empty sessionScope.sid }">
			<input type="submit" class="postComplete1" value="등록"> 
		</c:if>  --%>
		<input type="button" class="postComplete2" value="취소" onclick="location.href='<c:url value="/"/>'">
	</form>
	</div>
	</div>
	</div>
	</div>
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
	
	
	<script>
	var code2 = ""; 
	$("#phoneChk").click(function(){ 
		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 
		var phone = $("#phone").val(); 
		$.ajax({ 
			type : "GET", 
			url:"/phoneCheck?phone="+phone, 
			cahe: false, 
			success: function(data){ 
				if (data == "error") { alert("휴대폰 번호가 올바르지 않습니다.") 
					$(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
					$(".successPhoneChk").css("color","red"); 
					$("#phone").attr("autofocus",true); 
				} 
				else 
				{ 	
					$("#phone2").attr("disabled", false); 
					$("#phoneChk2").css ("display", "inline-block"); 
					$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); 
					$(".successPhoneChk").css("color", "green"); 
					$("#phone").attr("readonly",true); code2 = data; 
				} 
			} 
		}); 
	});

	$("#phoneChk2").click(function(){
		if($("#phone2").val() == code2){
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color","green");
			$("#phoneDoubleChk").val("true");
			$("#phone2").attr("disabled",true);
			$("#submitPost").prepend('<c:if test="${not empty sessionScope.sid }">');
			$("#submitPost").prepend('<input type="submit" class="postComplete1" value="등록"> ');
			$("#submitPost").prepend('</c:if>');
		}else{
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successPhoneChk").css("color","red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus",true);
		}
	});

	
	
	window.onload = function () {
		SearchMemIDAjax();


	}
	

	function SearchMemIDAjax() {
		console.log($('#postNo').val());
		$.ajax({
			type:"post",
			url:"/searchMemid",
			data:{postNo:$('#postNo').val()},
			dataType:'text',
			success: function(result) {
				$('#searchmemId').val(result);
				console.log(result);

			},
			error: function(result, textStatus) {
				console.log(result + textStatus);
				alert("아이디 불러오기 에러");
			}
		});
	}
	
	
</script>
	
	
</body>
</html>