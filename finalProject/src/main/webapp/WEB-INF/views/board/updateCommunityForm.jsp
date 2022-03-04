<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
	
	<script type="text/javascript" src="/smarteditor2/js/HuskyEZCreator.js"charset="utf-8"></script>
	
	<link href="<c:url value='/css/insertPost.css'/>" rel="stylesheet" type="text/css">
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

		
	<script>

		$(document).on('click','#btnList',function(e) {
			e.preventDefault();
			location.href = "${pageContext.request.contextPath}/board/getBoardList";
		});

	</script>
</head>
<body>
	<!-- TOP  -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

	<br>
	<br>
	<br>
	<br>
	<div id="wrap">
		<div id="postWrap">
			<aside id="postAside">
			<div id="postImg">
				<i class="fa fa-camera fa-border fa-5x"></i><br><br>
			</div>
			<div id="loginMenu">
				<!-- 메뉴 : 로그인 하지 않은 경우  -->
				<c:if test="${empty sessionScope.sid }">
                    <p>게시글 작성을 위해서는</p>
                    <p>로그인이 필요합니다.</p> <hr>
                    <a href="<c:url value='/login'/>">로그인</a>
				</c:if>
		
				<!-- 메뉴 : 로그인 한 경우  -->	
				<c:if test="${not empty sessionScope.sid}"> 
					<a href="<c:url value='/myFeed'/>">${sessionScope.sid}</a>
				</c:if>
				<br><br>
			</div>
						
			</aside>
				<article>
					<div class="container" role="main">
					<div id="inner1"><h2 id="postMain">게시글 수정</h2><br></div>
					<div class="container2">		
						<form id="modifyForm" method="post" action="/board/modify"
							enctype="multipart/form-data" onsubmit="submitContents()">
							
							<div class="input_wrap">
								<label>게시글 번호: </label>
								<input name="comNo" id="memNo" readonly="readonly" value='<c:out value="${pageInfo.comNo}"/>' >
							</div>
							
							<div class="postWrite">
								<div class="mb-3">
									<input type="text"
										class="form-control1" name="comTitle" id="comTitle"
										placeholder="제목을 입력해 주세요" value='<c:out value="${pageInfo.comTitle}"/>'>
									<br> 
									<label for="reg_id">작성자: </label> <input type="text"
										class="form-control2" name="memNo" id="memNo" style="width: 80px;"
										value='<c:out value="${pageInfo.memNo}"/>' readonly>
								</div>
			
		
							</div>
								<!-- CONTENT -->
								<div class="mb-3 content">
									<textarea name="comContent" id="comContent" rows="10" cols="90"><c:out value="${pageInfo.comContent}"/></textarea>
									<!-- <div contentEditable="true" id="post_content" class="form-control" >
			
			                            </div> -->
			
									<!-- <textarea class="form-control" rows="5" name="post_content"
			                                id="post_content" placeholder="내용을 입력해 주세요"></textarea> -->
								</div><br><hr id="hrhr">
					
		
								
							<hr id="hrhr">
							<div><br>
								<input type="submit" class="postComplete1" value="수정하기"> 
								<input type="button" class="postComplete2" value="취소" onclick="location.href='<c:url value="/board/list"/>'">
							</div>
						</form>
						</div>
					</div>
				</article>
			</div>
		</div>
	<script type="text/javascript">
		var oEditors = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "comContent",
			sSkinURI : "/smarteditor2/SmartEditor2Skin.html",/* "/package/dist/SmartEditor2Skin.html", */
			fCreator : "createSEditor2"

		});

		function submitContents(elClickedObj) {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["comContent"].exec("UPDATE_CONTENTS_FIELD", []);
			// 에디터의 내용에 대한 값 검증은 이곳에서
			console.log(document.getElementById("comContent").value);
			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	</script>
	<br>

</body>

</html>



