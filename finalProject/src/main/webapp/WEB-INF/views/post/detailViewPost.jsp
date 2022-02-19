<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

				<br><br><br><br><br><br>
				<h1>${post.postTitle}</h1><br>
				<div class="topmem" id="searchmemId"></div><br>
				<div id="tagtop">
					<p class="tagbutton">${post.postTag}</p>
				</div>
				<br><br>
				<p id="content">${post.postContent }</p>
				<br><br><br>
				<%-- <p id="bottomid">${post.memNo}</p> --%>
				
				<div id="subfunction">
				
				<div id="favoritbtn"><img src="/image/likeit.png" id="favoritimg">
				<input type="text" id="favorit"value="${post.postFavorit }"readonly>
				<button id="favoritPost" value="${favoritPost }">즐겨찾기</button>
				

				<input type="button" id="buybtn" value="구매하기">

				
				</div>
				
				<br><br>

				<hr>
				
				<br><br>
				
				
			<article>
			
				<div id="hotItemsSection">
	           	<h2>댓글</h2>
	           	
	           	<br><br>
	          
	           	<form id="Chatting">
	           	
	           	
	        		${sessionScope.sid}
	        		<input type="hidden" name="postNo" id="postNo" value="${post.postNo }">
					<input type="hidden" name="memNo" id="memNo" value="${sessionScope.No}">
					<input type="hidden" name="memid" id="memid" value="${sessionScope.sid}">		
	        		<div>
						<input type="text" id="chatContent" 
						name="chatContent" placeholder="입력">
					</div>
	        	    <%-- <fmt:formatDate value="${chat.chatDate }"  pattern="YY.MM.dd yy:hh:ss"/> --%>
	        		<!-- <div style="margin-left: 10px;"><a id="insertchat">입력</a></div> -->
	        		<input type="submit" value="입력">
					
				
				</form>
				
				
				
				
				
				<br><br>
				
				<div id="chatList" >
					
					<c:forEach items="${chatList}" var="chat">
					 
		                        <p>${chat.memId }</p>
		                        <p>${chat.chatContent }</p><br>
		                          
		            </c:forEach>
		             
				</div>
				
				
				
				
				
				
				</div>
				</article>	
				
				
              
			  <article>
	                <div id="hotItemsSection">
	                 
	                    <h2>오늘의 hot 상품</h2><br>
	                    <div class="hotItemGroup" style="margin-left:0">
	                    <!-- 마진 레프트 제거 -->
	                   <ul class="class-list" data-position="0">
								<c:forEach items="${postList2}" var="pt" end="2">
									<div>
										<div class="class-card">
											<a href="/post/detailViewPost/${pt.postNo}"> 
											<img src="/resource/photo_upload/${pt.postImg }" alt="top1"
												 class="class-image" />
											</a>
										</div>
										<div class="class-container">
											<div class="class-skill">
												<div class="class-format">지역</div>&ensp;
												<div class="class-format2">${pt.postState}</div>
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