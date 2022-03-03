<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Post</title>
		<link href='/css/detailViewPost2.css' rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/detailViewBoard.js'/>"></script>

	</head>
	<body>
		<!-- TOP --> 
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="mainIndexBox">	
			<div id="wrap2">
			<br><br><br><br><br><br>
			<h1>${board.comTitle}</h1><br>
			<h4>${sessionScope.sid} &ensp;| &ensp;&ensp; ${board.comDate }</h4><br><hr>
			<div class="topmem" id="searchmemId"></div><br>
			<br><br>
			<p id="content">${board.comContent}</p>
			<br><br><br>
			<%-- <p id="bottomid">${post.memNo}</p> --%>
			
			<div id="subfunction">

			</div>  <br><br><hr>		
			<article>	
				<div id="hotItemsSection">
		           	<h3>전체 댓글</h3><hr> 
		           	<br><br>
		           	<div id="chatList" >	
						<c:forEach items="${chatList}" var="chat">				 
			                        ${chat.memId }: &ensp;&ensp;&ensp;
			                        ${chat.chatContent }<br><hr id="chathr"><br>              
			            </c:forEach>
					</div><hr><br>
			
		           	<form id="Chatting">
		        		작성자: ${sessionScope.sid}
		        		<input type="hidden" name="comNo" id="postNo" value="${board.comNo}">
						<input type="hidden" name="memNo" id="memNo" value="${sessionScope.No}">
						<input type="hidden" name="memid" id="memid" value="${sessionScope.sid}">		
		        		<div><br>
		        			<textarea cols="50" rows="5" id="chatContent" name="chatContent" placeholder="댓글 작성"></textarea>
						</div>
						<input type="submit" id="submitButtom" value="입력">
					</form>	 <br>
				</div>
			</article><hr>
		</div><br><br>
		<article>
			<div class="btn_wrap">
				<button class="btn" id="list_btn">목록 페이지</button> 
				<button class="btn" id="modify_btn">수정 하기</button>
				<button class="btn" id="delete_btn">삭제</button>
			</div>
		</article>
		
		<form id="infoForm" action="/board/modify" method="get">
			<input type="hidden" id="comNo" name="comNo" value='<c:out value="${board.comNo}"/>'>
			<input type="hidden" id="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" id="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" id="type" value='<c:out value="${cri.type}"/>'>
			<input type="hidden" id="keyword" value='<c:out value="${cri.keyword}"/>'>
		</form>
		
		</div>
		
		
		<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		<script>
		
				let form = $("#infoForm");
				
				$("#list_btn").on("click", function(e){
					form.find("#comNo").remove();
					form.attr("action", "/board/list");
					form.submit();
				});
				
				$("#modify_btn").on("click", function(e){
					form.attr("action", "/board/modify");
					form.submit();
				});	
				
				/* 삭제 버튼 */
			    $("#delete_btn").on("click", function(e){
			    	alert("삭제하시겠습니까?")
			        form.attr("action", "/board/delete");
			        form.attr("method", "post");
			        form.submit();
			    });
		
		</script>	
	</body>
</html>