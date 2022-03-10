<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/css/myPageMenu.css'/>" rel="stylesheet" type="text/css">
</head>
<body>

<div id="wrap">
	<!-- TOP -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
	<br><br>

	<div id="paging2">
				<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true'/>
				<div><br><br><br><br>

				<h3 id="fav">내가 판매한 상품</h3>

				<article>
				<div class="hotItemGroup2">
					<ul class="class-list5" data-position="0">
						<c:set var="postNum" value="0" />
						<c:forEach items="${postList}" var="post">
						<div> 
							<div>
								<div class="class-card">
									<a href="/post/detailViewPost/${post.postNo}"> 
									<img src="/resource/photo_upload/${post.postImg }" alt="top1"
										 class="class-image" />
									</a>
								</div>
								<div class="class-container">
									<div class="class-skill">
										<div class="class-format">지역</div>
										<div class="class-format2">${post.postState}</div>
										<div class="class-format3"><h5>${post.postWay}</h5></div>
										<div>
											<i class="fa-solid fa-heart"></i>: ${post.postFavorit} 
										</div>
									</div>
									<div class="class-skill">
										<div><h4>판매가:&nbsp; ${post.postPrice }원</h4></div>&ensp;&ensp;&ensp;&ensp;
									</div><hr>
									<div class="class-skill2"> 
										<p class="information">${post.postTitle}</p>
									</div>
								</div>
							</div>
						</div>
						<c:set var="postNum" value="${postNum + 1}" />
						<c:if test="${postNum eq 5}">
						<c:set var="postNum" value="0" />
					</ul>
				</div>
				<div class="hotItemGroup2">
					<ul class="class-list5" data-position="0">
						</c:if>
						</c:forEach>
					</ul> 
	 </article>
		<br>
	
		
		<div id="pageForm" align="center">
		<c:if test="${startPage != 1}">
		            <a href="<c:url value='/myPostList/${startPage-1 }'/>">[ 이전 ]</a>
		        </c:if>
		        
		        <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
		            <c:if test="${pageNum == spage}">
		                ${pageNum}&nbsp;
		            </c:if>
		            <c:if test="${pageNum != spage}">
		                <a href="<c:url value='/myPostList/${pageNum }'/>">${pageNum}&nbsp;</a>
		            </c:if>
		        </c:forEach>
		        
		        <c:if test="${endPage != maxPage }">
		            <a href="<c:url value='/myPostList/${endPage+1 }'/>">[다음]</a>
		        </c:if>
		</div>
		</div>
		
	<!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>		
</div>		
</div>
</body>
</html>