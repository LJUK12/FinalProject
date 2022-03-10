<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>택배거래</title>


<link href='/css/courierTransaction.css' rel="stylesheet"
	type="text/css">
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
		<h2 id="firstName2">중고상품 결제</h2><br>
			<div id='content'>
				
				<div id='form_box'>
					<form id="insertTransactionForm2" method="post"
						action="/post/insertTran/${post.postNo }"
						enctype="multipart/form-data" onsubmit="submitContents()">
						<div> 
							<div id="postNav">
								<div id="box1">
									<img id="postNavImg" alt="" src="/resource/photo_upload/${post.postImg }">
								</div>
								<div id="box2">
									<p class="postNavNaming">상품정보</p>
									<br><input type="hidden" id="postNo" name="postNo" class="textBox" value="${post.postNo}"readOnly>
									<input type="text" id="postTitle" name="postTitle" class='textBox' value="${post.postTitle }" readOnly></span><br>
								</div> 
								<div id="box2">
									<p class="postNavNaming">판매자</p>
									<br><input type="hidden" id="sellerNo" name="sellerNo" class='textBox' value="${post.memNo }"readOnly>
									<input type="text" id="searchmemId" name="searchmemId" class='textBox' value=""readOnly>
								</div>
								<div id="box2">
									<p class="postNavNaming">구매자</p>
									<br><input type="hidden" id="memNo" name="memNo" class='textBox' value="${sessionScope.No}"readOnly>
									<input type="text"class='textBox' value="${sessionScope.sid }"readOnly>
								</div>
								<div id="box2">
									<p class="postNavNaming">상품금액</p>
									<br><input type="text" id="tranPrice" name="tranPrice" class='textBox'value="${post.postPrice }"readOnly>
								</div>
							</div><br><br><br>
							
							<div id="alltax">
								<div id="taxThird">
									<div id="tak">
										<h3>배송지정보</h3><br>
										<input id="member_post" type="text" placeholder="주소 입력" readonly onclick="findAddr()"> 
										<input id="member_addr" type="text" placeholder="도로명 주소" readonly> 
										<br> 
										<input id="member_addr2" type="text" placeholder="상세 주소를 입력하세요"
											onchange="onchagedata()">
										<br> 
										<span class='box'>
											<input id="tranAddress" name="tranAddress" type="text" class='textBox2'
												readonly>
										</span>
										<br>
									</div>
									
									<div id="phoneCheck">
										<tr class="mobileNo">
											<th><h3>거래인증: 휴대폰 인증</h3></th>
											<br>
											<td>
												<p>
													<input id="phone" type="text" name="phone" title="전화번호 입력"required /> 
													<span id="phoneChk" class="doubleChk">인증번호보내기</span><br/> 
													<input id="phone2" type="text" name="phone2"title="인증번호 입력" disabled required /> 
													<span id="phoneChk2"class="doubleChk" style="display:none;">본인인증</span> 
													<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span> 
													<input type="hidden" id="phoneDoubleChk" />
												</p>
												<p class="tip">결제 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)</p>
											</td>
										</tr>
									</div><br>
									
									<div id="tax2">
										<h3>거래방식</h3>
										<span class='box'><input type="text" id="tranWay"
											name="tranWay" class='textBox2' value="${post.postWay }" readOnly></span><br>
									</div>
									
									<div id="tax">
										<h3>결제수단</h3><br>
										<div id="taxBox1">
											<select class="form-control3" name="tranPayment" id="tranPayment">
												<option value="카드">카드</option>
												<option value="현금결제" selected>현금결제</option>
											</select><br> <br>
										</div>
										<div class="taxBox2">
										 <label><input type="radio" name="radioExample" value="1">&ensp;무통장결제</label>
										</div>
										<div class="taxBox2">
										 <label><input type="radio" name="radioExample" value="1">&ensp;카드 결제</label>
										</div>
									</div>
									<br>
								</div>          
								<div id="postAside">
									<div>
										<div id="box2"><br>
											<p class="postNavNaming2">구매자 정보</p><br><br>
											구매자:&ensp;${sessionScope.sid}<br><br>
												고객번호: ${post.memNo }
										</div>
										<br><br>
									</div><br><hr><br>
									<div><br>
										&ensp;상품정보: &nbsp;${post.postTitle }<br><br>
										&ensp;판매자: &nbsp;${post.memId }<br><br>
										&ensp;결제 가격: &nbsp;${post.postPrice } 원<br><br>
									</div><br><br>
								</div>
							</div>
						</div>

						<div id = "submitPost"></div>
						<%-- <c:if test="${not empty sessionScope.sid }">
							<input type="submit" class="postComplete1" value="등록"> 
						</c:if> --%>
						
					</form>
					<div id="kakao">
						<form method="post" action="/kakaoPay">
						    <button id="kakaoBtn"><img alt="" src="/image/payment_icon_yellow_small.png"></button>
						    <input type="hidden" id="tranPrice" name="tranPrice" class='textBox2'value="${post.postPrice }"readOnly>
						    <input type="hidden" id="postNo" name="postNo" class='textBox' value="${post.postNo }"readOnly>
						</form>
					</div>
					<div>
					<input type="button" class="postComplete2" value="취소"
							onclick="location.href='<c:url value="/"/>'">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>






<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				console.log(data);

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('member_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("member_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("member_addr").value = jibunAddr;
				}
				document.getElementById('tranAddress').value = roadAddr
						+ jibunAddr
						+ document.getElementById('member_addr2').value;
				console.log('tranAddress');

			}

		}).open();

	}
	function onchagedata() {
		document.getElementById('tranAddress').value = document
				.getElementById('tranAddress').value
				+ " 상세주소: " + document.getElementById('member_addr2').value;
		console.log('tranAddress');
	}
	
	
	
	
	
	
	
	
	
	
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>