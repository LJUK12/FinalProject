<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post</title>
<link href='/css/detailViewPost.css' rel="stylesheet" type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/detailViewPost.js'/>"></script>


</head>
<body>
	<!-- TOP -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />


	<div id="mainIndexBox">
		<div id="wrap2">

			<br> <br> <br> <br> <br> <br>
			<h1>${post.postTitle}</h1>
			<br>
			<div class="topmem" id="searchmemId"></div>
			<p>${post.postDate }</p>
			<br>


			<div id="tagtop">
				<img src="/image/tag.png" id="tagimg"> 상품태그
				<p class="tagbutton">#${post.postTag}</p>
			</div>
			<br> <input type="hidden" id="postPrice"
				value="${post.postPrice}">
			<div id="postPriceText"></div>
			<br> <br> <br>
			<p id="content">${post.postContent }</p>
			<br> <br> <br>
			
			<c:if test="${post.postWay eq '직거래' }">
			<h3>거래 장소</h3>
			<!-- 지도 테스트 -->
			<div id="map" style="width: 100%; height: 350px;"></div>
			</c:if>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=475eae8079274f19f0fdcfd11cb97d05&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								'${post.postMap}',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">${post.postMap}</div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
			</script>
			<br>
			<br>
			<br> <input type="hidden" name="postWay" id="postWay"
				value="${post.postWay}">

			<div id="subfunction">

				<div id="favoritbtn">
					<img src="/image/likeit.png" id="favoritimg"> <input
						type="text" id="favorit" value="${post.postFavorit }" readonly>
					<c:if test="${not empty sessionScope.sid }">
						<button id="favoritPost" value="${favoritPost }">
							<img id="favoritPostimg" src="/image/별.png">
						</button>
					</c:if>
					<input type="hidden" name="memNo" class="memNo"
						value="${sessionScope.No}">

					<c:if test="${not empty sessionScope.sid }">
						<c:if test="${post.postState eq '판매중' }">
							<div id="contentbtn">
								<c:if test="${post.memNo ne sessionScope.No}">
									<div class="buybtn">
										<img src="/image/장바구니.png" class="chatbtnimg"> <input
											type="button" id="buy" value="구매">
									</div>
								</c:if>

								<div class="deletebtn">
									<img src="/image/삭제.png" class="chatbtnimg"> <input
										type="button" id="delete" value="삭제">
								</div>
							</div>
						</c:if>
					</c:if>


				</div>

				<br> <br>

				<hr class="contenthr">

				<br> <br>


				<article>

					<div id="hotItemsSection">
						<h2>댓글</h2>

						<br> <br>

						<form id="Chatting">


							${sessionScope.sid} <input type="hidden" name="postNo"
								id="postNo" value="${post.postNo }"> <input
								type="hidden" name="memNo" id="memNo" value="${sessionScope.No}">
							<input type="hidden" name="memid" id="memid"
								value="${sessionScope.sid}">
							<div>
								<br> <input type="text" id="chatContent" name="chatContent"
									placeholder="로그인 후 입력하세요">
							</div>
							<%-- <fmt:formatDate value="${chat.chatDate }"  pattern="YY.MM.dd yy:hh:ss"/> --%>
							<!-- <div style="margin-left: 10px;"><a id="insertchat">입력</a></div> -->
							<div id="chatbottom">
								<div id="chatsubmitbtn">
									<img src="/image/chatbtn.png" class="chatbtnimg"> <input
										type="submit" value="등록" id="chatsubmit">
								</div>
							</div>

						</form>

						<br> <br>

						<div id="chatList">

							<c:forEach items="${chatList}" var="chat">

								<br>
								<p>${chat.memId }</p>
								<p class="chatingDate" id="chatid">
									<fmt:formatDate value="${chat.chatDate }"
										pattern="YY.MM.dd hh:ss" />
								</p>
								<p>${chat.chatContent }</p>
								<br>
								<hr class="chathr">

							</c:forEach>

						</div>

					</div>
				</article>



				<article>
					<div id="hotItemsSection">

						<h2>오늘의 hot 상품</h2>
						<br>
						<div class="hotItemGroup" style="margin-left: 0">
							<!-- 마진 레프트 제거 -->
							<ul class="class-list" data-position="0">
								<c:forEach items="${postList2}" var="pt" end="2">
									<div>
										<div class="class-card">
											<a href="/post/detailViewPost/${pt.postNo}"> <img
												src="/resource/photo_upload/${pt.postImg }" alt="top1"
												class="class-image" />
											</a>
										</div>
										<div class="class-container">
											<div class="class-skill">
												<div class="class-format">지역</div>
												<div class="class-format2">${pt.postState}</div>
												<div class="class-format3">
													<h5>${pt.postWay}</h5>
												</div>
												<div>
													<i class="fa-solid fa-heart"></i>: ${pt.postFavorit}
												</div>
											</div>
											<div class="class-skill">
												<div>
													<h4>판매가:&nbsp; ${pt.postPrice }원</h4>
												</div>
												&ensp;&ensp;&ensp;&ensp;
											</div>
											<hr>
											<div class="class-skill2">
												<p class="information">${pt.postTitle}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</ul>
						</div>
				</article>
			</div>

		</div>
	</div>


	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />

</body>
</html>