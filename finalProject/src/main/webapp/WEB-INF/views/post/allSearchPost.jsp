<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Post</title>
      <link href='/css/detailViewPost.css' rel="stylesheet" type="text/css">
      <link href="<c:url value='/css/searchPost.css'/>" rel="stylesheet" type="text/css">
   </head>
   <body>

      <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

      <div id="wrap">
         <c:if test="${not empty searchPostVO }">
         <h3 style="text-align: center;">검색결과 전체 보기</h3>
         <div id="hotItemsSection">
         <div class="hotItemGroup">
         
                 <ul class="class-list" data-position="0">
                   <c:set var="postNum" value="0"/>
                   <c:set var="breakPostNum" value="0"/>
                 <c:forEach items="${searchPostVO }" var="post">
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

                        
                   <c:if test="${postNum eq 5}">
                         <c:set var="postNum" value="0"/>
                         </ul>
                         </div>
                         <div class="hotItemGroup">
                         <ul class="class-list" data-position="0">
                   </c:if>
                  </c:forEach>
               </ul>
               </div>
              </div>
           </c:if>
           
         <c:if test="${empty searchPostVO }">
            <br>
            <p>검색결과가 없습니다.</p>
            <br>
         </c:if>

         <!-- BOTTOM -->
         <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
      </div>



   </body>
</html> 