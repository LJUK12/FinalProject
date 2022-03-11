<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4조 최종 프로젝트</title>
<link href="<c:url value='/css/mainBanner.css'/>" rel="stylesheet" type="text/css">

</head>
<body>
   <div id="wrap">
      <!-- TOP -->
      <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

      <div id="mainIndexBox">
         <section>
            <article id="banner">
               <div class="slider-1">
                  <div class="slides">
                     <div class="active"
                        style="background-image: url(image/slide_img_01.jpg);"></div>
                     <div style="background-image: url(image/slide_img_02.jpg);"></div>
                     <div style="background-image: url(image/slide_img_03.jpg);"></div>
                     <div style="background-image: url(image/slide_img_04.jpg);"></div>
                     <div style="background-image: url(image/slide_img_05.jpg);"></div>
                  </div>
                  <div class="page-btns">
                     <div class="active"
                        style="background-image: url(image/slide_img_01.jpg);"></div>
                     <div></div>
                     <div></div>
                     <div></div>
                  </div>
                  <div class="side-btns">
                     <div>
                        <span><i class="fas fa-angle-left"></i></span>
                     </div>
                     <div>
                        <span><i class="fas fa-angle-right"></i></span>
                     </div>
                  </div>
               </div>
            </article><br><br>
            
         
            <!-- 카테고리 1 -->
            <article>
               <div id="hotItemsSection1">
                  <div class="hotItemGroup1">
                     <ul class="class-list" data-position="0">
                        <div>
                           <div>
                              <li class="class-card3"><img src="image/baseline_room_black_24dp.png" 
                                 alt="top1" class="class-image2" /> 
                                 <a
                                 href="/post/detailViewPost/${1006 }" target="_blank"></a></li>
                           </div>
                           <h4 align="center">지역별 장터</h4>
                        </div>
                        <div>
                           <div>
                              <li class="class-card3"><img src="image/baseline_contact_phone_black_18dp.png" alt="top1"
                                 class="class-image2" /> <a
                                 href="/post/detailViewPost/${1006 }" target="_blank"></a></li>
                           </div>
                           <h4 align="center">고객센터</h4>
                        </div>
                        <div>
                           <div>
                              <li class="class-card3"><img src="image/baseline_local_fire_department_black_24dp.png" alt="top1"
                                 class="class-image2" /> <a
                                 href="/post/detailViewPost/${1006 }" target="_blank"></a></li>
                           </div>
                           <h4 align="center">지역 best</h4>
                        </div>
                        <div>
                           <div>
                              <li class="class-card3"><img src="image/baseline_attach_money_black_24dp.png" alt="top1"
                                 class="class-image2" /> <a
                                 href="/post/detailViewPost/${1006 }" target="_blank"></a></li>
                           </div>
                           <h4 align="center">시세조회</h4>
                        </div>
                        <div>
                           <div>
                              <li class="class-card3"><img src="image/baseline_safety_divider_black_24dp.png" alt="top1"
                                 class="class-image2" /> <a
                                 href="/post/detailViewPost/${1006 }" target="_blank"></a></li>
                           </div>
                           <h4 align="center">안심거래</h4>
                        </div>
                        <div>
                           <div>
                              <li class="class-card3"><img src="image/baseline_shopping_basket_black_24dp.png" alt="top1"
                                 class="class-image2" /> <a
                                 href="/post/detailViewPost/${1006 }" target="_blank"></a></li>
                           </div>
                           <h4 align="center">전체상품</h4>
                        </div>
                     </ul>
                  </div>
               </div>
            </article><br><br>
            
            <!-- 두번째 상품 list -->
            <article>
               <div id="hotItemsSection4">
                  <h1 class="productTag"><br>&ensp;지역별 상품목록</h1><br>
                     <div class="hotItemGroup2">
                        <ul class="class-list" data-position="0">
                           <c:set var="postNum" value="0" />
                           <c:forEach items="${list}" var="list">
                           <div> 
                              <div>
                                 <div class="class-card"> 
                                    <a href="/post/detailViewPost/${list.postNo}"> 
                                    <img src="/resource/photo_upload/${list.postImg }" alt="top1"
                                        class="class-image" />
                                    </a>
                                 </div>
                                 <div class="class-container">
                                    <div class="class-skill">
                                       <div class="class-format">지역</div>
                                       <div class="class-format2">${list.postState}</div>
                                       <div class="class-format3"><h5>${list.postWay}</h5></div>
                                       <div>
                                          <i class="fa-solid fa-thumbs-up"></i>: ${list.postFavorit} 
                                       </div>
                                    </div> 
                                    <div class="class-skill">
                                       <div><h4>판매가:&nbsp; ${list.postPrice }원</h4></div>&ensp;&ensp;&ensp;&ensp;
                                    </div><hr>
                                    <div class="class-skill2"> 
                                       <p class="information">${list.postTitle}</p>
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
                        <ul class="class-list" data-position="0">
                           </c:if>
                           </c:forEach>
                        </ul>
                      </div>
                   </div>
                </article>
            </section>
         </div>

         <!-- BOTTOM -->
         <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
      </div>
   </body>
</html>