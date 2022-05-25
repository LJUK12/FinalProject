<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href='/css/transResult.css' rel="stylesheet" type="text/css">
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
	<br>
	<div id="mainIndexBox">
	<div id="wrap">
		
	<div id='content'>
	
	<div id='form_box'>
		
		<h3>결제 확인</h3><br>
		
		<div>
		<h3>결제방법</h3>		
		<span class='box'><input type="text"class='textBox' value="${tranList.tranPayment }"readOnly></span><br>
		</div>
		
		<div>
		<h3>거래방법</h3>		
		<span class='box'><input type="text"class='textBox' value="${tranList.tranWay }"readOnly></span><br>
		</div>
		
		<div>
		<h3>상품명</h3>		
		<span class='box'><input type="hidden"class='textBox' id = "postNo" value="${tranList.postNo }"readOnly>
		<input type="text"class='textBox' id="postTitle" value=""readOnly></span><br>
		</div>
		
		<div>
		<h3>판매자</h3>		
		<span class='box'><input type="hidden"class='textBox' value="${tranList.sellerNo }"readOnly>
		<input type="text"class='textBox' id="searchmemId" value=""readOnly>
		</span><br>
		</div>
		
		<div>
		<h3>구매자</h3>		
		<span class='box'><input type="hidden"class='textBox' value="${tranList.memNo }"readOnly>
		<input type="text"class='textBox' value="${sessionScope.sid }"readOnly></span><br>
		</div>
		
		<div>
		<h3>가격</h3>		
		<span class='box'><input type="text" class='textBox' value="${tranList.tranPrice }"readOnly></span><br>
		</div>
		
		<div>
		<h3>거래일</h3>		
		<span class='box'><input type="text"  class='textBox' value="${tranList.tranDate }"readOnly></span><br>
		</div>
		
		<div>
		<h3>택배 거래 주소</h3>		
		<div id="map" style="width:720px;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=475eae8079274f19f0fdcfd11cb97d05&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${tranList.tranAddress}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">배송 도착 장소</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    

window.onload = function () {
	SearchMemIDAjax();
	SearchTitleAjax();


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

function SearchTitleAjax() {
	console.log($('#postNo').val());
	$.ajax({
		type:"post",
		url:"/searchTitle",
		data:{postNo:$('#postNo').val()},
		dataType:'text',
		success: function(result) {
			$('#postTitle').val(result);
			console.log(result);

		},
		error: function(result, textStatus) {
			console.log(result + textStatus);
			alert("상품명 불러오기 에러");
		}
	});
}





</script>
		</div>

		
	</div>
	</div>
	</div>
	</div>
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
</html>