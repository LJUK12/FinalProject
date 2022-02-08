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
		<script src="<c:url value='/js/insertchat2.js'/>"></script>
	</head>
	<body>
<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="mainIndexBox">
		<div id="wrap">
			
				<br><br><br>
				<h1>${post.postTitle}</h1><br>
				<p class="topmem">${post.memNo } · ${post.postDate}</p><br>
				<div id="tagtop">
					<p class="tagbutton">${post.postTag}</p>
				</div>
				<br><br>
				<p id="content">${post.postContent }</p>
				<br><br><br>
				<p id="bottomid">${post.memNo}</p>
				
				<br><br>

				<hr>
				
				<br><br>
				
				
			<article>
			
				<div id="hotItemsSection">
	           	<h2>댓글</h2>
	           	
	           	<br><br>
	          
	           	<form id="Chatting">
	           	
	           	
	           		${sessionScope.No}
	        		${sessionScope.sid}
	        		<input type="hidden" name="postNo" id="postNo" value="${post.postNo }">
					<input type="hidden" name="memNo" id="memNo" value="${sessionScope.No}">	
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
					 
		                        <p>${chat.memNo }</p>
		                        <p>${chat.chatContent }</p><br>
		                          
		            </c:forEach>
		             
				</div>
				
				
				
				
				
				
				</div>
				</article>	
				
				
                <article>
	                <div id="hotItemsSection">
	                 
	                    <h2>오늘의 hot 상품</h2>
	                    <div class="hotItemGroup">
	                    <ul class="class-list" data-position="0">
	                    <c:forEach items="${postList2 }" var="pt2" end="3">
	                        
	                            <li class="class-card">
	                                <img src="/resource/photo_upload/${pt2.postImg }" alt="top1" class="class-image" />
	                                <a href="/post/detailViewPost/${pt2.postNo}" target="_blank">
	                                    <div class="class-container">
	                                        <div class="class-skill">
	                                        <div class="class-type">${pt2.postTag}</div>
	                                        <div class="class-format">Best1</div>
	                                        </div>
	                                        <div class="class-desc">
	                                        <div class="class-title">${pt2.postTitle}</div>
	                                        <div class="class-detail">${pt2.postState}</div>
	                                        </div>
	                                    </div>
	                                </a>
	                            </li>
	                           
	                   </c:forEach>
	                   </ul>
	                </div>
	            </article>	       
			
		</div>
		</div>
	</body>
</html>