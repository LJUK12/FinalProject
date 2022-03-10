<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">
   <title>검색하기</title>
   
   <link href="<c:url value='/css/searchPost.css'/>" rel="stylesheet" type="text/css">
   
</head>
   <body>
   <div id="wrap">
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
   		<br><br><br>
      <div class="searchDiv">
         <br>
         검색내용 : 
         <c:if test="${not empty resultStr}">
            <span id="resultStrValue">${resultStr }</span>
         </c:if>
         <c:if test="${empty resultStr}">
            <span id="resultStrValue">검색 키워드 없음</span>
         </c:if><br><br>
         <h3>제목&내용 검색 결과</h3>
      </div>

      <c:if test="${not empty titleCntPostVO }">
      <div class="searchDiv" style="text-align:right; margin-right: 120px;"><a href="/allContentSearchPost/${resultStr}">전체보기 ></a></div>
      
      <div id="hotItemsSection">
      <div class="searchResBox">

              <ul class="class-list" data-position="0">
                   <c:set var="postNum" value="0"/>
                   <c:set var="breakPostNum" value="0"/>
                 <c:forEach items="${titleCntPostVO }" var="post">
                    <c:if test="${breakPostNum ne 2}">
                       <div>
							<div class="class-card">
								<a href="/post/detailViewPost/${post.postNo}"> 
								<c:if test="${not empty post.postImg }">
								<img src="/resource/photo_upload/${post.postImg }" alt="top1"
									 class="class-image" 
									  onError="javascript:this.src='/image/checkbox_01.png'"/>
								</c:if>
								<c:if test="${empty post.postImg }">
								<img src="/image/checkbox_01.png" alt="top1"
									 class="class-image" />
								</c:if>
								</a>
							</div>
							<div class="class-container">
								<div class="class-skill">
									<div class="class-format">지역</div>
									<div class="class-format2">${post.postState}</div>
									<div class="class-format3"><h5>${post.postWay}</h5></div>
									<div>
										<i class="fa-solid fa-thumbs-up"></i>: ${post.postFavorit} 
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
						<c:set var="postNum" value="${postNum + 1}"/>
                   </c:if>

                        
                   <c:if test="${postNum eq 5}">
                         <c:set var="postNum" value="0"/>
                         <c:set var="breakPostNum" value="${breakPostNum + 1}"/>
                         </ul>
                         </div>
                         <div class="searchResBox">
                         <ul class="class-list" data-position="0">
                   </c:if>
                  </c:forEach>
               </ul>
            </div>
           </div>

      </c:if>
      
      <c:if test="${empty titleCntPostVO }">
      	 <div class="searchDiv">
         <br>
         <p>검색결과가 없습니다.</p>
         <br>
         </div>
      </c:if>
      
      <br><br><br><hr><br><br>
		
	<div class="searchDiv">
         <h3>카테고리 검색 결과</h3>
      </div>

      <c:if test="${not empty searchPostVO }">
      <div class="searchDiv" style="text-align:right; margin-right: 120px;"><a href="/allCateorySearchPost/${resultStr}">전체보기 ></a></div>
      
      <div id="hotItemsSection">
      <div class="searchResBox">

              <ul class="class-list" data-position="0">
                   <c:set var="postNum" value="0"/>
                   <c:set var="breakPostNum" value="0"/>
                 <c:forEach items="${searchPostVO }" var="post">
                    <c:if test="${breakPostNum ne 2}">
                       <div>
							<div class="class-card">
								<a href="/post/detailViewPost/${post.postNo}"> 
								<c:if test="${not empty post.postImg }">
								<img src="/resource/photo_upload/${post.postImg }" alt="top1"
									 class="class-image" 
									  onError="javascript:this.src='/image/checkbox_01.png'"/>
								</c:if>
								<c:if test="${empty post.postImg }">
								<img src="/image/checkbox_01.png" alt="top1"
									 class="class-image" />
								</c:if>
								</a>
							</div>
							<div class="class-container">
								<div class="class-skill">
									<div class="class-format">지역</div>
									<div class="class-format2">${post.postState}</div>
									<div class="class-format3"><h5>${post.postWay}</h5></div>
									<div>
										<i class="fa-solid fa-thumbs-up"></i>: ${post.postFavorit} 
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
						<c:set var="postNum" value="${postNum + 1}"/>
                   </c:if>

                        
                   <c:if test="${postNum eq 5}">
                         <c:set var="postNum" value="0"/>
                         <c:set var="breakPostNum" value="${breakPostNum + 1}"/>
                         </ul>
                         </div>
                         <div class="searchResBox">
                         <ul class="class-list" data-position="0">
                   </c:if>
                  </c:forEach>
               </ul>
            </div>
           </div>

      </c:if>
      
      <br><hr>
      <!-- BOTTOM -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		</div>
   </body>
</html>