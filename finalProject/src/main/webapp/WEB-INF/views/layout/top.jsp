<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="<c:url value='/css/index.css'/>" rel="stylesheet"
   type="text/css">
<link href="<c:url value='/css/common.css'/>" rel="stylesheet"
   type="text/css">
<link href="<c:url value='/css/menuNav.css'/>" rel="stylesheet"
   type="text/css">
<link href="<c:url value='/css/section.css'/>" rel="stylesheet"
   type="text/css">
<link href="<c:url value='/css/index-modal.css'/>" rel="stylesheet"
   type="text/css">

<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/searchPost.js'/>"></script>
<script src="<c:url value='/js/main.js'/>"></script>
<script src="<c:url value='/js/menuNav.js'/>"></script>
<script src="<c:url value='/js/mainBanner.js'/>"></script>
<script src="<c:url value='/js/object.js'/>"></script>

<script src="https://kit.fontawesome.com/2d323a629b.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous">

</head>
<body id="topBody">
   <header>
      <jsp:include page="/WEB-INF/views/layout/chatbot.jsp" flush='true' />
      
     <div id="my_modal">
            <div>
               <h3>이미지 검색</h3>
               <form id="objectDtectForm" enctype="multipart/form-data">
                  파일 가져오기<br> <input type="file" id="uploadFile" name="uploadFile"> 
                  <div>
                     <input class="modal_submit" type="submit" value="결과 확인">
                  </div>
               </form>
            </div>
            <a class="modal_close_btn">닫기</a>
           </div>

      <div id="header">
         <div id="mainLogo">
            <!-- 메뉴 : 로그인 하지 않은 경우  -->
            <c:if test="${empty sessionScope.sid }">
               <a href="<c:url value='/join'/>">회원가입</a>
               <a href="<c:url value='/login'/>">로그인</a>
            </c:if>

            <!-- 메뉴 : 로그인 한 경우  -->
            <c:if test="${not empty sessionScope.sid}">
               <c:if test="${sessionScope.sgrade eq '운영자'}">
                  <a href="<c:url value='/rootManager'/>"><h2>관리자</h2></a>
               </c:if>
               <a href="<c:url value='/logout'/>">로그아웃</a>
               <a href="<c:url value='/myFavorit'/>">즐겨찾기</a>
               <a href="<c:url value='/myPageForm'/>">${sessionScope.sid}님의
                  마이페이지</a>
            </c:if>
         </div>
         <hr />
         <a href="<c:url value='/'/>">
               <br><br><h1 id="mainName">BaNaDa</h1></a>
         </div>
   </header>

   <div class="cell">
      <div id="firstName">
         <button type="button" class="mobile-menu"><i class="fas fa-bars"></i></button>
         <div class="menuwrap">
            <nav>
			  <ul id="main_menu">
			    <li><a id="navA" href="#"><h2>지역</h2></a>
			    <ul class="snd_menu sub_menu">
			      <li><a id="navA" href="/list?a=서울특별시">서울</a></li>
			      <li><a id="navA" href="/list?a=세종">세종</a></li>
			      <li><a id="navA" href="/list?a=인천">인천</a></li>
			      <li><a id="navA" href="/list?a=대전">대전</a></li>
			      <li><a id="navA" href="/list?a=대구">대구</a></li>
			      <li><a id="navA" href="/list?a=광주">광주</a><li>
			      <li><a id="navA" href="/list?a=울산">울산</a><li>
			      <li><a id="navA" href="/list?a=부산">부산</a><li>
			      <li><a id="navA" href="/list?a=경기도">경기도</a><li>
			      <li><a id="navA" href="/list?a=강원도">강원도</a><li>
			      <li><a id="navA" href="/list?a=충청북도">충청북도</a><li>
			      <li><a id="navA" href="/list?a=충청남도">충청남도</a><li>
			      <li><a id="navA" href="/list?a=전라북도">전라북도</a><li>
			      <li><a id="navA" href="/list?a=전라남도">전라남도</a><li>
			      <li><a id="navA" href="/list?a=경상북도">경상북도</a><li>
			      <li><a id="navA" href="/list?a=경상남도">경상남도</a><li>
			      <li><a id="navA" href="#">제주도</a>
			        <ul class="trd_menu sub_menu">
			          <li><a id="navA" href="#">Hue</a></li>
			          <li><a id="navA" href="#">Saturation</a></li>
			          <li><a id="navA" href="#">Value</a></li>
			      </ul>
			      </li>
			    </ul>
			    </li><hr><br>
			    <li><a id="navA" href="<c:url value='/myPageForm'/>"><h2>내정보</h2></a></li><hr><br>
			    <li><a id="navA" href="<c:url value='/board/list'/>"><h2>커뮤니티</h2></a></li><hr><br>
			    <li><a id="navA" href="<c:url value='/'/>"><h2>Home</h2></a></li><hr><br>
			  </ul>
			</nav>
         </div>
            
            <h2 id="naming">&ensp;&ensp;&ensp;&nbsp;카테고리&ensp;&ensp;&ensp;&ensp;&ensp;</h2>
         <article>
            <div id="SearchBarBox">
               <div id="SearchBar">
                  <div>
                     <input onkeyup="searchEnterkey();" type="text"
                        id="searchBarInput" name="searchBarInput" placeholder="검색어 입력">
                  </div>
                  <span><i class="fas fa-times" id="searchBarRemove"></i></span>
                  <div style="margin-left: 10px;">
                     <a id="searchPost">검색</a>
                  </div>
                  <div><button id="popup_open_btn">IMG</button></div>
               </div>
            </div>
         </article>
         <a id="naming5A" href="<c:url value='/join'/>"><i class="fas fa-shopping-cart fa-2x naming5"></i>&ensp;&ensp;</a> 
         <a href="<c:url value='/myPageForm'/>"><br><br><h3 class="naming2">회원정보 &ensp;&ensp;&nbsp;</h3></a>
            <hr id="hr2">
         <a href="<c:url value='/board/list'/>"><br><br><h3 class="naming3">커뮤니티 &ensp;&ensp;&nbsp;</h3></a>
            <hr id="hr2">
         <a href="<c:url value='/insertPostForm'/>"><br><br><h3 class="naming4">&ensp;상품 판매</h3></a>
      </div>
   </div>

   <aside id="aside1">
      <a href="/login"><br>
         <p class="asideNaming">로그인</p> <i class="fas fa-sign-in-alt fa-2x"></i>
      </a><br> <br> <br> 
      <a href="/logout">
         <p class="asideNaming">로그아웃</p> <i class="fas fa-sign-out-alt fa-2x"></i>
      </a><br> <br> <br> 
      <a href="/board/list">  
         <p class="asideNaming">커뮤니티</p> <i class="fa-solid fa-chalkboard-user fa-2x"></i>
      </a><br> <br> <br> 
      <a href="/myFavorit">
         <p class="asideNaming">즐겨찾기</p> <i class="fa-solid fa-star fa-2x"></i>
      </a><br> <br>
   </aside>
   <br>
  <script src="<c:url value='/js/index_modal.js'/>"></script>
</body>
</html>