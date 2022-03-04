<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>택배거래</title>
<link href='/css/courierTransaction.css' rel="stylesheet" type="text/css">
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
	<form id="insertTransactionForm2" method="post" action="/post/insertTran/${post.postNo }"
							enctype="multipart/form-data" onsubmit="submitContents()">
	<div>
	<h3>결제방식</h3>						
		<select class="form-control3" name="tranPayment" id="tranPayment">
		<option value="카드" >카드</option>
		<option value="현금결제" selected>현금결제</option>
	</select><br><br>
	</div>
	
	<div>
	<h3>거래방식</h3>
	<span class='box'><input type="text" id="tranWay" name="tranWay" class='textBox' value="${post.postWay }"readOnly></span><br>
	</div>
	
	<div>
	<h3>상품명</h3>
	<span class='box'><input type="text" id="postNo" name="postNo" class='textBox' value="${post.postNo }"readOnly></span><br>
	</div>
	
	<div>
	<h3>판매자</h3>
	<span class='box'><input type="text" id="sellerNo" name="sellerNo" class='textBox' value="${post.memNo }"readOnly></span><br>
	</div>
	
	<div>
	<h3>구매자</h3>
	<span class='box'><input type="text" id="memNo" name="memNo"class='textBox' value="${sessionScope.No}"readOnly></span><br>
	</div>
	
	<div>
	<h3>가격</h3>
	<span class='box'><input type="text" id="tranPrice" name="tranPrice" class='textBox'value="${post.postPrice }"readOnly></span><br>
	</div>
	
		<div>
		<h3>배송지</h3>
  		<input id="member_post"  type="text" placeholder="주소 입력" readonly onclick="findAddr()">
 		<input id="member_addr"  type="text" placeholder="도로명 주소"  readonly > <br>
 		<input id="member_addr2" type="text" placeholder="상세 주소를 입력하세요" onchange="onchagedata()"><br>
 		<span class='box'><input id="tranAddress" name="tranAddress" type="text" class='textBox' readonly ></span><br>
 		</div>
 		
		<c:if test="${not empty sessionScope.sid }">
			<input type="submit" class="postComplete1" value="등록"> 
		</c:if>
		<input type="button" class="postComplete2" value="취소" onclick="location.href='<c:url value="/"/>'">

	</form>
	</div>
	</div>
	</div>
	</div>
	
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
            document.getElementById('tranAddress').value = roadAddr + jibunAddr + document.getElementById('member_addr2').value;
            console.log('tranAddress');

        }
	
    }).open();
	
}
function onchagedata(){
    document.getElementById('tranAddress').value = document.getElementById('tranAddress').value + " 상세주소: "+document.getElementById('member_addr2').value;
    console.log('tranAddress');
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>택배거래</title>
<link href='/css/courierTransaction.css' rel="stylesheet" type="text/css">
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
	<form id="insertTransactionForm2" method="post" action="/post/insertTran/${post.postNo }"
							enctype="multipart/form-data" onsubmit="submitContents()">
	<div>
	<h3>결제방식</h3>						
		<select class="form-control3" name="tranPayment" id="tranPayment">
		<option value="카드" >카드</option>
		<option value="현금결제" selected>현금결제</option>
	</select><br><br>
	</div>
	
	<div>
	<h3>거래방식</h3>
	<span class='box'><input type="text" id="tranWay" name="tranWay" class='textBox' value="${post.postWay }"readOnly></span><br>
	</div>
	
	<div>
	<h3>상품명</h3>
	<span class='box'><input type="text" id="postNo" name="postNo" class='textBox' value="${post.postNo }"readOnly></span><br>
	</div>
	
	<div>
	<h3>판매자</h3>
	<span class='box'><input type="text" id="sellerNo" name="sellerNo" class='textBox' value="${post.memNo }"readOnly></span><br>
	</div>
	
	<div>
	<h3>구매자</h3>
	<span class='box'><input type="text" id="memNo" name="memNo"class='textBox' value="${sessionScope.No}"readOnly></span><br>
	</div>
	
	<div>
	<h3>가격</h3>
	<span class='box'><input type="text" id="tranPrice" name="tranPrice" class='textBox'value="${post.postPrice }"readOnly></span><br>
	</div>
	
		<div>
		<h3>배송지</h3>
  		<input id="member_post"  type="text" placeholder="주소 입력" readonly onclick="findAddr()">
 		<input id="member_addr"  type="text" placeholder="도로명 주소"  readonly > <br>
 		<input id="member_addr2" type="text" placeholder="상세 주소를 입력하세요" onchange="onchagedata()"><br>
 		<span class='box'><input id="tranAddress" name="tranAddress" type="text" class='textBox' readonly ></span><br>
 		</div>
 		
		<c:if test="${not empty sessionScope.sid }">
			<input type="submit" class="postComplete1" value="등록"> 
		</c:if>
		<input type="button" class="postComplete2" value="취소" onclick="location.href='<c:url value="/"/>'">

	</form>
	</div>
	</div>
	</div>
	</div>
	
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
            document.getElementById('tranAddress').value = roadAddr + jibunAddr + document.getElementById('member_addr2').value;
            console.log('tranAddress');

        }
	
    }).open();
	
}
function onchagedata(){
    document.getElementById('tranAddress').value = document.getElementById('tranAddress').value + " 상세주소: "+document.getElementById('member_addr2').value;
    console.log('tranAddress');
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
>>>>>>> upstream/main
</html>