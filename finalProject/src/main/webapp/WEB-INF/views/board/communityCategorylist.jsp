<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
  <link href="<c:url value='/css/list.css'/>" rel="stylesheet" type="text/css">
  <link href="<c:url value='/css/communityBanner.css'/>" rel="stylesheet" type="text/css">
  
</head>
<body>
<div class="table_wrap">
	<!-- TOP -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
	<br><br>
	<div id="mainIndexBox">
	<section>
		<article id="banner">
			<div class="slider-1">
				<div class="slides">
					<div class="active"
						style="background-image: url(/image/community_slide_05.jpg);"></div>
					<div style="background-image: url(/image/community_slide_02.jpg);"></div>
					<div style="background-image: url(/image/community_slide_03.jpg);"></div>
					<div style="background-image: url(/image/community_slide_04.jpg);"></div>	
				</div>
				<div class="page-btns">
					<div class="active"
						style="background-image: url(/image/slide_img_01.jpg);"></div>
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
		</article><br>
	<div id="startCom">
			<a href="/board/insertCommunityForm" class="top_btn">글쓰기</a>
		<div class="search_wrap">
	        <div class="search_area">
	        	<select name="type">
	                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
	                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
	                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
	                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
	                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
	                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
	                <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
	            </select>    
	            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
	            <button>Search</button>
	        </div>
	    </div>   
	</div>
	<div id="menuBar"> 
			<div class="informationBar"><a href="<c:url value='/board/list'/>">전체목록</a></div>
			<div class="informationBar"><a href="<c:url value='/board/communityCategoryList?comTag=공지사항'/>">공지사항</a></div>
			<div class="informationBar"><a href="<c:url value='/board/communityCategoryList?comTag=구매요청'/>">구매요청</a></div>
			<div class="informationBar"><a href="<c:url value='/board/communityCategoryList?comTag=질문'/>">질문</a></div>
			<div class="informationBar"><a href="<c:url value='/board/communityCategoryList?comTag=리뷰'/>">리뷰</a></div>
		</div>    
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="regdate_width">카테고리</th>
				<th class="title_width">제목</th>
				<th class="regdate_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">조회수</th>
			</tr>
		</thead>
			<c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.comNo}"/></td>
                <td><c:out value="${list.comTag}"/></td>
                <td><a id="title" href="<c:url value='/board/detailViewBoard/${list.comNo}'/>">
                        <c:out value="${list.comTitle}"/>
                    </a>
                </td>
                <td><c:out value="${sessionScope.sid}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.comDate}"/></td>
                <td><c:out value="${list.comHit}"/></td>
            </tr>
            </c:forEach>

	</table>
	
	<div class="pageInfo_wrap" >
        <div class="pageInfo_area">
        	<ul id="pageInfo" class="pageInfo">
        		<!-- 이전페이지 버튼 -->
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                </c:if>
                
	            <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                </c:forEach>

                <!-- 다음페이지 버튼 -->
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                </c:if>    
            </ul>
        </div>
    </div>
 
	<form id="moveForm" method="get"> 
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
       	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">     
       	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
       	<input type="hidden" name="type" value="${pageMaker.cri.type }">
    </form>
    
    
    <script src="<c:url value='/js/list.js'/>"></script>
    
    <!-- BOTTOM -->
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</div>
</body>
</html>